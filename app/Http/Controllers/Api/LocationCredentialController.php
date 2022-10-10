<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Locationcredential;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class LocationCredentialController extends Controller
{
    /**
     * @OA\Post(
     * path="api/credential/location",
     * tags={"Credential"},
     * summary="user update location credentials",
     * description="user update location credentials",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
     *               required={"location", "start_year", "end_year"},
     *               @OA\Property(property="location", type="required|string"),
     *               @OA\Property(property="start_year", type="nullable|integer"),
     *               @OA\Property(property="end_year", type="nullable|integer"),

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
    public function LocationDetails(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'location' => 'Required|string|',
            'start_year' => 'nullable|integer',
            'end_year' => 'nullable|integer',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Fails',
                'errors' => $validator->errors(),
            ], 400);
        }
        $validator = $validator->validated();

        $locationcredential = new Locationcredential();
        $locationcredential->location = $validator['location'];
        $locationcredential->start_year = $validator['start_year'];
        $locationcredential->end_year = $validator['end_year'];
        $locationcredential->user_id = Auth::user()->id;
        $locationcredential->save();
        $response = [
            'message' => 'Successful'
        ];
        return response()->json($response, 200);
    }

    /**
     * @OA\Post(
     * path="api/credential/location/{id}",
     * tags={"Credential"},
     * summary="user update location credentials",
     * description="user update location credentials",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
     *               required={"location", "start_year", "end_year"},
     *               @OA\Property(property="location", type="required|string"),
     *               @OA\Property(property="start_year", type="nullable|integer"),
     *               @OA\Property(property="end_year", type="nullable|integer"),

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
    public function UpdateLocation(Request $req, $id)
    {
        $validator = Validator::make($req->all(), [
            'location' => 'Required|string|',
            'start_year' => 'nullable|integer',
            'end_year' => 'nullable|integer',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Fails',
                'errors' => $validator->errors(),
            ], 400);
        }
        $validator = $validator->validated();

        $locationcredential = Locationcredential::find($id);
        $locationcredential->location = $validator['location'];
        $locationcredential->start_year = $validator['start_year'];
        $locationcredential->end_year = $validator['end_year'];
        $locationcredential->update();
        $response = [
            'message' => 'Update Successful'
        ];
        return response()->json($response, 200);
    }

    /**
     * @OA\Get(
     *      path= "api/credential/location/{user_id}",
     *      tags={"Credential"},
     *      summary="Get user location details",
     *      description="Get user location details",
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
    public function getLocationDetails($user_id)
    {
        try {

            $data = DB::table('locationcredentials')->where("user_id", $user_id)->first();
            return response()->json(['data' => $data]);
        } catch (\Exception $e) {
            return response()->json(['status' => 'false', 'message' => $e->getMessage(), 'data' => []], 500);
        }
    }
}
