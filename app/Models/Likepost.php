<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Likepost extends Model
{
    use HasFactory;

    public function getpost()
    {
        return $this->belongsTo(Post::class);
    }

    public function getuser()
    {
        return $this->belongsTo(User::class);
    }
}
