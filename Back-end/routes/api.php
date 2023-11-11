<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

use App\Http\Controllers\ProdutoController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Localhost:8000/api/products

    Route::post('/produtos', [ProdutoController::class, 'create']);
    Route::get('produtos/{id}', [ProdutoController::class, 'getProduct']);
    Route::get('produtos', [ProdutoController::class, 'getAll']);
    Route::put('/produtos/{id}', [ProdutoController::class, 'update']);
    Route::delete('/produtos/{id}', [ProdutoController::class, 'delete']);
    Route::post('/produtos/imagem', [ProdutoController::class, 'uploadImagem']);

