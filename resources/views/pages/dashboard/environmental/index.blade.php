@extends('layouts.app')

@section('title','Environmental Performance')
@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">
            <span class="text-muted fw-light">Dashboard > </span> Environmental Performance
        </h4>
        <div class="row mb-4">
            <div class="col-lg-5">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><img src="{{ asset('assets/img/environment.png') }}" width="50px" > Latest Environmental Values</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table" style="font-size: 12px">
                                <thead>
                                <tr>
                                    <th>Metric</th>
                                    <th >Unit</th>
                                    <th >Value</th>
                                    <th >%</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Greenhouse gas emission</td>
                                        <td>kg CO2e</td>
                                        <td> 913 </td>
                                        <td> 24.5 </td>
                                    </tr>
                                    <tr>
                                        <td>Energy consumption</td>
                                        <td>kWh</td>
                                        <td> 913 </td>
                                        <td> 24.5 </td>
                                    </tr>
                                    <tr>
                                        <td>Water usage</td>
                                        <td>liters</td>
                                        <td> 913 </td>
                                        <td> 24.5 </td>
                                    </tr>
                                    <tr>
                                        <td>Waste generation</td>
                                        <td>kg per unit</td>
                                        <td> 913 </td>
                                        <td> 24.5 </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="container2" style="margin-top: 20px"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="card">
                    <div class="card-body">
                        <div id="container"></div>
                        <div class="table-responsive">
                            <table class="table" style="font-size: 12px">
                                <thead>
                                <tr>
                                    <th>Metric</th>
                                    <th >2018</th>
                                    <th >2019</th>
                                    <th >2020</th>
                                    <th >2021</th>
                                    <th >2022</th>
                                    <th>2023</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Greenhouse gas emission</td>
                                        <td>16</td>
                                        <td>18.2</td>
                                        <td>23.1</td>
                                        <td>27.9</td>
                                        <td>32.2</td>
                                        <td>20.4</td>
                                    </tr>
                                    <tr>
                                        <td>Energy consumption</td>
                                        <td>16</td>
                                        <td>18.2</td>
                                        <td>23.1</td>
                                        <td>27.9</td>
                                        <td>32.2</td>
                                        <td>20.4</td>
                                    </tr>
                                    <tr>
                                        <td>Water usage</td>
                                        <td>16</td>
                                        <td>18.2</td>
                                        <td>23.1</td>
                                        <td>27.9</td>
                                        <td>32.2</td>
                                        <td>20.4</td>
                                    </tr>
                                    <tr>
                                        <td>Waste generation</td>
                                        <td>16</td>
                                        <td>18.2</td>
                                        <td>23.1</td>
                                        <td>27.9</td>
                                        <td>32.2</td>
                                        <td>20.4</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('css')
    <link rel="stylesheet" href="{{ asset('assets/libs/datatables-bs5/datatables.bootstrap5.css') }}">
@endpush
@push("js")
    <script src="{{ asset('assets/libs/highchart/highcharts.js') }}"></script>
    <script src="{{ asset('assets/libs/highchart/modules/exporting.js') }}"></script>
    <script src="{{ asset('assets/libs/highchart/modules/export-data.js') }}"></script>
    <script src="{{ asset('assets/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script>
        let datatable = $(".datatable").DataTable({
            language:{
                "info": "Data _START_ sampai _END_ dari _TOTAL_ data.",
            },
            processing: true,
            serverSide: true,
            responsive:true,
           
            render: function (data, type, row, meta) {
                return meta.row + meta.settings._iDisplayStart + 1;
            }
        });

        Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: 'Annual Trend'
    },
    subtitle: {
        // text: 'Source: ' +
        //     '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
        //     'target="_blank">Wikipedia.com</a>'
    },
    xAxis: {
        categories: ['2018', '2019', '2020', '2021', '2022', '2023']
    },
    yAxis: {
        title: {
            text: 'Greenhouse gas emission (kg CO2e)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: 'Greenhouse gas emission',
        data: [16.0, 18.2, 23.1, 27.9, 32.2, 20.4],
        color: '#deaa1b'
    },
]
});



Highcharts.chart('container2', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Environmental Score',
        align: 'left'
    },
    yAxis: {
            plotLines: [{
               
                value: 111,
                width: 3,
                color: 'blue',
                label:{
                    text:'Goal'
                }
            }]
        },
        xAxis: {
            categories: ['2018', '2019', '2020', '2021', '2022', '2023'],
        },
        series: [{
            name: 'Score',
            type: 'bar',
            data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0],
            color: '#deaa1b'
        }]
});


    </script>
@endpush
