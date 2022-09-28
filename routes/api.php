<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\SpaceController;
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

 //save space routes
 Route::post('space/save', [SpaceController::class, 'topic']);

 //search space routes
 Route::post('space/topic', [SpaceController::class, 'search']);



