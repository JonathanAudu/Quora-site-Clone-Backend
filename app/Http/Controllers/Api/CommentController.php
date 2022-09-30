<?php

namespace App\Http\Controllers\Api;

use th;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CommentController extends Controller
{
    /**
     * @OA\Post(
     * path="api/user/add-comment",
     * tags={"Comment"},
     * summary="Add a comment under a post",
     * description="Add a comment under a post",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
     *               required={"post_id", "user_id", "comment"},
     *               @OA\Property(property="post_id", type="integer"),
     *               @OA\Property(property="user_id", type="integer"),
     *               @OA\Property(property="comment", type="string"),
     *            ),
     *        ),
     *    ),
     *      @OA\Response(
     *          response=201,
     *          description="Comment added Successfully",
     *          @OA\JsonContent()
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Unprocessable Entity",
     *          @OA\JsonContent()
     *       ),
     *      @OA\Response(response=400, description="Bad request"),
     *      @OA\Response(response=404, description="Resource Not Found"),
     * )
     */
    public function postComment(Request $req)
    {
        try {
            $this->validate($req, [
                'comment' => 'required'
            ]);
            $comment = Comment::create([
                'post_id' => $req->post_id,
                'user_id' => $req->user_id,
                'comment' => $req->comment
            ]);
            return response()->json(["message" => "Comment added successfully"], 200);
        } catch (\Throwable $th) {
            return response()->json($th, 500);
        }
    }
}
