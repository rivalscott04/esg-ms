<?php

namespace App\Http\Livewire;


use App\Models\Pelanggan;
use App\Models\Pertanyaan;
use App\Models\Survey;
use App\Models\SurveyLapangan;
use App\Models\SurveyLapanganDetail;

use App\Models\SurveyPertanyaan;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Livewire\Component;
use Livewire\WithFileUploads;

class StartSurvey extends Component
{
    use WithFileUploads;

    public $surveyId;
    public $started = true;
    public $onGoingSurvey;

    public $selectedQuestion;
    public $pertanyaan;

    public $answers = [];
    public $tambahan = [];

    public $photo;
    public $isFinish = false;

    public $lastAnswer = 1;

    protected $rules = [
        'answers' => 'required',
    ];

    public function mount(Survey $survey)
    {
        $this->onGoingSurvey = $survey;
        $this->pertanyaan = Pertanyaan::query()
            ->with(["jawaban","group"])
            ->orderByRaw('group_id,created_at')
            ->get();

        if($this->onGoingSurvey){
            $survey->update(["is_started"=>true]);
            $this->started = $this->onGoingSurvey->is_started??false;
            $this->goToQuestion($this->onGoingSurvey->surveyPertanyaan()->first()->nomor??1);


            if($this->started)
                $this->selectedQuestion = SurveyPertanyaan::query()
                    ->with(['pertanyaan.jawaban','surveyJawaban'])
                    ->where('survey_id',$this->onGoingSurvey->id)
                    ->orderBy("nomor")
                    ->first();

            $this->lastAnswer = $this->onGoingSurvey->surveyPertanyaan
                ->where('is_saved',1)
                ->sortByDesc('nomor')->first()?->nomor ?? 1;
        }

        $this->start();

    }


    public function render()
    {

        if(isset($this->selectedQuestion))
        {

            $this->answers = $this->selectedQuestion->surveyJawaban->pluck('jawaban');

            foreach ($this->selectedQuestion->surveyJawaban as $item)
            {
                $this->tambahan[$item->jawaban] = $item->tambahan;
            }

        }

        return view('livewire.start-survey');
    }


    public function start()
    {

        $dataPertanyaan = [];
        foreach ($this->pertanyaan??[] as $index=>$item){
            $dataPertanyaan [] = [
                "survey_id" => $this->onGoingSurvey->id,
                "pertanyaan_id" => $item->id,
                "nomor" => $index+1
            ];
        }

        $this->onGoingSurvey->surveyPertanyaan()->upsert($dataPertanyaan,["survey_id","pertanyaan_id"],["nomor"]);

        $this->started = true;
        $this->isFinish = false;
        $this->goToQuestion($this->onGoingSurvey->surveyPertanyaan()->first()->nomor??1);

    }

    public function goToQuestion($nomor)
    {
        $this->selectedQuestion = SurveyPertanyaan::query()
            ->with(['pertanyaan.jawaban','surveyJawaban'])
            ->where('survey_id',$this->onGoingSurvey->id)
            ->where('nomor', $nomor)->first();

    }

    public function save()
    {
        $this->validate();

        if(count($this->answers)>0){


            $surveyPertanyaan = SurveyPertanyaan::find($this->selectedQuestion->id??'');

            $saved = $surveyPertanyaan->update(['is_saved' => 1]);

            $dataJawaban = [];

            foreach ($this->answers as $answer)
            {

                $bobot = $this->selectedQuestion->pertanyaan->jawaban->where('nama',$answer)->first()->bobot??0;

                $dataJawaban[] = [
                    "jawaban" => $answer,
                    "bobot" => $bobot,
                    "tambahan" => $this->tambahan[$answer]??'',
                ];
            }


            if($saved){
                DB::transaction(function () use ($surveyPertanyaan,$dataJawaban) {


                    $surveyPertanyaan->surveyJawaban()->delete();

                    $surveyPertanyaan->surveyJawaban()->createMany($dataJawaban);

                });

                if($this->onGoingSurvey->surveyPertanyaan->count() > $this->selectedQuestion->nomor  ){
                    $this->answers = [];
                    $this->tambahan = [];

                    return $this->goToQuestion($this->selectedQuestion->nomor+1);
                }else{
                    return $this->isFinish = true;
//                    $this->goToQuestion($this->selectedQuestion->nomor);
                }


            }
        }else{
//            $this->goToQuestion($this->selectedQuestion->nomor);
            return $this->emit('showAlert',['type'=>'EMPTY_ANSWER']);
        }
    }

    public function simpanSurvey()
    {
        try {

            Survey::query()
                ->where("id",$this->onGoingSurvey->id)
                ->update([
                "is_completed" => true,
            ]);

            return redirect()->route('admin.survey.index');

        }catch (\Exception $e){
            return redirect()
                ->route('admin.survey.show',$this->onGoingSurvey->id)
                ->withErrors($e->getMessage());
        }
    }

}
