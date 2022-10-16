<?php

namespace App\Http\Controllers;

use App\Models\Following;
use Illuminate\Http\Request;

class FollowingController extends Controller
{
      /**
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
     *               required={"user_id", "followed_user_id"},
     *               @OA\Property(property="user_id", type="integer"),
     *               @OA\Property(property="followed_user_id", type="integer")
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
}
