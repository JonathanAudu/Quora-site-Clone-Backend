<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Likecomment;
use Illuminate\Http\Request;

class LikeCommentController extends Controller
{
    public function CommentsLike(Request $req)
    {

        $status = Likecomment::where('user_id', '=', $req->user_id)
            ->where('post_id', '=', $req->post_id);
        if (!$status) {
            $addlikepost = new Likecomment;

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
                'message' => 'Success'
            ];

            return response()->json($response, 200);

        }
    }
}
