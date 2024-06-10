<?php

use App\Http\Controllers\Api\ApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('login', [ApiController::class, 'login']);
Route::post('survey-store', [ApiController::class, 'survey_store']);
Route::get('survey-data/{user}', [ApiController::class, 'survey_data']);
Route::get('survey-start/{survey}', [ApiController::class, 'survey_start']);
Route::get('survey-pertanyaan/{survey}', [ApiController::class, 'survey_pertanyaan']);
Route::post('survey-jawaban-store', [ApiController::class, 'survey_jawaban_store']);
Route::get('survey-hasil/{survey}', [ApiController::class, 'survey_hasil']);

Route::get('event-data/{user}', [ApiController::class, 'event_data']);
Route::get('kab-kota-data', [ApiController::class, 'kab_kota_data']);

Route::get('get-tps-penugasan/{user}', [ApiController::class, 'get_tps_penugasan']);
Route::post('hitung-suara-store', [ApiController::class, 'hitung_suara_store']);
Route::get('hitung-suara-data/{user}', [ApiController::class, 'hitung_suara_data']);

Route::get('get-info-dashboard/{user}', [ApiController::class, 'get_info_dashboard']);
