<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Educationcredential;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EducationCredentialController extends Controller
{
        /**
     * @OA\Post(
     * path="api/credential/education",
     * tags={"Credential"},
     * summary="user update education credentials",
     * description="user update education credentials",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
     *               required={"school","primary_major", "secondary_major", "degree_type", "graduation_type"},
     *               @OA\Property(property="school", type="nullable|string"),
     *               @OA\Property(property="primary_major", type="nullable|string"),
     *               @OA\Property(property="secondary_major", type="nullable|string"),
     *               @OA\Property(property="degree_type", type="nullable|string"),
     *               @OA\Property(property="graduation_type", type="nullable|string"),

     *            ),
     *        ),
     *    ),
     *      @OA\Response(
     *          response=201,
     *          description="Successful",
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
    public function EducationDetails(Request $req){
        $validator = Validator::make($req->all(), [
            'school' => 'nullable|string',
            'primary_major' => 'nullable|string',
            'secondary_major' => 'nullable|string',
            'degree_type' => 'nullable|string|max:25',
            'graduation_year' => 'nullable|integer',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Fails',
                'errors' => $validator->errors(),
            ], 400);
        }
        $validator = $validator->validated();

        $educationcredential = new Educationcredential();
        $educationcredential->school = $validator['school'];
        $educationcredential->primary_major = $validator['primary_major'];
        $educationcredential->secondary_major = $validator['secondary_major'];
        $educationcredential->degree_type = $validator['degree_type'];
        $educationcredential->graduation_year = $validator['graduation_year'];
        $educationcredential->user_id = Auth::user()->id;
        $educationcredential->save();
        $response = [
            'message' => 'Successful'
        ];
        return response()->json($response, 200);
    }


}
