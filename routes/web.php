<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ESGController;
use App\Http\Controllers\Dashboard\AllPerformanceController;
use App\Http\Controllers\Dashboard\EnviromentalPerformanceController;

Route::redirect('/', '/login');
//BACKEND
Auth::routes();

Route::group(["middleware" => 'auth', "prefix" => "admin", "as" => "admin."], function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    //PROFILE
    Route::get('/profile/{tab?}', [App\Http\Controllers\ProfileController::class, 'index'])->name('profile');
    Route::put('/profile', [App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');
    Route::put('/profile/change-password', [App\Http\Controllers\ProfileController::class, 'updatePassword'])->name('profile.change-password');

    //USERS
    Route::group(['middleware' => 'check.access:pengguna'], function () {
        Route::get('/pengguna/data', [\App\Http\Controllers\PenggunaController::class, 'data'])->name('pengguna.data');
        Route::resource('pengguna', \App\Http\Controllers\PenggunaController::class);
    });
});

Route::group(["middleware" => 'auth'], function () {
    //ESG
    Route::get('/esg/create', [ESGController::class, 'create'])->name('esg.create');
    Route::post('/esg/store', [ESGController::class, 'store'])->name('esg.store');

    //DASHBOARD
    Route::group(["prefix" => "dashboard", "as" => "dashboard."], function () {
        //ALL PRFORMANCE
        Route::group(['middleware' => 'check.access:all-performance'], function () {
            Route::resource('all-performance', AllPerformanceController::class);
        });

        //ENVIRONMENTAL PRFORMANCE
        Route::group(['middleware' => 'check.access:environmental-performance'], function () {
            Route::resource('environmental-performance', EnviromentalPerformanceController::class);
        });

        //SOCIAL PRFORMANCE
        Route::group(['middleware' => 'check.access:social-performance'], function () {
            Route::resource('social-performance', EnviromentalPerformanceController::class);
        });

        //GOVERNANCE PRFORMANCE
        Route::group(['middleware' => 'check.access:governance-performance'], function () {
            Route::resource('governance-performance', EnviromentalPerformanceController::class);
        });

        //SELECTED PRFORMANCE
        Route::group(['middleware' => 'check.access:selected-performance'], function () {
            Route::resource('selected-performance', EnviromentalPerformanceController::class);
        });

        //SDGs PRFORMANCE
        Route::group(['middleware' => 'check.access:sdgs'], function () {
            Route::resource('sdgs', EnviromentalPerformanceController::class);
        });
    });
});
