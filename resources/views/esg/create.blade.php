<!DOCTYPE html>
<html>

<head>
    <title>Add ESG Data</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>

<body>
    <div class="container">
        <h2>Add ESG Data</h2>

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        <form action="{{ route('esg.store') }}" method="POST">
            @csrf
            <div class="form-group">
                <label for="company_id">Company ID</label>
                <input type="number" class="form-control" id="company_id" name="company_id" required>
            </div>
            <div class="form-group">
                <label for="year">Year</label>
                <input type="number" class="form-control" id="year" name="year" required>
            </div>

            <h3>Environmental Data</h3>
            <div class="form-group">
                <label for="carbon_emissions">Carbon Emissions (tCO2e)</label>
                <input type="number" step="0.01" class="form-control" id="carbon_emissions" name="carbon_emissions"
                    required>
            </div>
            <div class="form-group">
                <label for="energy_consumption">Energy Consumption (MWh)</label>
                <input type="number" step="0.01" class="form-control" id="energy_consumption"
                    name="energy_consumption" required>
            </div>
            <div class="form-group">
                <label for="water_usage">Water Usage (m3)</label>
                <input type="number" step="0.01" class="form-control" id="water_usage" name="water_usage" required>
            </div>
            <div class="form-group">
                <label for="waste_recycled">Waste Recycled (%)</label>
                <input type="number" step="0.01" class="form-control" id="waste_recycled" name="waste_recycled"
                    required>
            </div>

            <h3>Social Data</h3>
            <div class="form-group">
                <label for="workforce_diversity">Workforce Diversity (%)</label>
                <input type="number" step="0.01" class="form-control" id="workforce_diversity"
                    name="workforce_diversity" required>
            </div>
            <div class="form-group">
                <label for="employee_training_hours">Employee Training Hours</label>
                <input type="number" step="0.01" class="form-control" id="employee_training_hours"
                    name="employee_training_hours" required>
            </div>
            <div class="form-group">
                <label for="safety_incidents">Safety Incidents</label>
                <input type="number" class="form-control" id="safety_incidents" name="safety_incidents" required>
            </div>
            <div class="form-group">
                <label for="community_investment">Community Investment ($)</label>
                <input type="number" step="0.01" class="form-control" id="community_investment"
                    name="community_investment" required>
            </div>

            <h3>Governance Data</h3>
            <div class="form-group">
                <label for="board_independence">Board Independence (%)</label>
                <input type="number" step="0.01" class="form-control" id="board_independence"
                    name="board_independence" required>
            </div>
            <div class="form-group">
                <label for="executive_compensation">Executive Compensation ($)</label>
                <input type="number" step="0.01" class="form-control" id="executive_compensation"
                    name="executive_compensation" required>
            </div>
            <div class="form-group">
                <label for="shareholder_rights">Shareholder Rights</label>
                <select class="form-control" id="shareholder_rights" name="shareholder_rights" required>
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                </select>
            </div>
            <div class="form-group">
                <label for="business_ethics_policies">Business Ethics Policies</label>
                <select class="form-control" id="business_ethics_policies" name="business_ethics_policies" required>
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>

</html>
