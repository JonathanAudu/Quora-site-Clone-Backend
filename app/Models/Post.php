<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function getuser()
    {
        return $this->belongsTo(User::class);
    }
    public function getcomment()
    {
        return $this->hasMany(Comment::class, "post_id", "id" );
    }
    public function getLikePost()
    {
        return $this->hasMany(Likepost::class, "post_id", "id");
    }
}
