<?php

namespace App\Console\Commands;

use App\Mail\InvoiceMail;
use App\Models\Booking;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class SendEmailCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:send-email-command';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle(): void
    {
        $booking = Booking::first();
        Mail::to('ahmad.mujamil@gmail.com')->send(new InvoiceMail($booking));
    }
}
