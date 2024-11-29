
class Produto{
  String titulo;
  String preco;
  String descricao;
  String imagem;
  String avaliacao;



  Produto({
    //dummy json
    required this.titulo,
    required this.preco,
    required this.descricao,
    required this.imagem,
    required this.avaliacao,

  });

  Produto.fromJson(Map<String, dynamic> json)
    : titulo = json['title'].toString(),
      preco = json['price'].toString(),
      descricao = json['description'].toString(),
      imagem = json['thumbnail'].toString(),
      avaliacao = json['rating'].toString();



  get categoria => null;
}