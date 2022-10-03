<?php

namespace App\Http\Controllers\Api;

use Throwable;
use App\Models\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{

    /**
     * @OA\Post(
     * path="api/user/create-post",
     * tags={"Post"},
     * summary="user post feeds",
     * description="User post feeds",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
     *               required={"title", "body"},
     *               @OA\Property(property="title", type="required|string"),
     *               @OA\Property(property="body", type="required|string")
     *            ),
     *        ),
     *    ),
     *      @OA\Response(
     *          response=201,
     *          description="Post Successful",
     *          @OA\JsonContent()
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="validation fails",
     *          @OA\JsonContent()
     *       ),
     *      @OA\Response(response=422, description="Validation"),
     *      @OA\Response(response=404, description="Resource Not Found"),
     * )
     */
    public function createPost(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'title' => 'required|string|max:255',
            'body' => 'required|string',
        ]);

        if ($validator->fails()) {
            $response = [
                'status' => 'failure',
                'status_code' => 500,
                'errors' => $validator->errors(),
            ];

            return response()->json($response, 500);
        } else {
            $validator = $validator->validated();

            $post = new Post;
            $post->title = $validator['title'];
            $post->body = $validator['body'];
            $post->user_id = Auth::user()->id;
            $post->save();
            $response = [
                'message' => 'Post Successful'
            ];

            return response()->json($response, 200);
        }
    }


    /**
     * @OA\Get(
     *      path="/api/user/allposts",
     *      tags={"Post"},
     *      summary="Get all Posts",
     *      description="Get all Posts",
     *      @OA\Response(
     *          response=200,
     *          description="Successful",
     *          @OA\JsonContent(ref="#/components/schemas/ProjectResource")
     *       ),
     *      @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *      ),
     *      @OA\Response(
     *          response=403,
     *          description="Unable to post"
     *      )
     *     )
     */
    public function getAllPosts()
    {
        try {
            $posts = Post::all();
            return response()->json($posts, 200);
        } catch (Throwable $exception) {
            return response()->json($exception->getMessage());
        }
    }
}
