<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Likecomment;
use Illuminate\Http\Request;

class LikeCommentController extends Controller
{

      /**
        * @OA\Post(
        * path="/api/comment/upvotes",
        * tags={"CommentVote"},
        * summary="user likes a comment",
        * description="A user likes a comment",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"user_id", "post_id", "like", "dislike"},
        *               @OA\Property(property="user_id", type="required|integer"),
        *               @OA\Property(property="post_id", type="required|integer"),
        *               @OA\Property(property="like", type="required|boolean"),
        *               @OA\Property(property="dislike", type="required|boolean|default(0)"),
        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=201,
        *          description="You like this comment",
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
                'message' => 'You like this comment'
            ];

            return response()->json($response, 200);

        }
    }

      /**
        * @OA\Post(
        * path="/api/post/downvotes",
        * tags={"CommentVote"},
        * summary="user dislikes a comment",
        * description="A user dislikes a comment",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"user_id", "post_id", "like", "dislike"},
        *               @OA\Property(property="user_id", type="required|integer"),
        *               @OA\Property(property="post_id", type="required|integer"),
        *               @OA\Property(property="like", type="required|boolean"),
        *               @OA\Property(property="dislike", type="required|boolean"),
        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=201,
        *          description="You dislike this comment",
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
    public function CommentDislike(Request $Req){
        $status = Likecomment::where('user_id', '=', $Req->user_id)
            ->where('post_id', '=', $Req->post_id);
        if(!$status){
            $adddislikecomment = new Likecomment;
            $adddislikecomment->user_id = $Req->user_id;
            $adddislikecomment->post_id = $Req->post_id;
            $adddislikecomment->dislike = 1;

           $adddislikecomment->save();
        } elseif ($status && ($status->like == 1)) {

            $status->update([
                'dislike' => 1,
                'like' => 0
            ]);
            $response = [
                'message' => 'You dislike this comment'
            ];

            return response()->json($response, 200);
        }
    }

          /**
     * @OA\Get(
     *      path="api/comment/votes/{post_id}",
     *      tags={"CommentVote"},
     *      summary="Get count of votes of comments",
     *      description="Get count of votes of comments",
     *      @OA\Response(
     *          response=200,
     *          description="Successful",
     *          @OA\JsonContent(ref="#/components/schemas/ProjectResource")
     *       ),
     *      @OA\Response(
     *          response=401,
     *          description="Unable to get count of votes",
     *      ),
     *      @OA\Response(
     *          response=403,
     *          description="Forbidden"
     *      )
     *     )
     */
    public function getLikeCount(Request $Req){
        $status = Likecomment::where('post_id', '=', $Req->post_id)->get();
        $likeCount = Count($status);
        return $likeCount;
    }

}
