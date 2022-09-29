<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class QuestionController extends Controller
{
    public function SaveQuestion(Request $req){
        $validator = Validator::make($req->all(), [
            'questions_desc' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message'=>'Fails',
                'errors'=>$validator->errors(),
            ],400);
        }
        $validator = $validator->validated();
    }

}

