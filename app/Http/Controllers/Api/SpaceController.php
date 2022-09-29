<?php

namespace App\Http\Controllers\Api;

use App\Models\Space;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
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

        }
        $space = $req->space();

        if($req->hasFile('image')){
            if($space->image){
                $old_path=public_path().'/uploads/space_pics/'.$space->image;
                if(File::exists($old_path)){
                    File::delete($old_path);
                }
            }
          $image_name='profile_photo-'.time().'.'.$req->space->extension();
          $req->space->move(public_path('/uploads/space_pics/'),$image_name);

        }else{

            $image_name = $space->image;

            $validator = $validator->validated();

            $space = new Space;
            $space->title = $validator['space_name'];
            $image_name = $validator['image'];
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
