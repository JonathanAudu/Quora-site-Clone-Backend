<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function getcategory()
    {
        return $this->belongsTo(category::class);
    }

    public function getuser()
    {
        return $this->belongsTo(User::class);
    }
}
