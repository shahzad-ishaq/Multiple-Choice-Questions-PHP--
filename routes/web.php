<?php

use App\Http\Controllers\QuestionsController;
use App\Http\Controllers\ResultController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/', [UsersController::class, 'index']);
Route::post('/user', [UsersController::class, 'store']);
Route::post('/result_submit', [ResultController::class, 'update']);
Route::post('/result', [ResultController::class, 'result']);
Route::post('/skip_question', [ResultController::class, 'skip']);
Route::post('/next_question', [QuestionsController::class, 'show']);

Route::get('/logoutt', function () {
    Session::flush();
    return redirect('/');
});