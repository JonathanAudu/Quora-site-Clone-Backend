<?php

namespace App\Http\Controllers\Api;

use Throwable;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
<<<<<<< HEAD
use App\Notifications\PostNotifications;
=======
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Notification;

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
     *               required={"title", "body", "post_image"},
     *               @OA\Property(property="title", type="required|string"),
     *               @OA\Property(property="body", type="required|string")
     *               @OA\Property(property="post_image", type="mimes:jpg,bmp,png|nullable")
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
            'title' => 'required|string|max:25',
            'body' => 'required|string',
            'post_image' => 'mimes:jpg,bmp,png|nullable',
        ]);

        if ($validator->fails()) {
            $response = [
                'status' => 'failure',
                'status_code' => 500,
                'errors' => $validator->errors(),
            ];
            return response()->json($response, 500);
        } elseif ($req->post_image) {
<<<<<<< HEAD
            $image_name = 'post_image-' . time() . '.' . $req->post_image->extension();
            $req->post_image->move(public_path('/uploads/post_images/'), $image_name);
=======
            $file_name = 'post_img-' . time() . '.' . $req->post_image->extension();
            $req->post_image->move(public_path('/uploads/post_images/'), $file_name);
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa

            $post = new Post;
            $post->title = $req->title;
            $post->body = $req->body;
<<<<<<< HEAD
            $post->post_image = $image_name;
            $post->user_id = Auth::user()->id;
            $post->save();
=======
            $post->post_image = $file_name;
            $post->user_id = Auth::user()->id;
            $post->save();
            $response = [
                'message' => 'Successful'
            ];
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa

            $users = User::all();
            Notification::route('mail', $users)->notify(new PostNotifications($post));


            return response()->json($post, 200);
        }
    }



<<<<<<< HEAD


=======
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa
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
     *          description="Unable to  get post"
     *      )
     *     )
     */
    public function getAllPosts()
    {
        try {
            $posts = Post::latest('created_at')->get();
            return response()->json($posts, 200);
        } catch (Throwable $exception) {
            return response()->json($exception->getMessage());
        }
    }
    /**
     * @OA\Get(
     *      path="/api/user/allposts/{user_id}",
     *      tags={"Post"},
     *      summary="Get all Posts for a particular user",
     *      description="Get all Posts for a particular user",
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
     *          description="Unable to get post"
     *      )
     *     )
     */
<<<<<<< HEAD
    public function  getuserPosts($user_id)
=======
    public function userPosts($user_id)
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa
    {
        try {
            $posts = Post::where('user_id', $user_id)->with('comment', 'likepost')->get();
            return response()->json($posts, 200);
        } catch (Throwable $exception) {
            return response()->json($exception->getMessage());
        }
    }


  /**
        * @OA\Delete(
        * path="/delete/post/{id}",
        * tags={"Delete"},
        * summary="Delete post by id",
        * description="Delete post by id",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="integer",
        *               required={"true"}
        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=200,
        *          description="ok",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(response=400, description="Bad request"),
        *      @OA\Response(response=404, description="Resource Not Found"),
        * )
        */
    public function destroyPost($id)
    {
        $posts = Post::where('id', $id)->firstorfail()->delete();
        return response()->json($posts, 200);
    }
}
