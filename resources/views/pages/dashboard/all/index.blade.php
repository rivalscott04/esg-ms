@extends('layouts.app')

@section('title','All Performance')
@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 breadcrumb-wrapper mb-4">
            <span class="text-muted fw-light">Dashboard > </span> All Performance
        </h4>
        <div class="row mb-4">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div class="row">
                            <div class="col-lg-3">
                               <img src="{{ asset('assets/img/environment.png') }}" width="50px" > 
                            </div>
                            <div class="col lg 9">
                              Environmental Score<br>  <h4 class="mb-0"> 71</h4>
                            <strong style="color: red">&#x2193; -21.1%</strong>  from previous year
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="container1" style="margin-top: 20px"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div class="row">
                            <div class="col-lg-3">
                               <img src="{{ asset('assets/img/people.png') }}" width="50px" > 
                            </div>
                            <div class="col lg 9">
                              Social Score<br>  <h4 class="mb-0"> 85</h4>
                            <strong style="color: green">&#x2191; 21.4%</strong>  from previous year
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="container2" style="margin-top: 20px"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div class="row">
                            <div class="col-lg-3">
                               <img src="{{ asset('assets/img/government.png') }}" width="50px" > 
                            </div>
                            <div class="col lg 9">
                              Governance Score<br>  <h4 class="mb-0"> 85</h4>
                            <strong style="color: green">&#x2191; 4.4%</strong>  from previous year
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="container3" style="margin-top: 20px"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push("js")
    <script src="{{ asset('assets/libs/highchart/highcharts.js') }}"></script>
    <script src="{{ asset('assets/libs/highchart/modules/exporting.js') }}"></script>
    <script src="{{ asset('assets/libs/highchart/modules/export-data.js') }}"></script>
    <script>
        Highcharts.chart('container1', {
    chart: {
        type: 'column'
    },
    title: {
        text: '',
        align: 'left'
    },
    yAxis: {
            plotLines: [{
               
                value: 111,
                width: 3,
                color: 'black',
                label:{
                    text:'Goal'
                }
            }]
        },
        xAxis: {
            categories: ['2018', '2019', '2020', '2021', '2022', '2023'],
        },
        series: [{
            showInLegend: false,
            name: 'Score',
            data: [29.9, 71.5, 106.4, 40.2, 78.0, 176.0],
            color: 'green'
        }]
});
        Highcharts.chart('container2', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '',
                    align: 'left'
                },
                yAxis: {
                        plotLines: [{
                        
                            value: 101,
                            width: 3,
                            color: 'black',
                            label:{
                                text:'Goal'
                            }
                        }]
                    },
                    xAxis: {
                        categories: ['2018', '2019', '2020', '2021', '2022', '2023'],
                    },
                    series: [{
                        showInLegend: false,
                        name: 'Score',
                        data: [29.9, 100.5, 160.4, 40.2, 78.0, 76.0],
                        color: '#deaa1b'
                    }]
            });

        Highcharts.chart('container3', {
            chart: {
                type: 'column'
            },
            title: {
                text: '',
                align: 'left'
            },
            yAxis: {
                    plotLines: [{
                    
                        value: 90,
                        width: 3,
                        color: 'black',
                        label:{
                            text:'Goal'
                        }
                    }]
                },
                xAxis: {
                    categories: ['2018', '2019', '2020', '2021', '2022', '2023'],
                },
                series: [{
                    showInLegend: false,
                    name: 'Score',
                    data: [29.9, 71.5, 60.4, 140.2, 118.0, 80.0],
                    color: 'blue'
                }]
        });
    </script>
@endpush
