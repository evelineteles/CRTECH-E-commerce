<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produto;

class ProdutoController extends Controller
{
    public function form()
    {
        return view('cadastra_produto');
    }

    public function create(Request $request)
    {
        $produto = new Produto($request->all());

        //response json
       //response()->json([], 201);

        if ($produto->save() === true){
            return response()->json($produto, 201);
        }
        return response()->json(["error" => "Erro ao cadastrar"], 400);
    }

    public function getProduct(int $id)
    {
        $produtos = Produto::find($id);
        return response()->json($produtos);
    }

    public function getAll(Request $request)
    {
        //se tem: ?categoria=valor
        $categoria = $request->input('categoria');

        //se tem: ?name=valor
        $name = $request->input('name');

        if($categoria) {
            $produtos = Produto::where('categoria', $categoria)->get();
        } elseif($name){
            $produtos = Produto::where('name', $name)->get();
        } else {
            $produtos = Produto::all();
        }
        return response()->json($produtos);
    }

    public function update(int $id, Request $request)
    {
        //Conceito do Put em Rest, é substituir
        $produto = Produto::findOrFail($id);

        //estamos preenchendo o que veio da request no produtos que selecionamos pelo ID
        $produto->fill($request->all());

        if ($produto->save()) {
            return response()->json($produto, 202);
        }
        return response('Erro ao atualizar', 400);
    }

    public function delete(int $id)
    {
        $produto = Produto::find($id);

        if (!$produto) {
            return response()->json(["error" => "Produto não encontrado"], 404);
        }

        if ($produto->delete()) {
            return response()->json(["message" => "Produto excluído com sucesso"], 200);
        }

        return response()->json(["error" => "Erro ao excluir o produto"], 500);
    }


}
