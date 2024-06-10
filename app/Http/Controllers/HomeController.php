<?php

namespace App\Http\Controllers;

use App\Enums\RoleUser;
use App\Models\Booking;
use App\Models\Event;
use App\Models\Guide;
use App\Models\HitungSuara;
use App\Models\Partai;
use App\Models\Payment;
use App\Models\PenugasanArea;
use App\Models\Registrasi;
use App\Models\Survey;
use App\Models\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    public function index()
    {

        if (auth()->user()->is_user()) {
            return view('home-user', compact('registrasi', 'survey', 'hasil'));
        }

        if (auth()->user()->is_team()) {
            return view('home-team', compact('registrasi', 'survey', 'hasil', 'penugasan'));
        }


        return view('home-super');
    }
}
