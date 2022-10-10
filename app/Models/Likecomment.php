<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Likecomment extends Model
{
    use HasFactory;
    public function getcomment()
    {
        return $this->belongsTo(Comment::class);
    }

    public function getuser()
    {
        return $this->belongsTo(User::class);
    }
}
