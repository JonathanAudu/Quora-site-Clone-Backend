<?php

<<<<<<< HEAD
namespace App\Http\Controllers\Api;

use Throwable;
use App\Models\User;
use App\Models\Following;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class FollowingController extends Controller
{
    /**
=======
namespace App\Http\Controllers;

use App\Models\Following;
use Illuminate\Http\Request;

class FollowingController extends Controller
{
      /**
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa
     * @OA\Post(
     * path="api/user/create-follower",
     * tags={"Follow User"},
     * summary="user follows a user",
     * description="user follows a user",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
<<<<<<< HEAD
     *               required={"follower_id", "following_id"},
     *               @OA\Property(property="follower_id", type="integer"),
     *               @OA\Property(property="following_id", type="integer")
=======
     *               required={"user_id", "followed_user_id"},
     *               @OA\Property(property="user_id", type="integer"),
     *               @OA\Property(property="followed_user_id", type="integer")
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa
     *            ),
     *        ),
     *    ),
     *      @OA\Response(
     *          response=201,
     *          description="You followef this user",
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
<<<<<<< HEAD
    public function FollowUser(Request $req, $id)
    {
        $userId = Auth::user()->id;
        $followUser = $req->following_id;

        $CheckFollowing = Following::where('follower_id', '=', $userId)
            ->where('following_id', '=', $followUser)->first();

        // return $CheckFollowing;

        if ($CheckFollowing == null) {

            $following = new Following;
            $following->follower_id = $userId;
            $following->following_id = $followUser;
            $following->save();
            $response = [
                'message' => 'You followed this user'
            ];
        } elseif ($CheckFollowing) {

            Following::find($id)->delete;
            $response = [
                'message' => 'You unfollow this user'
            ];
        }else{
            $response = [
                'message' => 'You already followed this user'
            ];
        }
        return response()->json($response, 200);
    }



    /**
     * @OA\Get(
     *      path="/api/user/allfollowers/{$following_id}",
     *      tags={"Follow User"},
     *      summary="Get all followers for a particular user",
     *      description="Get all followers for a particular user",
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
     *          description="No followers"
     *      )
     *     )
     */
    public function getFollowers($following_id)
    {
        try {
            // $users = Following::where('following_id', $following_id)->with('followers')->get();
            $user = User::where('id', $following_id)->with('following.follower')->first();
            return response()->json($user, 200);
        } catch (Throwable $exception) {
            return response()->json($exception->getMessage());
        }
    }



    
=======
    public function FollowUser(Request $req){

        $following = new Following;
        $following->user_id = $req->user_id;
        $following->followed_user_id = $req->followed_user_id;
        $following->save();
        $response = [
            'message' => 'You followed this user'
        ];

        return response()->json($response, 200);
    }
>>>>>>> 582ccf80486e21b1156d353b758cefc4b44100aa
}
