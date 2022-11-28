<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Following extends Model
{
    use HasFactory;

    public function follower(){
        return $this->hasOne(User::class, 'id', 'follower_id');
    }

    protected $hidden = [
        'follower_id', 'following_id', 'created_at', 'updated_at', 'id',
    ];
}
