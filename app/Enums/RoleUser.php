<?php

namespace App\Enums;

use App\Traits\EnumsToArray;

enum RoleUser: string
{

    use EnumsToArray;
    case SUPER = "super";
    case ADMIN = "admin";
    case DIRECTOR = "director";
    case ESGTEAM = "esg_team";
    case INTERNALAUDIT = "internal_audit";
    case ENVTEAM = "env_team";
    case HUMANCAPT = "human_capital";
    case PROCUREMENT = "procurement";
    case GOVNRISK = "govn_risk";
    case ACCOUNTING = "accounting";

    public function getDescription(): string
    {
        return match ($this) {
            self::SUPER => "Super Admin",
            self::ADMIN => "Administrator",
            self::DIRECTOR => "Director",
            self::ESGTEAM => "ESG Team",
            self::INTERNALAUDIT => "Internal Audit",
            self::ENVTEAM => "Environment Team",
            self::HUMANCAPT => "Human Capital",
            self::PROCUREMENT => "Procurement",
            self::GOVNRISK => "Governance Risk",
            self::ACCOUNTING => "Accounting",
        };
    }
}
