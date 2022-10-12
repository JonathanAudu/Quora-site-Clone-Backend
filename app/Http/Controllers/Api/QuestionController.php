<?php

namespace App\Http\Controllers\Api;

use Throwable;
use App\Models\Question;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class QuestionController extends Controller
{

    /**
        * @OA\Post(
        * path="/api/space/createQuestion",
        * tags={"Question"},
        * summary="user create question",
        * description="A user create question",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"question_desc"},
        *               @OA\Property(property="question_desc", type="required|string"),
        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=201,
        *          description="Created Successfully",
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
    public function AskQuestion(Request $req){
        $validator = Validator::make($req->all(), [
            'question_desc' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message'=>'Fails',
                'errors'=>$validator->errors(),
            ],400);
        }
        $validator = $validator->validated();

        $question = new Question();
        $question->question_desc = $validator['question_desc'];
        $question->user_id = Auth::user()->id;
        $question->save();
        $response = [
            'message' => 'Successful'
        ];

        return response()->json($response, 200);
    }


          /**
     * @OA\Get(
     *      path="api/user/question/{user_id}",
     *      tags={"Question"},
     *      summary="Get all question from users",
     *      description="Get all questions from users",
     *      @OA\Response(
     *          response=200,
     *          description="Successful",
     *          @OA\JsonContent(ref="#/components/schemas/ProjectResource")
     *       ),
     *      @OA\Response(
     *          response=401,
     *          description="Unable to get question",
     *      ),
     *      @OA\Response(
     *          response=403,
     *          description="Forbidden"
     *      )
     *     )
     */
    public function getQuestion($user_id){
        try{
            $question = Question::where('user_id', $user_id)->get();
            return response()->json($question, 200);
        }catch (Throwable $exception) {
            return response()->json($exception->getMessage(), 500);
        }
    }

}

