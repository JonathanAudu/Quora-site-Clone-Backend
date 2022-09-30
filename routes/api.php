<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\SpaceController;
use App\Http\Controllers\Api\CommentController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\UserProfileController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('auth/get-user', [AuthController::class, 'userDetails']);

Route::post('auth/register', [AuthController::class, 'register']);

Route::post('auth/verify', [AuthController::class, 'verify']);
Route::post('auth/password', [AuthController::class, 'password']);

Route::post('auth/login', [AuthController::class, 'login']);

Route::get('auth/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::get('auth/forgot-password', [AuthController::class, 'forgotPassword'])->middleware('guest')->name('password.request');


Route::post('auth/forgot-password', [AuthController::class, 'requestResetMail'])->middleware('guest')->name('password.email');


Route::get('auth/reset-password/{token}', [AuthController::class, 'requestResetForm'])->middleware('guest')->name('password.reset');
Route::post('auth/reset-password', [AuthController::class, 'resetPassword'])->middleware('guest')->name('password.update');
Route::post('user/update-profile', [UserProfileController::class, 'update_profile'])->middleware('auth:sanctum');

 // Comment Routes
 Route::post('user/add-comment', [CommentController::class, 'postComment']);

 // space routes
 Route::post('user/create-space', [SpaceController::class, 'createSpace'])->middleware('auth:sanctum');
 Route::post('space/search', [SpaceController::class, 'searchAllSpace']);
 Route::get('user/spaces', [SpaceController::class, 'getAllSpace']);
 Route::get('user/spaces/{user_id}', [SpaceController::class, 'getSpace']);

 //Post Routes
 Route::post('user/create-post', [PostController::class, 'createPost'])->middleware('auth:sanctum');
 Route::get('user/allposts', [PostController::class, 'getAllPost']);




