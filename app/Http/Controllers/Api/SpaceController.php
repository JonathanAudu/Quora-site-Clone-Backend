<?php

namespace App\Http\Controllers\Api;

use App\Models\Space;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class SpaceController extends Controller
{
    public function topic(Request $req)
    {
        $validator = Validator::make($req->all(), [
           'space_name' => 'required|string',
           'image' => 'nullable|image|mimes:jpg,bmp,png',
        ]);
        if ($validator->fails()) {
            $response = [
                'status' => 'failure',
                'status_code' => 500,
                'errors' => $validator->errors(),
            ];

            return response()->json($response, 500);

        }else {
            $validator = $validator->validated();

            $space = new Space;
            $space->title = $validator['space_name'];
            $space->body = $validator['image'];
            $space->save();
            $response = [
                'message' => 'space created'
            ];

            return response()->json($response, 200);

        }
    }

    public function search(Request $req) {
        $search_string = $req->search_string;

        $search_result = DB::table('posts')
            ->where('title', 'like', "%$search_string%")
            ->orWhere('body', 'like', "%$search_string%")
            ->get();

        return $search_result;
    }
}
