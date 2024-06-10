@extends('layouts.app')

@section('title','Home Dashboard')
@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">Hai,  {{ auth()->user()->nama }}</h4>
        <div class="row">

            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <div class="avatar mx-auto mb-2">
                    <span class="avatar-initial rounded-circle bg-label-primary"
                    ><i class="bx bx-check-square fs-4"></i
                        ></span>
                        </div>
                        <span class="d-block text-nowrap">PENUGASAN TPS</span>
                        <h2 class="mb-0">{{ $penugasan?->count()??'-' }}</h2>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <div class="avatar mx-auto mb-2">
                    <span class="avatar-initial rounded-circle bg-label-warning"
                    ><i class="bx bx-check-double fs-4"></i
                        ></span>
                        </div>
                        <span class="d-block text-nowrap">JML TPS DIINPUT</span>
                        <h2 class="mb-0">{{ $hasil->count() }}</h2>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <div class="avatar mx-auto mb-2">
                    <span class="avatar-initial rounded-circle bg-label-danger"
                    ><i class="bx bx-calculator fs-4"></i
                        ></span>
                        </div>
                        <span class="d-block text-nowrap">HASIL SUARA</span>
                        <h2 class="mb-0">{{ $hasil->sum('jml_suara') }}</h2>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <div class="avatar mx-auto mb-2">
                    <span class="avatar-initial rounded-circle bg-label-success"
                    ><i class="bx bx-check-square fs-4"></i
                        ></span>
                        </div>
                        <span class="d-block text-nowrap">JML SURVEY</span>
                        <h2 class="mb-0">{{ $survey->count() }}</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-5">
                <!-- About User -->
                <div class="card mb-4">
                    <div class="card-body">
                        <small class="text-muted text-uppercase">About</small>
                        <ul class="list-unstyled mb-4 mt-3">
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-user"></i><span class="fw-semibold mx-2">Full Name:</span>
                                <span>{{ auth()->user()->nama??'-' }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-check"></i><span class="fw-semibold mx-2">Status:</span>
                                <span>{{ auth()->user()->is_active ? 'Active' : 'Non Active' }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-note"></i><span class="fw-semibold mx-2">Bio:</span>
                                <span>{{ auth()->user()->user_profile->bio??'-' }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-map-pin"></i><span class="fw-semibold mx-2">Alamat:</span>
                                <span>{{ auth()->user()->user_profile->alamat??"-" }}</span>
                            </li>
                        </ul>
                        <small class="text-muted text-uppercase">Contacts</small>
                        <ul class="list-unstyled mb-4 mt-3">

                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-phone"></i><span class="fw-semibold mx-2">Contact:</span>
                                <span>{{ auth()->user()->user_profile->no_telp??'-' }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-envelope"></i><span class="fw-semibold mx-2">Email:</span>
                                <span>{{ auth()->user()->email }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--/ About User -->
                <!-- Profile Overview -->
                <div class="card mb-4">
                    <div class="card-body">
                        <small class="text-muted text-uppercase">Overview</small>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-flag"></i><span class="fw-semibold mx-2">Partai:</span>
                                <span>{{ auth()->user()->user_profile->partai->nama??'-' }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-notification"></i><span class="fw-semibold mx-2">Nomor Urut:</span>
                                <span>{{ $registrasi->no_urut??'-' }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-4">
                                <i class="bx bx-user"></i><span class="fw-semibold mx-2">Nama Caleg:</span>
                                <span>{{ auth()->user()->parent->nama??'-' }}</span>
                            </li>
                        </ul>
                        <small class="text-muted text-uppercase">Registrasi</small>
                        <ul class="list-unstyled mt-4 mb-0">
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-calendar-check"></i><span class="fw-semibold mx-2">Event:</span>
                                <span>{{ $registrasi->event->keterangan ." ". $registrasi?->event?->tanggal->format("Y") }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-bookmark"></i><span class="fw-semibold mx-2">Jalur:</span>
                                <span>{{ $registrasi->dapil->jenis_pendaftaran??'-' }}</span>
                            </li>
                            <li class="d-flex align-items-center mb-3">
                                <i class="bx bx-map-alt"></i><span class="fw-semibold mx-2">Dapil:</span>
                                <span>{{ $registrasi->dapil->nama??'-' }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--/ Profile Overview -->
            </div>

            <div class="col-xl-8 col-lg-7 col-md-7">
                <div class="card card-action mb-4">
                    <div class="card-header align-items-center">
                        <h5 class="card-action-title mb-0">Survey Overview</h5>
                    </div>
                    <div class="card-body" style="max-height: 300px !important; overflow: scroll">
                        <ul class="list-unstyled mb-0">
                            @foreach($survey->groupBy('kelurahan.nama') as $kelurahan => $data)
                                <li class="mb-3">
                                    <div class="d-flex align-items-start">
                                        <div class="d-flex align-items">
                                            <div class="me-2">
                                                <h6 class="mb-0">{{ $kelurahan }}</h6>
                                                <small class="text-muted">
                                                    KabKot:  {{ $data[0]->kabupatenKota->nama??'' }} | Kec:  {{ $data[0]->kecamatan->nama??'' }}
                                                </small>
                                            </div>
                                        </div>
                                        <div class="ms-auto">
                                            <button class="btn btn-label-primary p-1 btn-sm">{{ $data->count() }}</button>
                                        </div>
                                    </div>
                                </li>
                            @endforeach

                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection
