<?php

return [
    'permissions' => [
        'super' => ["*"],
        'admin' => ["*"],
        'user' => ["master-data", "teams","logistik","barang", "proses-pemilihan","transaksi-barang", "registrasi", "insight", "penugasan","hasil-survey","hasil-quick-count"],
        'team' => ["survey-vote", "survey", "hitung-suara"]
    ],

    "type_transaksi" => ["in","out"]
];
