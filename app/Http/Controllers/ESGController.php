<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\EnvironmentalData;
use App\Models\SocialData;
use App\Models\GovernanceData;

class ESGController extends Controller
{
    public function create()
    {
        return view('esg.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'company_id' => 'required|integer',
            'year' => 'required|integer',
            'carbon_emissions' => 'required|numeric',
            'energy_consumption' => 'required|numeric',
            'water_usage' => 'required|numeric',
            'waste_recycled' => 'required|numeric',
            'workforce_diversity' => 'required|numeric',
            'employee_training_hours' => 'required|numeric',
            'safety_incidents' => 'required|integer',
            'community_investment' => 'required|numeric',
            'board_independence' => 'required|numeric',
            'executive_compensation' => 'required|numeric',
            'shareholder_rights' => 'required|boolean',
            'business_ethics_policies' => 'required|boolean',
        ]);

        // Save Environmental Data
        EnvironmentalData::create([
            'company_id' => $request->company_id,
            'year' => $request->year,
            'carbon_emissions' => $request->carbon_emissions,
            'energy_consumption' => $request->energy_consumption,
            'water_usage' => $request->water_usage,
            'waste_recycled' => $request->waste_recycled,
        ]);

        // Save Social Data
        SocialData::create([
            'company_id' => $request->company_id,
            'year' => $request->year,
            'workforce_diversity' => $request->workforce_diversity,
            'employee_training_hours' => $request->employee_training_hours,
            'safety_incidents' => $request->safety_incidents,
            'community_investment' => $request->community_investment,
        ]);

        // Save Governance Data
        GovernanceData::create([
            'company_id' => $request->company_id,
            'year' => $request->year,
            'board_independence' => $request->board_independence,
            'executive_compensation' => $request->executive_compensation,
            'shareholder_rights' => $request->shareholder_rights,
            'business_ethics_policies' => $request->business_ethics_policies,
        ]);

        return redirect()->route('esg.create')->with('success', 'ESG data has been added successfully.');
    }
}
