<?php

namespace App\Http\Controllers;

use App\Http\Requests\ChangePasswordRequest;
use App\Http\Requests\ProfileRequest;
use App\Models\Partai;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProfileController extends Controller
{
    public function index($tab)
    {
        return view('profile', compact('tab'));
    }

    public function update(ProfileRequest $request)
    {
        try {
            DB::transaction(function () use ($request) {
                auth()->user()->update([
                    "nama" => $request->nama,
                    "email" => $request->email
                ]);

                if ($request->hasFile('avatar')) {
                    auth()->user()->getFirstMedia('avatars')?->delete();
                    auth()->user()
                        ->addMediaFromRequest('avatar')
                        ->usingFileName(Str::slug(auth()->user()->nama . "-id-" . auth()->id()) . "." . $request->file('avatar')->extension())
                        ->toMediaCollection('avatars');
                }


                auth()->user()->user_profile()
                    ->update(Arr::except($request->validated(), ["nama", "email", "avatar"]));
            });
            alert()->success('Success', 'Data berhasil disimpan!');
            return redirect()->route('admin.profile', "data");
        } catch (\Exception $e) {
            alert()->error('Ooppss!', 'Proses simpan data gagal!');
            redirect()->route("admin.profile")->withErrors($e->getMessage())->withInput();
        }
    }

    public function updatePassword(ChangePasswordRequest $request)
    {
        try {
            auth()->user()->update([
                "password" => $request->password
            ]);
            alert()->success('Success', 'Data berhasil disimpan!');
            return redirect()->route('admin.profile', "settings");
        } catch (\Exception $e) {
            alert()->error('Ooppss!', 'Proses simpan data gagal!');
            redirect()->route("admin.profile")->withErrors($e->getMessage())->withInput();
        }
    }
}
