<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Employmentcredential;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EmploymentCredentialController extends Controller
{
       /**
     * @OA\Post(
     * path="api/credential/employment",
     * tags={"Credential"},
     * summary="user update employment credentials",
     * description="user update employment credentials",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *               type="object",
     *               required={"position","company", "start_year", "end_year"},
     *               @OA\Property(property="position", type="nullable|string|max:50"),
     *               @OA\Property(property="company", type="nullable|string"),
     *               @OA\Property(property="start_year", type="nullable|integer"),
     *               @OA\Property(property="end_year", type="nullable|integer"),

     *            ),
     *        ),
     *    ),
     *      @OA\Response(
     *          response=201,
     *          description="Successfully",
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
    public function EmploymentDetails(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'position' => 'nullable|string|max:50',
            'company' => 'nullable|string',
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

        $employmentcredential = new Employmentcredential();
        $employmentcredential->position = $validator['position'];
        $employmentcredential->company = $validator['company'];
        $employmentcredential->start_year = $validator['start_year'];
        $employmentcredential->end_year = $validator['end_year'];
        $employmentcredential->user_id = Auth::user()->id;
        $employmentcredential->save();
        $response = [
            'message' => 'Successful'
        ];
        return response()->json($response, 200);
    }
}
