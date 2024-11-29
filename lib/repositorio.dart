import 'dart:convert';
import 'produto.dart';
import 'package:http/http.dart' as http;

Future<List<Produto>> getProdutos() async{
  final url = Uri.parse('https://dummyjson.com/products?limit=0');
  final resposta = await http.get(url);

  final json = jsonDecode(resposta.body)['products'];

  return List<Produto>.from(json.map((item){
    return Produto.fromJson(item);
  }));
}