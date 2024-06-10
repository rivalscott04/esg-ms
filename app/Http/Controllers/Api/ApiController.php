<?php

namespace App\Http\Controllers\Api;

use App\Enums\TipeJawaban;
use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\Group;
use App\Models\HitungSuara;
use App\Models\KabupatenKota;
use App\Models\PenugasanArea;
use App\Models\Pertanyaan;
use Illuminate\Support\Str;
use App\Models\Survey;
use App\Models\SurveyJawaban;
use App\Models\SurveyPertanyaan;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ApiController extends Controller
{
    public function login(Request $request)
    {
        $login = Auth::attempt($request->all());
        if ($login) {
            $user = User::where('username', $request->username)->get();
            return response()->json([
                'response_code' => 200,
                'message' => 'Login Berhasil',
                'data' => $user
            ]);
        } else {
            return response()->json([
                'response_code' => 404,
                'message' => 'Username atau Password Tidak Ditemukan!',
                'data' => []
            ]);
        }
    }

    public function event_data($user)
    {
        $user = User::find($user);
        $data = Event::query()
            ->where("is_active", true)
            ->whereRelation("registrasi", ["user_id" => $user->parent_user_id])
            ->get();
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => $data
        ]);
    }

    public function kab_kota_data()
    {
        $data = KabupatenKota::with('kecamatan.kelurahan')->get();
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => $data
        ]);
    }

    public function survey_store(Request $request)
    {
        // return $request;
        $data = Event::query()
            ->where("is_active", true)
            ->whereYear('created_at', date('Y'))
            ->first();
        try {
            Survey::create(
                [
                    'event_id' => $data->id,
                    'tanggal' => date('Y-m-d'),
                    'kabupaten_kota_id' => $request->kabupaten_kota_id,
                    'kecamatan_id' => $request->kecamatan_id,
                    'kelurahan_id' => $request->kelurahan_id,
                    'user_id' => $request->user_id
                ]
            );
            return response()->json([
                'response_code' => 200,
                'message' => 'Berhasil Simpan!',
                'data' => []
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'response_code' => 404,
                'message' => 'Gagal Simpan : ' . $e->getMessage(),
                'data' => []
            ]);
        }
    }

    public function survey_start($survey)
    {
        $pertanyaan = Pertanyaan::orderBy('group_id')->orderBy('created_at', 'asc')->get();

        try {
            $i = 1;
            foreach ($pertanyaan as $key2 => $value2) {
                $data[] = [
                    'id' => Str::uuid(),
                    'survey_id' => $survey,
                    'pertanyaan_id' => $value2->id,
                    'nomor' => $i,
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s')
                ];
                $i++;
            }
            SurveyPertanyaan::where('survey_id', $survey)->delete();
            SurveyPertanyaan::insert($data);
            Survey::where('id', $survey)->update([
                'is_started' => true
            ]);
            return response()->json([
                'response_code' => 200,
                'message' => 'Berhasil Simpan!',
                'data' => []
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'response_code' => 404,
                'message' => 'Gagal Simpan : ' . $e->getMessage(),
                'data' => []
            ]);
        }

        return $survey;
    }

    public function survey_pertanyaan($survey)
    {
        $data = SurveyPertanyaan::with('pertanyaan.group', 'pertanyaan.jawaban', 'surveyJawaban')
            ->where('survey_id', $survey)->orderBy('nomor')->get();
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => $data
        ]);
    }


    public function survey_jawaban_store(Request $request)
    {
        $pertanyaan = SurveyPertanyaan::with('pertanyaan.jawaban')->find($request->survey_pertanyaan_id);

        if ($pertanyaan->pertanyaan->tipe_jawaban == TipeJawaban::INPUT_TEXT) {
            $data[] = [
                'id' => Str::uuid(),
                'survey_pertanyaan_id' => $request->survey_pertanyaan_id,
                'jawaban' => $request->jawaban,
                'tambahan' => '',
                'bobot' => 0,
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ];
        } elseif ($pertanyaan->pertanyaan->tipe_jawaban == TipeJawaban::SINGLE_OPTION) {
            foreach ($pertanyaan->pertanyaan->jawaban as $dt) {
                if ($dt->nama == $request->jawaban) {
                    $data[] = [
                        'id' => Str::uuid(),
                        'survey_pertanyaan_id' => $request->survey_pertanyaan_id,
                        'jawaban' => $request->jawaban,
                        'tambahan' => ($dt->with_input) ? $request->tambahan : '',
                        'bobot' => $dt->bobot,
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s')
                    ];
                }
            }
        } else {
            $jawaban =  explode(',', $request->jawaban);
            foreach ($jawaban as $value) {
                foreach ($pertanyaan->pertanyaan->jawaban as $dt) {
                    if ($value == $dt->nama) {
                        $data[] = [
                            'id' => Str::uuid(),
                            'survey_pertanyaan_id' => $request->survey_pertanyaan_id,
                            'jawaban' => $value,
                            'tambahan' => ($dt->with_input) ? $request->tambahan : '',
                            'bobot' => $dt->bobot,
                            'created_at' => date('Y-m-d H:i:s'),
                            'updated_at' => date('Y-m-d H:i:s')
                        ];
                    }
                }
            }
        }
        // return $data;
        SurveyJawaban::where('survey_pertanyaan_id', $request->survey_pertanyaan_id)->delete();
        SurveyJawaban::insert($data);
        SurveyPertanyaan::where('id', $request->survey_pertanyaan_id)->update([
            'is_saved' => true
        ]);
        if ($request->is_last) {
            Survey::where('id', $pertanyaan->survey_id)->update([
                'is_completed' => true
            ]);
        }
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => []
        ]);
    }

    public function survey_hasil($survey)
    {
        $group =  Group::orderBy('created_at')->get();
        foreach ($group as $dt) {
            $id_pertanyaan = Pertanyaan::where('group_id', $dt->id)->pluck('id');
            $data[] = [
                'group' => $dt->nama,
                'pertanyaan' => SurveyPertanyaan::with('pertanyaan.group', 'pertanyaan.jawaban', 'surveyJawaban')
                    ->where('survey_id', $survey)->whereIn('pertanyaan_id', $id_pertanyaan)->orderBy('nomor')->get()
            ];
        }
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => $data
        ]);
    }

    public function survey_data($user)
    {
        $data = Survey::query()
            ->with(["event", "user", "kecamatan", "kabupatenKota", "kelurahan"])
            ->where('user_id', $user)
            ->latest()->get();
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => $data
        ]);
    }


    public function get_tps_penugasan($user)
    {
        $data = PenugasanArea::query()
            ->with('tps.kelurahan', 'tps.kecamatan', 'tps.kabupatenKota')
            ->whereHas('penugasan', fn ($q) => $q->whereRelation('event', ["is_active" => true])->where('team_id', $user))
            ->whereDoesntHave('hitungSuara')
            ->get();
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => $data
        ]);
    }
    public function hitung_suara_store(Request $request)
    {
        $data = Event::query()
            ->where("is_active", true)
            ->whereYear('created_at', date('Y'))
            ->first();

        try {
            $penugasan_area = PenugasanArea::where('tps_id', $request->tps_id)->first();
            HitungSuara::where('tps_id', $request->tps_id)->delete();
            $hitung =  HitungSuara::create(
                [
                    'event_id' => $data->id,
                    'tps_id' => $request->tps_id,
                    'jml_surat_suara' => $request->jml_surat_suara,
                    'jml_suara_sah' => $request->jml_suara_sah,
                    'jml_tidak_sah' => $request->jml_tidak_sah,
                    'jml_suara' => $request->jml_suara,
                    'jml_tidak_terpakai' => $request->jml_tidak_terpakai,
                    'user_id' => $request->user_id,
                    'penugasan_area_id' => $penugasan_area->id
                ]
            );
            $hitung->getFirstMedia('hitung_suara')?->delete();
            $hitung
                ->addMediaFromRequest('file')
                ->usingFileName($hitung->id  . "." . $request->file('file')->extension())
                ->toMediaCollection('hitung_suara');

            return response()->json([
                'response_code' => 200,
                'message' => 'Berhasil Simpan!',
                'data' => []
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'response_code' => 404,
                'message' => 'Gagal Simpan : ' . $e->getMessage(),
                'data' => []
            ]);
        }
    }

    public function hitung_suara_data($user)
    {
        $data = HitungSuara::query()
            ->with(['event', 'tps', 'tps.kelurahan', 'tps.kecamatan', 'tps.kabupatenKota', 'media'])
            ->where('user_id', $user)
            ->latest()->get();

        // foreach ($data as $dt) {
        //     $dt->hitung_suara = $dt->getFirstMediaUrl('hitung_suara');
        // }
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => $data
        ]);
    }

    public function get_info_dashboard($user)
    {
        return response()->json([
            'response_code' => 200,
            'message' => 'Success',
            'data' => [
                'penugasan_tps' => PenugasanArea::query()
                    ->whereHas('penugasan', fn ($q) => $q->whereRelation('event', ["is_active" => true])->where('team_id', $user))
                    ->count(),
                'jml_tps_input' => HitungSuara::query()
                    ->where('user_id', $user)
                    ->count(),
                'hasil_suara' => (int) HitungSuara::query()
                    ->where('user_id', $user)
                    ->sum('jml_suara'),
                'jml_survey' => Survey::query()
                    ->where('user_id', $user)
                    ->count()
            ]
        ]);
    }
}
