<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Educationcredential extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function getuser()
    {
        return $this->belongsTo(User::class);
    }

    protected $fillable = [
        'school',
        'primary_major',
        'secondary_major',
        'degree_type',
        'graduation_year'
    ];
}
