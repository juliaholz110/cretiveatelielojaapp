import 'package:flutter/material.dart';
import 'package:loja_velass/tela_shopping.dart';
import 'package:shared_preferences/shared_preferences.dart';  // Importar o pacote

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorited = false; // Variável para controlar se o produto é favoritado ou não
  bool isSaved = false; // Variável para controlar se o produto é salvo
  double rating = 4.0; // A média de avaliação (pode vir de uma base de dados)
  int selectedQuantity = 1; // Quantidade selecionada
  bool isGift = false; // Se o produto é para presente ou não
  TextEditingController customNoteController = TextEditingController(); // Controlador do campo de observações

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Carregar preferências (estado de favorito e salvo)
  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorited = prefs.getBool('isFavorited_${widget.product.name}') ?? false;
      isSaved = prefs.getBool('isSaved_${widget.product.name}') ?? false;
    });
  }

  // Salvar o estado das preferências
  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFavorited_${widget.product.name}', isFavorited);
    prefs.setBool('isSaved_${widget.product.name}', isSaved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                widget.product.imageUrl,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Descrição do Produto:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Aqui vai uma descrição mais detalhada do produto, suas características, benefícios, etc.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            // Estrelas de Avaliação
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 30.0,
                );
              }),
            ),
            SizedBox(height: 20.0),
            // Caixa de Texto para Observações ou Personalização
            TextField(
              controller: customNoteController,
              decoration: InputDecoration(
                labelText: 'Observações ou Personalização',
                border: OutlineInputBorder(),
                hintText: 'Adicione algo aqui...',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20.0),
            // Seletor de Quantidade
            Row(
              children: [
                Text(
                  'Quantidade: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                DropdownButton<int>(
                  value: selectedQuantity,
                  items: List.generate(10, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      selectedQuantity = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Caixa de Seleção para "É para presente?"
            Row(
              children: [
                Text(
                  'É para presente??? ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Checkbox(
                  value: isGift,
                  onChanged: (bool? value) {
                    setState(() {
                      isGift = value!;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Botão de Favorito
                IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.grey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                    _savePreferences(); // Salvar estado do favorito
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isFavorited
                            ? 'Produto adicionado aos favoritos!'
                            : 'Produto removido dos favoritos!'),
                      ),
                    );
                  },
                ),
                // Botão de Salvar
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.save : Icons.save_alt,
                    color: isSaved ? Colors.green : Colors.grey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                    _savePreferences(); // Salvar estado de salvo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isSaved
                            ? 'Produto salvo!'
                            : 'Produto removido dos salvos!'),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

// Widget para exibir um card de produto
class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega para a tela de detalhes do produto
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
