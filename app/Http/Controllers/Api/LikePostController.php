<?php

namespace App\Http\Controllers\Api;

use App\Models\Likepost;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LikePostController extends Controller
{
    public function PostsLike(Request $req)
    {

        $status = Likepost::where('user_id', '=', $req->user_id)
            ->where('post_id', '=', $req->post_id);
        if (!$status) {
            $addlikepost = new Likepost;

            $addlikepost->user_id = $req->user_id;
            $addlikepost->post_id = $req->post_id;
            $addlikepost->like = 1;

           $addlikepost->save();
        } elseif ($status && ($status->dislike == 1)) {

            $status->update([
                'dislike' => 0,
                'like' => 1
            ]);
            $response = [
                'message' => 'Post Successful'
            ];

            return response()->json($response, 200);
        }
    }
}
