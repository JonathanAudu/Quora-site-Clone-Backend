<?php

namespace App\Http\Controllers\Api;

use App\Models\Likepost;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use PHPUnit\Framework\Constraint\Count;

class LikePostController extends Controller
{

     /**
        * @OA\Post(
        * path="/api/post/upvotes",
        * tags={"PostVote"},
        * summary="user likes a post",
        * description="A user likes a post",
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
        *          description="You like this post",
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
    public function PostsLike(Request $req)
    {

        $status = Likepost::where('user_id', $req->user_id)
            ->where('post_id', $req->post_id)->get();

        if ( $status->isEmpty())  {

            $addlikepost = new Likepost;
            $addlikepost->user_id = $req->user_id;
            $addlikepost->post_id = $req->post_id;
            $addlikepost->like = 1;
            $addlikepost->dislike = 0;

            $addlikepost->save();

            $response = [
                'message' => 'You like this post'
            ];

            return response()->json($response, 200);

        }
        elseif($status) {

            $status = Likepost::where('user_id', $req->user_id)
                ->where('post_id', $req->post_id)
                ->where('like', 1)
                ->first();
            $response = [
                'message' => 'You already liked this post'
            ];



        return response()->json($response, 200);
    }
        elseif ( $status ) {

            $status = Likepost::where('user_id', $req->user_id)
                ->where('post_id', $req->post_id)
                ->where('dislike', 1)
                ->first();


                $status->like = 1;
                $status->dislike = 0;

                $status->save();



            $response = [
                'message' => 'disliked before, now liked'
            ];

        }


    }

      /**
        * @OA\Post(
        * path="/api/post/downvotes",
        * tags={"PostVote"},
        * summary="user dislikes a post",
        * description="A user dislikes a post",
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
        *          description="You dislike this post",
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
    public function PostsDislike(Request $Req){
        $status = Likepost::where('user_id', '=', $Req->user_id)
            ->where('post_id', '=', $Req->post_id);
        if($status->isEmpty()){
            $adddislikepost = new Likepost;
            $adddislikepost->user_id = $Req->user_id;
            $adddislikepost->post_id = $Req->post_id;
            $adddislikepost->dislike = 1;
            $adddislikepost->like = 0;

           $adddislikepost->save();

           $response = [
               'message' => 'You dislike this post'
           ];

           return response()->json($response, 200);

        } elseif ($status && $status->like == 1) {

            $status->update([
                'dislike' => 1,
                'like' => 0
            ]);
            $response = [
                'message' => 'You dislike this post'
            ];

            return response()->json($response, 200);
        }
    }

         /**
     * @OA\Get(
     *      path="api/post/votes/{post_id}",
     *      tags={"PostVote"},
     *      summary="Get count of votes from post",
     *      description="Get count of votes from post",
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
        $likes = Likepost::where('post_id', '=', $Req->post_id)->get();
        $likeCount = Count($likes);
        return $likeCount;
    }
}

