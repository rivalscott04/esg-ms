@push('css')
    <link rel="stylesheet" href="{{ asset('assets/libs/flatpickr/flatpickr.css') }}">
@endpush

@push('js')
    <script src="{{ asset('assets/libs/flatpickr/flatpickr.js') }}"></script>
    <script>
        $('.datepicker').flatpickr({
            altInput: true,
            altFormat: 'F j, Y',
            dateFormat: 'Y-m-d',
            minDate : 'today'
        })

        $('.datepicker-past').flatpickr({
            altInput: true,
            altFormat: 'F j, Y',
            dateFormat: 'Y-m-d',
            maxDate : 'today'
        })
    </script>
@endpush
