<?php

namespace App\Http\Controllers\Api;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class UserProfileController extends Controller
{

    /**
     * @OA\Post(
     * path="api/user/update-profile",
     * tags={"User"},
     * summary="profile update",
     * description="User update profile",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
     *               required={"name", "profile_credential", "profile_desc", "profile_photo"},
     *               @OA\Property(property="name", type="string"),
     *               @OA\Property(property="profile_credential", type="string|nullable|max:60"),
     *               @OA\Property(property="profile_desc", type="nullable|string"),
     *               @OA\Property(property="profile_photo", type="string"),
     *            ),
     *        ),
     *    ),
     *      @OA\Response(
     *          response=201,
     *          description="Added Successfully",
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
    public function update_profile(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'name' => 'required|string',
            'profile_credential' => 'nullable|string|max:60',
            'profile_desc' => 'nullable|string',
            'profile_photo' => 'mimes:jpg,bmp,png',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validations fails',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = $req->user();

        if ($req->hasFile('profile_photo')) {
            if ($user->profile_photo) {
                $old_path = public_path() . '/uploads/profile_images/' . $user->profile_photo;
                if (File::exists($old_path)) {
                    File::delete($old_path);
                }
            }
            $image_name = 'profile_photo-' . time() . '.' . $req->profile_photo->extension();
            $req->profile_photo->move(public_path('/uploads/profile_images/'), $image_name);
        } else {
            $image_name = $user->profile_photo;
        }

        $user->update([
            'name' => $req->name,
            'profile_credential' => $req->profile_credential,
            'profile_desc' => $req->profile_desc,
            'profile_photo' => $image_name
        ]);

        return response()->json(['message' => 'Profile successfully updated',], 200);
    }



   /**
     * @OA\Get(
     *      path= api/user/userProfile",
     *      tags={"User"},
     *      summary="Get user information",
     *      description="Get user information",
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
     *          description="Forbidden"
     *      )
     *     )
     */
    public function getUserProfile(Request $req, $id){
        try {

            $user = DB::table('users')->where("id", $id)->first();
            return response()->json(['data'=>$user]);
        } catch (\Exception $e) {
            return response()->json(['status'=>'false', 'message'=>$e->getMessage(), 'data'=>[]], 500);
        }
    }
}
