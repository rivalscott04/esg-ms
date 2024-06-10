<?php

namespace App\Services;

use App\Models\Event;
use App\Models\HitungSuara;
use App\Models\Survey;
use App\Models\SurveyJawaban;
use Illuminate\Support\Arr;

class ChartServices
{

    public function genderChart(Event $event) : array
    {
        $surveyJawaban = SurveyJawaban::query()
            ->selectRaw("jawaban name,COUNT(*) y")
            ->whereRelation("survey",["event_id" => $event->id])
            ->whereRelation('pertanyaan',["pertanyaan.id" => "422896aa-3f2a-11ee-9d07-274e137307ca"])
            ->groupBy('jawaban')
            ->get();

        return $surveyJawaban->toArray();
    }

    public function ageChart(Event $event) : array
    {
        $surveyJawaban = SurveyJawaban::query()
            ->selectRaw("jawaban name,COUNT(*) y")
            ->whereRelation("survey",["event_id" => $event->id])
            ->whereRelation('pertanyaan',["pertanyaan.id" => "9a26e811-5cfb-4594-ab16-e434e9e6e683"])
            ->groupBy('jawaban')
            ->get();

        return $surveyJawaban->toArray();
    }

    public function pendidikanChart(Event $event) : array
    {
        $surveyJawaban = SurveyJawaban::query()
            ->selectRaw("jawaban name,COUNT(*) y")
            ->whereRelation("survey",["event_id" => $event->id])
            ->whereRelation('pertanyaan',["pertanyaan.id" => "9a26ea67-3ab7-4e06-8cca-3e4b362c5eca"])
            ->groupBy('jawaban')
            ->get();

        return $surveyJawaban->toArray();
    }

    public function pilihanPartaiChart(Event $event) : array
    {
        $surveyJawaban = SurveyJawaban::query()
            ->selectRaw("jawaban name,COUNT(*) y")
            ->whereRelation("survey",["event_id" => $event->id])
            ->whereRelation('pertanyaan',["pertanyaan.id" => "9a26e8ec-84ec-4eba-a303-59b51f4d0738"])
            ->groupBy('jawaban')
            ->get();

        return $surveyJawaban->toArray();
    }

    public function sebaranRespondenPerKelurahanChart(Event $event) : array
    {
        $dataSurvey = Survey::query()
            ->with('kelurahan')
            ->where('event_id',$event->id)
            ->orderBy('kelurahan_id')
            ->get();

        $chartData["category"] = $dataSurvey->pluck("kelurahan.nama")->unique()->toArray();

        $chartData["series"][] = [
            "name" => "Jumlah Responden",
            "data" => $dataSurvey->groupBy('kelurahan_id')->map->count()->flatten()->toArray()
        ];

        return $chartData;
    }

    public function kenalCalegChart(Event $event) : array
    {
        $surveyJawaban = SurveyJawaban::query()
            ->selectRaw("jawaban name,COUNT(*) y")
            ->whereRelation("survey",["event_id" => $event->id])
            ->whereRelation('pertanyaan',["pertanyaan.id" => "9a26e9f1-862d-480c-9fc2-208b5eb2140a"])
            ->groupBy('jawaban')
            ->get();

        return $surveyJawaban->toArray();
    }

    public function kenalCalegPerKelurahanChart(Event $event) : array
    {
        $dataSurvey = Survey::query()
            ->with('kelurahan')
            ->withWhereHas('surveyJawaban', fn($q) => $q->whereRelation("surveyPertanyaan",["pertanyaan_id"=>"9a26e9f1-862d-480c-9fc2-208b5eb2140a"]))
            ->where('event_id',$event->id)
            ->orderBy('kelurahan_id')
            ->get();

        $kenalCaleg = $dataSurvey->filter(function ($val){
            return $val->surveyJawaban->where('bobot',1)->count() > 0;
        })->values();

        $tidakKenalCaleg = $dataSurvey->filter(function ($val){
            return $val->surveyJawaban->where('bobot',0)->count() > 0;
        })->values();

        $dataKenal = [];
        $dataTidakKenal = [];
        foreach ($dataSurvey->groupBy('kelurahan_id') as $kelId => $data) {
            array_push($dataKenal,$kenalCaleg->where("kelurahan_id",$kelId)->count());
            array_push($dataTidakKenal,$tidakKenalCaleg->where("kelurahan_id",$kelId)->count());
        }

        $chartData["category"] = $dataSurvey->pluck("kelurahan.nama")->unique()->toArray();
        $chartData["series"][] = [
            "name" => "Kenal",
            "data" => $dataKenal
        ];

        $chartData["series"][] = [
            "name" => "Tidak Kenal",
            "data" => $dataTidakKenal
        ];

        return $chartData;
    }

    public function kemauanMemilihChart(Event $event) : array
    {
        $surveyJawaban = SurveyJawaban::query()
            ->selectRaw("jawaban name,COUNT(*) y")
            ->whereRelation("survey",["event_id" => $event->id])
            ->whereRelation('pertanyaan',["pertanyaan.id" => "9a26eb35-d18b-484b-855a-34642e5b4b50"])
            ->groupBy('jawaban')
            ->get();

        return $surveyJawaban->toArray();
    }

    public function kemauanMemilihPerKelurahanChart(Event $event) : array
    {
        $dataSurvey = Survey::query()
            ->with('kelurahan')
            ->withWhereHas('surveyJawaban', fn($q) => $q->whereRelation("surveyPertanyaan",["pertanyaan_id"=>"9a26eb35-d18b-484b-855a-34642e5b4b50"]))
            ->where('event_id',$event->id)
            ->orderBy('kelurahan_id')
            ->get();

        $mauMemilih = $dataSurvey->filter(function ($val){
            return $val->surveyJawaban->where('bobot',1)->count() > 0;
        })->values();

        $tidakMauMemilih = $dataSurvey->filter(function ($val){
            return $val->surveyJawaban->where('bobot',0)->count() > 0;
        })->values();

        $dataMau = [];
        $dataTidakMau = [];
        foreach ($dataSurvey->groupBy('kelurahan_id') as $kelId => $data) {
            array_push($dataMau,$mauMemilih->where("kelurahan_id",$kelId)->count());
            array_push($dataTidakMau,$tidakMauMemilih->where("kelurahan_id",$kelId)->count());
        }

        $chartData["category"] = $dataSurvey->pluck("kelurahan.nama")->unique()->toArray();
        $chartData["series"][] = [
            "name" => "Mau",
            "data" => $dataMau
        ];

        $chartData["series"][] = [
            "name" => "Tidak Mau",
            "data" => $dataTidakMau
        ];

        return $chartData;
    }

    public function issueRespondenChart(Event $event) : array
    {
        $surveyJawaban = SurveyJawaban::query()
            ->selectRaw("jawaban name,COUNT(*) y")
            ->whereRelation("survey",["event_id" => $event->id])
            ->whereRelation('pertanyaan',["pertanyaan.id" => "9a26ec3b-3324-434f-9a54-3e3c594efe9f"])
            ->groupBy('jawaban')
            ->get();

        return $surveyJawaban->toArray();
    }


    public function jumlahSuaraPerTpsChart(Event $event) : array
    {
        $dataHitungSuara = HitungSuara::query()
            ->with(["tps" =>["kabupatenKota","kecamatan","kelurahan"]])
            ->withWhereHas("event",fn($q) => $q->where("id",$event->id))
            ->whereRelation("event",["id"=>$event->id])
            ->get();


        $dataJumlah = [];
        $dataPersen = [];
        $dataTps = [];

        foreach ($dataHitungSuara->groupBy('tps_id') as $tpsId => $data) {

            array_push($dataJumlah,$data->sum("jml_suara"));
            array_push($dataPersen,round($data->sum("jml_suara")/$data->sum("jml_suara_sah") *100,2));
            array_push($dataTps,$data[0]->tps->nama." [ ".$data[0]->tps->kelurahan->nama. " ]");
        }

        $chartData["category"] = $dataTps;
        $chartData["series"][] = [
            "name" => "Jumlah Suara",
            "type" => "column",
            "yAxis" => 1,
            "data" => $dataJumlah
        ];

        $chartData["series"][] = [
            "name" => "Persentase",
            "data" => $dataPersen,
            "type" => "spline"
        ];

        return $chartData;
    }

}
