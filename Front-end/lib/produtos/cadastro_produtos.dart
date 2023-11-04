import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Produto {
  int? id;
  String? nome;
  String? descricao;
  double? preco;
  int? quantidade;
  String? imagem;
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

Future<void> cadastrarProdutoGamer(String? nome, String? descricao,
    double? preco, int? quantidade, String? imagem, context) async {
  if (nome == null ||
      descricao == null ||
      preco == null ||
      quantidade == null ||
      imagem == null) {
    const snackBar = SnackBar(
      content: Text(
          'Por favor, preencha todas informações para cadastrar o produto.',
          style: TextStyle(color: Color.fromRGBO(40, 40, 40, 1))),
      duration: Duration(seconds: 4),
      backgroundColor: Color.fromRGBO(233, 213, 2, 1),
    );



    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (nome.isEmpty ||
      descricao.isEmpty ||
      preco.isNaN ||
      quantidade.isNaN ||
      imagem.isEmpty) {
    const snackBar = SnackBar(
      content: Text(
          'Por favor, preencha todas informações para cadastrar o produto.',
          style: TextStyle(color: Color.fromRGBO(40, 40, 40, 1))),
      duration: Duration(seconds: 4),
      backgroundColor: Color.fromRGBO(233, 213, 2, 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    await http
        .post(Uri.parse('http://localhost:3000/listaGamer'),
            headers: <String, String>{'Content-type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
              'nome': nome,
              'descricao': descricao,
              'preco': preco,
              'quantidade': quantidade,
              'imagem': imagem
            }))
        .then((value) => {
              if (value.statusCode == 201)
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item cadastrado com sucesso.'),
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.green,
                  ))
                }
              else
                {throw Error}
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ocorreu um erro ao registrar o produto.'),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
      ));
    });
  }
}
  



Future<void> cadastrarProdutoHardware(String? nome, String? descricao,
    double? preco, int? quantidade, String? imagem, context) async {
  if (nome == null ||
      descricao == null ||
      preco == null ||
      quantidade == null ||
      imagem == null) {
    const snackBar = SnackBar(
      content: Text(
          'Por favor, preencha todas informações para cadastrar o produto.'),
      duration: Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (nome.isEmpty ||
      descricao.isEmpty ||
      preco.isNaN ||
      quantidade.isNaN ||
      imagem.isEmpty) {
    const snackBar = SnackBar(
      content: Text(
          'Por favor, preencha todas informações para cadastrar o produto.',
          style: TextStyle(color: Color.fromRGBO(40, 40, 40, 1))),
      duration: Duration(seconds: 4),
      backgroundColor: Color.fromRGBO(233, 213, 2, 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    await http
        .post(Uri.parse('http://localhost:3000/listaDeHardware'),
            headers: <String, String>{'Content-type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
              'nome': nome,
              'descricao': descricao,
              'preco': preco,
              'quantidade': quantidade,
              'imagem': imagem
            }))
        .then((value) => {
              if (value.statusCode == 201)
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item cadastrado com sucesso.'),
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.green,
                  ))
                }
              else
                {throw Error}
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ocorreu um erro ao registrar o produto.'),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
      ));
    });
  }
}

Future<void> cadastrarProdutoRede(String? nome, String? descricao,
    double? preco, int? quantidade, String? imagem, context) async {
  if (nome == null ||
      descricao == null ||
      preco == null ||
      quantidade == null ||
      imagem == null) {
    const snackBar = SnackBar(
      content: Text(
          'Por favor, preencha todas informações para cadastrar o produto.',
          style: TextStyle(color: Color.fromRGBO(40, 40, 40, 1))),
      duration: Duration(seconds: 4),
      backgroundColor: Color.fromRGBO(233, 213, 2, 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (nome.isEmpty ||
      descricao.isEmpty ||
      preco.isNaN ||
      quantidade.isNaN ||
      imagem.isEmpty) {
    const snackBar = SnackBar(
      content: Text(
          'Por favor, preencha todas informações para cadastrar o produto.'),
      duration: Duration(seconds: 4),
      backgroundColor: Color.fromRGBO(233, 213, 2, 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    await http
        .post(Uri.parse('http://localhost:3000/listaDeRede'),
            headers: <String, String>{'Content-type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
              'nome': nome,
              'descricao': descricao,
              'preco': preco,
              'quantidade': quantidade,
              'imagem': imagem
            }))
        .then((value) => {
              if (value.statusCode == 201)
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item cadastrado com sucesso.'),
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.green,
                  ))
                }
              else
                {throw Error}
            })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Ocorreu um erro ao registrar o produto.'),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
      ));
    });
  }
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

Future<void> apagarProdutoGamer(int id) async {
  await http.delete(
    Uri.parse('http://localhost:3000/listaGamer/$id'),
    headers: <String, String>{'Content-type': 'application/json'},
  );
}

Future<void> apagarProdutoHardware(int id) async {
  await http.delete(
    Uri.parse('http://localhost:3000/listaDeHardware/$id'),
    headers: <String, String>{'Content-type': 'application/json'},
  );
}

Future<void> apagarProdutoRede(int id) async {
  await http.delete(
    Uri.parse('http://localhost:3000/listaDeRede/$id'),
    headers: <String, String>{'Content-type': 'application/json'},
  );
}

class ConteudoPagina extends State {
  String? nome;
  String? descricao;
  double? preco;
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
        padding: EdgeInsets.all(40.0),
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
                          cadastrarProdutoGamer(
                              nome, descricao, preco, quantidade, imagem, context);
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
                              nome, descricao, preco, quantidade, imagem, context);
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
                              nome, descricao, preco, quantidade, imagem, context);
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
                        color: Colors.pink,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.pink,
                            width: 2.0,
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(text: 'Gamer'),
                        Tab(text: 'Rede'),
                        Tab(text: 'Hardware'),
                      ],
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.pink,
                    ),
                    body: TabBarView(
                      children: [
                        _buildProdutoList(
                            selecionarProdutosGamer, apagarProdutoGamer),
                        _buildProdutoList(
                            selecionarProdutosRede, apagarProdutoRede),
                        _buildProdutoList(
                            selecionarProdutosHardware, apagarProdutoHardware),
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

  Widget _buildProdutoList(Future<List<Produto>> Function() fetchProdutos,
      Future<void> Function(int id) deletarProdutos) {
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          setState(() {
                            _mostrarDetalhesProduto(
                                context, snapshot.data![index]);
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            int? id = snapshot.data![index].id;
                            deletarProdutos(id!);
                          });
                        },
                      ),
                    ],
                  ),
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
              Text("Preço: ${produto.preco?.toStringAsFixed(2) ?? 'N/A'}"),
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
