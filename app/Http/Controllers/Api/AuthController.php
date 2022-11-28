<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Mail\SendOtpMail;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Password;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
       /**
        * @OA\Post(
        * path="/api/auth/register",
        * tags={"Auth"},
        * summary="user registeration",
        * description="A user registers on the platform",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"name","email"},
        *               @OA\Property(property="name", type="string"),
        *               @OA\Property(property="email", type="string")

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
        *          description="Unprocessable Entity",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(response=400, description="Bad request"),
        *      @OA\Response(response=404, description="Resource Not Found"),
        * )
        */
    public function register(Request $req){

        $validator = Validator::make($req->all(), [
            'name' => 'required|string',
            'email'=> 'required|email|unique:users',
            // 'password' => 'string',
        ]);

        if ($validator->fails()) {
            $response = [
                'status' => 'failure',
                'status_code' => 400,
                // 'message' => "The email has already been taken.",
                'errors' => $validator->errors(),
            ];

            return response()->json($response, 400);
        }
        $validator = $validator->validated();


        // $random = ;

        // $user = User::create([
        //     'name' => $validator['name'],
        //     'email' => $validator['email'],

        //     // 'password' => bcrypt($validator['password']),
        // ]);

        $user = new User;
        $user->name = $validator['name'];
        $user->email = $validator['email'];
        $user->otp =  rand(100000, 999999);

        if($user->save()){

            $token = $user->createToken('jontoken')->plainTextToken;

            $genOtp = User::where('email', $user->email)->first();
            // ->value('otp');


            if($genOtp){
                // $response = [$genOtp];
                if( Mail::to($user->email)->send(new SendOtpMail($genOtp)) ){
                    $response = ['sent succesfullly'];
                } else {
                    $response = ['Cannot send email'];
                }
            } else {
                $response = ['Cannot generate OTP at the moment'];
            }

        } else {
            $response = ['Something went Wrong'];
        }

        $response = [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'token' => $token,
            'otp' => $user->otp,
        ];


        return response($response, 200);
    }
 /**
        * @OA\Post(
        * path="/api/auth/verify",
        * tags={"Auth"},
        * summary="OTP is needed",
        * description="A user input an OTP ",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"id","otp"},
        *               @OA\Property(property="id", type="integer"),
        *               @OA\Property(property="otp", type="integer")
        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=200,
        *          description=" Successful",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(
        *          response=400,
        *          description="Wrong OTP",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(response=400, description="Bad request"),
        *      @OA\Response(response=404, description="Resource Not Found"),
        * )
        */

    public function verify (Request $req){


        $validator = Validator::make($req->all(), [
            'id' => 'required',
            'otp' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message'=>'Validations fails',
                'errors'=>$validator->errors(),
            ],400);
        }
        $validator = $validator->validated();

        $genOtp = User::where('id', $validator['id'])->value('otp');

        if ($validator['otp'] == $genOtp ) {

            $user = User::find($validator['id']);

            $user->is_verified = 1 ;

            $user->save();
            $response = [
                'message' => 'Successful'
            ];
        }else{
            $response = [
                'message' => 'Wrong OTP'
            ];
        }





        return response($response);


    }
 /**
        * @OA\Post(
        * path="/api/auth/password",
        * tags={"Auth"},
        * summary="user registeration input password",
        * description="A user input  password",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"name","email"},
        *               @OA\Property(property="password", type="string"),
        *               @OA\Property(property="id", type="integer")

        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=200,
        *          description="registration successful",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(
        *          response=422,
        *          description="password fails",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(response=400, description="Bad request"),
        *      @OA\Response(response=404, description="Resource Not Found"),
        * )
        */

    public function password (Request $req){


        $validator = Validator::make($req->all(), [
            'id' => 'required',
            'password' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message'=>'Password fails',
                'errors'=>$validator->errors(),
            ],406);
        }
        $validator = $validator->validated();

        $user = User::where('id', $req->id)->first();
        $user->password = bcrypt($validator['password']);
        $token = $user->createToken('myapptoken')->plainTextToken;

        if($user->save()){
            $response = [
                'message' => 'Registration successful',
                'user' => $user,
                'token' => $token
            ];
        }



        return response($response, 200);


    }
 /**
        * @OA\Post(
        * path="/api/auth/login",
        * tags={"Auth"},
        * summary="user login",
        * description="A user enters login details",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"email","password"},
        *               @OA\Property(property="email", type="string"),
        *               @OA\Property(property="password", type="string")

        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=201,
        *          description="login successful",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(
        *          response=422,
        *          description="login fails",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(response=400, description="Bad request"),
        *      @OA\Response(response=404, description="Resource Not Found"),
        * )
        */

    public function login(Request $req){
        $validator = Validator::make($req->all(), [
            'email' => 'required|string',
            'password' => 'required|string'
        ]);

        if($validator->fails()){
            $response = [
                'status' => 'failure',
                'status_code' => 400,
                'message' => 'Bad Request',
                'errors' => $validator->errors(),
            ];

            return response()->json($response, 400);
        }

        $validator = $validator->validated();

        // check email
       $user = User::where('email', $validator['email'])->first();

        // check password
         if(!$user || !Hash::check( $validator['password'], $user->password )) {
                return response([
                    'message' => 'incorrect login details'
                ], 401);
        }

        $token = $user->createToken('myapptoken')->plainTextToken;


        $response = [
            'user' => $user,
            'token' => $token
        ];

        return response($response, 201);



    }

// Google login
    public function googleLogin(){
        // return Socialite::driver('google')->redirect();
        $googleUser = Socialite::driver('google')->user();

        $user = User::updateOrCreate([
            'google_id' => $googleUser->id,
        ], [
            'name' => $googleUser->name,
            'email' => $googleUser->email,
            'google_token' => $googleUser->token,
            'google_refresh_token' => $googleUser->refreshToken,
        ]);

        $response = [
            'user' => $user,
        ];
        return response($response, 201);
        // Auth::login($user);
    }

// Google callback
    public function googleLoginCallback(){
         return Socialite::driver('google')->user();
    }


// Facebook login
    public function facebookLogin(){
        // return Socialite::driver('facebook')->redirect();
        $facebookUser = Socialite::driver('facebook')->user();

        $user = User::updateOrCreate([
            'facebook_id' => $facebookUser->id,
        ], [
            'name' => $facebookUser->name,
            'email' => $facebookUser->email,
            'facebook_token' => $facebookUser->token,
            'facebook_refresh_token' => $facebookUser->refreshToken,
        ]);

        $response = [
            'user' => $user,
        ];
        return response($response, 201);
    }

// Facebook callback
    public function facebookLoginCallback(){
        return Socialite::driver('facebook')->user();
    }







 /**
        * @OA\Post(
        * path="/api/logout/",
        * tags={"Auth"},
        * summary="loggout user",
        * description="A user logs out of the platform",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *            ),
        *        ),
        *    ),
        *      @OA\Response(
        *          response=201,
        *          description="log out Successfully",
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

    public function logout(Request $req)
    {
        $req->user()->token()->delete();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }


    public function forgotPassword(){
        return response()->json([
            'message' => 'Josh will do it'
        ]);
    }

    /**
        * @OA\Post(
        * path="/api/forgot-password/",
        * tags={"Password Reset"},
        * summary="password reset",
        * description="A user submits email to receive reset link",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"email"},
        *               @OA\Property(property="email", type="string")
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
        *          description="Unprocessable Entity",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(response=400, description="Bad request"),
        *      @OA\Response(response=404, description="Resource Not Found"),
        * )
        */
    public function requestResetMail(Request $req){
        $req->validate(['email' => 'required|email']);

        $status = Password::sendResetLink(
            $req->only('email')
        );

        return $status === Password::RESET_LINK_SENT
        ? back()->with(['status' => __($status)])
        : back()->withErrors(['email' => __($status)]);
    }


  /**
     * @OA\Get(
     *      path="/api//reset-password/{token}",
     *      tags={"Password Reset"},
     *      summary="user clicks reset link in mail box",
     *      description="Returns a reset form and comes with $token which contains the reset token. This token
     *                   should be placed in a hidden form input with value set to the said token",
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
    public function requestResetForm($token){
        return view('auth.reset-password', ['token' => $token]);
    }


   /**
        * @OA\Post(
        * path="/api/reset-password/",
        * tags={"Password Reset"},
        * summary="user changes password",
        * description="A user enters email and enters password twice",
        *     @OA\RequestBody(
        *         @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *               type="object",
        *               required={"email","password","password_confirmation"},
        *               @OA\Property(property="email", type="string"),
        *               @OA\Property(property="password", type="string"),
        *               @OA\Property(property="password_confirmation", type="string")
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
        *          description="Unprocessable Entity",
        *          @OA\JsonContent()
        *       ),
        *      @OA\Response(response=400, description="Bad request"),
        *      @OA\Response(response=404, description="Resource Not Found"),
        * )
        */
    public function resetPassword(Request $req){
        $req->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        $status = Password::reset(
            $req->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));

                $user->save();

                event(new PasswordReset($user));
            }
        );

        $status === Password::PASSWORD_RESET;
        //             ? redirect()->route('login')->with('status', __($status))
        //             : back()->withErrors(['email' => [__($status)]]);
        return response()->json([
            'message' => 'new password confirmed',
            'status' => $status

        ]);
    }

     /**
     * @OA\Get(
     *     path="/api/get-user",
     *      operationId="getUserDetails",
     *      tags={"Auth"},
     *      summary="Get Logged in user",
     *      description="Get Logged in user",
     *      @OA\Response(
     *          response=200,
     *          description="Returns logged in user information",
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
    public function userDetails(){
        try {
            $id = Auth::user()->id;
            $user = User::where('id', $id)->first();
            return response()->json($user, 200);
        } catch (\Throwable $th) {
            return response()->json($th->getMessage(), 500)->header("Access-Control-Allow-Origin",  "*");
        }
    }


}





