<?php

namespace App\Http\Livewire;

use App\Models\Event;
use App\Models\KabupatenKota;
use Livewire\Component;

class EventDapilComponent extends Component
{
    public $event = [];
    public $dapil = [];

    public $eventId;
    public $dapilId;

    public function mount()
    {
        $this->event = Event::with('dapil')
            ->where('is_active',true)
            ->get();

        if (!empty($this->eventId)) {
            $selectedEvent = $this->event->where('id', $this->eventId)->first();
            $this->dapil = $selectedEvent->dapil;
        }

    }

    public function render()
    {
        return view('livewire.event-dapil-component');
    }

    public function updatedEventId($value)
    {

        if (!empty($value)) {
            $this->dapil = [];
            $selectedEvent = $this->event->where('id', $value)->first();
            if (isset($selectedEvent)) {
                $this->dapil = $selectedEvent->dapil;
            }
        }
    }
}
