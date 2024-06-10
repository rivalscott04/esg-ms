@extends('layouts.app')

@section('title','Pengguna')
@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">
            <span class="text-muted fw-light">Master Data > </span>Pengguna
        </h4>
    <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">{{ request()->routeIs('admin.pengguna.create') ? 'Tambah' : 'Ubah' }} Data</h5>
                        <small class="text-muted float-end"><a href="{{ route('admin.pengguna.index') }}" class="btn btn-danger"><i class="bx bx-arrow-back"></i> Kembali</a></small>
                    </div>
                    @php  $urlAction = request()->routeIs('admin.pengguna.create') ? route('admin.pengguna.store') : route('admin.pengguna.update',$pengguna) @endphp
                    @php  $methodForm = request()->routeIs('admin.pengguna.create') ? 'POST' : 'PUT' @endphp
                    <form id="needs-validation" novalidate method="post"
                          enctype="multipart/form-data" data-parsley-validate
                          action="{{ $urlAction }}">
                        @csrf
                        @method($methodForm)
                    <div class="card-body">
                        @include('includes.error_alert')
                        <div class="row">
                            <div class="mb-3 col-lg-8 col-md-8 col-sm-12">
                                <label class="form-label">Nama Pengguna</label>
                                <input type="text" class="form-control @error('nama') parsley-error @enderror" id="nama" name="nama"
                                       data-parsley-required  value="{{ old('nama',$pengguna->nama??'') }}" />
                            </div>

                            <div class="mb-3 col-lg-4 col-md-4 col-sm-12">
                                <label class="form-label">Nomor Telp</label>
                                <input type="text" class="form-control @error('no_telp') parsley-error @enderror" id="no_telp" name="no_telp"
                                       data-parsley-required  value="{{ old('no_telp',$pengguna->user_profile->no_telp??'') }}" />
                            </div>
                            <div class="mb-3 col-lg-8 col-md-8 col-sm-12">
                                <label class="form-label">Alamat</label>
                                <input type="text" class="form-control @error('alamat') parsley-error @enderror" id="alamat" name="alamat"
                                       data-parsley-required  value="{{ old('alamat',$pengguna->user_profile->alamat??'') }}" />
                            </div>

                            <div class="mb-3 col-lg-4 col-md-4 col-sm-12">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control @error('email') parsley-error @enderror" id="email" name="email"
                                       data-parsley-required  value="{{ old('email',$pengguna->email??'') }}" />
                            </div>

                        </div>

                        <div class="row ">
                            <div class="mb-3 col-lg-8 col-md-8 col-sm-12">
                                <label class="form-label">Bio</label>
                                <input type="text" class="form-control @error('bio') parsley-error @enderror" id="bio" name="bio"
                                       data-parsley-required  value="{{ old('bio',$pengguna->user_profile->bio??'') }}" />
                            </div>

                        </div>
                        <div class="row">
                            <div class="mb-3 col-lg-3 col-md-6 col-sm-12">
                                <label class="form-label">Username</label>
                                <input type="text" class="form-control @error('username') parsley-error @enderror" id="username" name="username"
                                       data-parsley-required  value="{{ old('username',$pengguna->username??'') }}" />
                            </div>
                            <div class="mb-3 col-lg-3 col-md-6 col-sm-12">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control @error('password') parsley-error @enderror" id="password" name="password"
                                       data-parsley-required  value="{{ old('password',$pengguna->password??'') }}" />
                            </div>
                            <div class="mb-3 col-lg-3 col-md-6 col-sm-12">
                                <label class="form-label">Role</label>
                                <select name="role" id="role" class="form-control selectpicker @error('role') parsley-error @enderror"
                                        data-parsley-required="true" data-size="5" data-live-search="true">
                                    <option value="">-- Pilih Role --</option>
                                    @foreach ($roles as $key=>$item)
                                        <option value="{{$key}}" {{ old('role',$pengguna->role?->value??'')==$key ? 'selected' : '' }}>{{$item}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="mb-3 col-lg-3 col-md-6 col-sm-12">
                                <label class="form-label">Is Active ?</label>
                                <select name="is_active" id="is_active" class="form-control selectpicker @error('is_active') parsley-error @enderror"
                                        data-parsley-required="true">
                                    <option value="0" {{ old('is_active',$pengguna->is_active??'')== 0 ? 'selected' : '' }}>Tidak</option>
                                    <option value="1" {{ old('is_active',$pengguna->is_active??'')== 1 ? 'selected' : '' }}>Iya</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Simpan Data</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@include('includes.parsleyJs')
@include('includes.bootstrapSelectJs')
