<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Locationcredential extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function getuser()
    {
        return $this->belongsTo(User::class);
    }

    protected $fillable = [
        'location',
        'start_year',
        'end_year'
    ];
}
