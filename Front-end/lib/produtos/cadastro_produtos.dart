import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Produto {
  int? id;
  String? nome;
  double? preco;
  String? descricao;
  String? imagem;
  String? categoria;
  int? quantidade;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
        ),
      ),
      home: const PaginaCadastroProdutos(),
    );
  }
}

class PaginaCadastroProdutos extends StatefulWidget {
  const PaginaCadastroProdutos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConteudoPagina();
  }
}

Future<void> cadastrarProdutoGamer(String nome, double preco, String imagem,
    String descricao, String categoria, int quantidade) async {
  await http.post(Uri.parse('http://localhost:8000/api/produtos'),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'nome': nome,
        'preco': preco,
        'imagem': imagem,
        'descricao': descricao,
        'categoria': categoria,
        'quantidade': quantidade
      }));
}

Future<void> cadastrarProdutoHardware(String nome, String descricao,
    double preco, int quantidade, String imagem) async {
  await http.post(Uri.parse('http://localhost:3000/listaDeHardware'),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'nome': nome,
        'descricao': descricao,
        'preco': preco,
        'quantidade': quantidade,
        'imagem': imagem
      }));
}

Future<void> cadastrarProdutoRede(String nome, String descricao, double preco,
    int quantidade, String imagem) async {
  await http.post(Uri.parse('http://localhost:3000/listaDeRede'),
      headers: <String, String>{'Content-type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'nome': nome,
        'descricao': descricao,
        'preco': preco,
        'quantidade': quantidade,
        'imagem': imagem
      }));
}

Future<List<Produto>> selecionarProdutosGamer() async {
  var retorno = await http.get(Uri.parse('http://localhost:3000/listaGamer'));
  var dados = jsonDecode(retorno.body);
  List<Produto> produtos = [];
  for (var obj in dados) {
    Produto produto = Produto();
    produto.id = obj["id"];
    produto.nome = obj["nome"];
    produto.descricao = obj["descricao"];
    produto.preco = obj["preco"];
    produto.quantidade = obj["quantidade"];
    produto.imagem = obj["imagem"];
    produtos.add(produto);
  }
  return produtos;
}

Future<List<Produto>> selecionarProdutosHardware() async {
  var retorno =
      await http.get(Uri.parse('http://localhost:3000/listaDeHardware'));
  var dados = jsonDecode(retorno.body);
  List<Produto> produtos = [];
  for (var obj in dados) {
    Produto produto = Produto();
    produto.id = obj["id"];
    produto.nome = obj["nome"];
    produto.descricao = obj["descricao"];
    produto.preco = obj["preco"];
    produto.quantidade = obj["quantidade"];
    produto.imagem = obj["imagem"];
    produtos.add(produto);
  }
  return produtos;
}

Future<List<Produto>> selecionarProdutosRede() async {
  var retorno = await http.get(Uri.parse('http://localhost:3000/listaDeRede'));
  var dados = jsonDecode(retorno.body);
  List<Produto> produtos = [];
  for (var obj in dados) {
    Produto produto = Produto();
    produto.id = obj["id"];
    produto.nome = obj["nome"];
    produto.descricao = obj["descricao"];
    produto.preco = obj["preco"];
    produto.quantidade = obj["quantidade"];
    produto.imagem = obj["imagem"];
    produtos.add(produto);
  }
  return produtos;
}

class ConteudoPagina extends State {
  String? nome;
  String? descricao;
  double? preco;
  String? categoria;
  int? quantidade;
  String? imagem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Cadastro de Produtos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0), // Defina o espaço desejado aqui
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite um nome',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          nome = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite uma descrição',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          descricao = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite uma categoria',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          categoria = valor;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite um preço',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          preco = double.tryParse(valor);
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite uma quantidade',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          quantidade = int.tryParse(valor);
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Digite o endereço da imagem',
                      ),
                      onChanged: (valor) {
                        setState(() {
                          imagem = valor;
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cadastrarProdutoGamer(nome!, preco!, imagem!,
                              descricao!, categoria!, quantidade!);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.pink,
                          fixedSize: const Size(210, 20)),
                      child: const Text("Cadastrar Produto Gamer"),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cadastrarProdutoRede(
                              nome!, descricao!, preco!, quantidade!, imagem!);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.pink,
                          fixedSize: const Size(210, 20)),
                      child: const Text("Cadastrar Produto Rede"),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cadastrarProdutoHardware(
                              nome!, descricao!, preco!, quantidade!, imagem!);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.pink,
                          fixedSize: const Size(210, 20)),
                      child: const Text("Cadastrar Produto Hardware"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: const TabBar(
                      indicator: BoxDecoration(
                        color: Colors.pink, // Cor do sublinhado
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.pink, // Cor do sublinhado
                            width: 2.0, // Largura do sublinhado
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(text: 'Gamer'),
                        Tab(text: 'Rede'),
                        Tab(text: 'Hardware'),
                      ],
                      labelColor: Colors.white, // Cor do texto das guias ativas
                      unselectedLabelColor:
                          Colors.pink, // Cor do texto das guias inativas
                    ),
                    body: TabBarView(
                      children: [
                        _buildProdutoList(selecionarProdutosGamer),
                        _buildProdutoList(selecionarProdutosRede),
                        _buildProdutoList(selecionarProdutosHardware),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProdutoList(Future<List<Produto>> Function() fetchProdutos) {
    return FutureBuilder(
      future: fetchProdutos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        }
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _mostrarDetalhesProduto(context, snapshot.data![index]);
              },
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    "Nome: ${snapshot.data?[index].nome}",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "ID: ${snapshot.data?[index].id}",
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarDetalhesProduto(BuildContext context, Produto produto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Detalhes do Produto"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${produto.id}"),
              Text("Nome: ${produto.nome}"),
              Text("Descrição: ${produto.descricao}"),
              Text("Preço: ${produto.preco?.toStringAsFixed(2)}"),
              Text("Quantidade: ${produto.quantidade}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Fechar"),
            ),
          ],
        );
      },
    );
  }
}
