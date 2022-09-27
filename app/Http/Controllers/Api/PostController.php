<?php

namespace App\Http\Controllers\Api;

use App\Models\Post;
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

        if ($validator->fails()) {
            $response = [
                'status' => 'failure',
                'status_code' => 500,
                'errors' => $validator->errors(),
            ];

        return response()->json($response, 400);
        }

        $validator = $validator->validated();

        $post = new Post;
        $post->title = $validator['title'];
        $post->body = $validator['body'];
        $post->save();

    }

}
