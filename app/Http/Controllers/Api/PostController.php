<?php

namespace App\Http\Controllers\Api;

use App\Models\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{

      /**
        * @OA\Post(
        * path="api/user/posts",
        * tags={"post"},
        * summary="user post feeds",
        * description="User post feeds",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"title", "body"},
        *               @OA\Property(property="title", type="string|max:20"),
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
    public function post(Request $req){
        $validator = Validator::make($req->all(),[
            'title' => 'string|max:20|unique:posts',
            'body' => 'required|string',
        ]);

        if ($validator->fails()) {
            $response = [
                'status' => 'failure',
                'status_code' => 500,
                'errors' => $validator->errors(),
            ];

        return response()->json($response, 500);
        }
        else
        {
        $validator = $validator->validated();

        $post = new Post;
        $post->title = $validator['title'];
        $post->body = $validator['body'];
        $post->save();
        $response = [
            'message' => 'Post Successful'
        ];

        return response()->json($response, 200);
        }
    }

}
