<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{
    public function post(Request $req){
        $validator = Validator::make($req->all(),[
            'title' => 'string|max|20',
            'body' => 'required|string',

        ]);
    }
}
