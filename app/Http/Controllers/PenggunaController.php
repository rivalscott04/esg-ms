<?php

namespace App\Http\Controllers;

use App\Enums\RoleUser;
use App\Http\Requests\PenggunaRequest;
use App\Models\Partai;
use App\Models\User;
use App\Models\UserProfile;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;

class PenggunaController extends Controller
{
    public function data(DataTables $dataTables)
    {
        $data = User::query()
            ->latest();

        return $dataTables->eloquent($data)
            ->addColumn('role_desc', function ($data) {
                return $data->role->getDescription();
            })
            ->addColumn('isActive', function ($data) {
                return $data->is_active ? 'Iya' : 'Tidak';
            })
            ->addColumn('action', function ($data) {
                $edit = "<a href='" . route('admin.pengguna.edit', $data->id) . "' class='text-success' title='Edit Data'><i class='bx bxs-edit bx-sm'></i></a>";
                $delete = "<a href='javascript:;' class='text-danger' onclick='fn_deleteData(" . '"' . route('admin.pengguna.destroy', $data->id) . '"' . ")' title='Hapus Data'><i class='bx bxs-trash bx-sm'></i></a>";

                return $data->is_super() ? '<div class="btn btn-outline-gray">Disabled</div>' : $edit . '  ' . $delete;
            })
            ->rawColumns(['action'])
            ->toJson();
    }

    public function index()
    {
        return view('pages.pengguna.index');
    }

    public function create()
    {
        $roles = RoleUser::toArray();
        return view('pages.pengguna.create', compact('roles'));
    }

    public function store(PenggunaRequest $request)
    {
        try {
            DB::transaction(function () use ($request) {
                $uuid = Str::uuid();
                $userField = ["nama", "email", "password", "username", "role", "is_active"];
                User::create(Arr::only($request->validated(), $userField) + ["id" => $uuid]);
                UserProfile::create(Arr::except($request->validated(), $userField) + ["user_id" => $uuid]);
            });


            alert()->success('Success', 'Data berhasil disimpan!');
            return redirect()->route('admin.pengguna.index');
        } catch (\Exception $e) {
            alert()->error('Ooppss!', 'Proses simpan data gagal!');
            return back()->withInput()->withErrors($e->getMessage());
        }
    }

    public function edit(User $pengguna)
    {
        $pengguna->load(['user_profile' => ["kelurahan", "kecamatan"]]);
        $roles = RoleUser::toArray();

        return view('pages.pengguna.create', compact('roles', 'pengguna'));
    }

    public function update(PenggunaRequest $request, User $pengguna)
    {
        try {
            DB::transaction(function () use ($request, $pengguna) {
                $userField = ["nama", "email", "password", "username", "role", "is_active"];
                $pengguna->update(Arr::only($request->validated(), $userField));
                $pengguna->user_profile()->update(Arr::except($request->validated(), $userField));
            });

            alert()->success('Success', 'Data berhasil disimpan!');
            return redirect()->route('admin.pengguna.index');
        } catch (\Exception $e) {
            alert()->error('Ooppss!', 'Proses simpan data gagal!');
            return back()->withInput()->withErrors($e->getMessage());
        }
    }

    public function destroy(User $pengguna)
    {
        try {

            $pengguna->delete();
            return response()->json(["success" => 'Delete data berhasil.']);
        } catch (\Exception $e) {
            return response()->json(["error" => $e->getMessage()]);
        }
    }
}
