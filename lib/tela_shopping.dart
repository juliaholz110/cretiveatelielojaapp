import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loja_velass/tela_personalizacao.dart';
import 'package:loja_velass/tela_produto.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white60,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

// Modelo de dados para representar um produto
class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final String aroma; // Adicionado aroma

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.aroma, // Agora o aroma é uma propriedade do produto
  });
}

// Lista de produtos fictícios
List<Product> products = [
  Product(
    name: 'Vela Aromática Maçã com Canela',
    imageUrl: 'assets/images/maca.webp',
    price: 25.00,
    description: 'Vela perfumada com essência de maçã e canela.',
    aroma: 'Maçã com Canela',
  ),
  Product(
    name: 'Vela Aromática Capim e Limão',
    imageUrl: 'assets/images/capim.webp',
    price: 25.00,
    description: 'Uma vela refrescante com aroma de capim e limão.',
    aroma: 'Capim e Limão',
  ),
  Product(
    name: 'Vela Aromática Pessego',
    imageUrl: 'assets/images/pessego.webp',
    price: 25.00,
    description: 'Vela doce e suave com aroma de pêssego.',
    aroma: 'Pêssego',
  ),
  Product(
    name: 'Vela Aromática Café',
    imageUrl: 'assets/images/cafe.webp',
    price: 25.00,
    description: 'Vela com o aroma agradável de café fresco.',
    aroma: 'Café',
  ),
  Product(
    name: 'Vela Flor De Figo',
    imageUrl: 'assets/images/florfigo.webp',
    price: 25.00,
    description: 'Uma vela com o delicado aroma de flor de figo.',
    aroma: 'Flor de Figo',
  ),
  Product(
    name: 'Vela Aromática Bergamota',
    imageUrl: 'assets/images/bergamota.webp',
    price: 25.00,
    description: 'Vela refrescante com aroma cítrico de bergamota.',
    aroma: 'Bergamota',
  ),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> filteredProducts = [];
  int _currentCategoryIndex = 0;
  String _selectedAroma = 'Todos'; // Adicionando estado para o aroma selecionado

  @override
  void initState() {
    super.initState();
    filteredProducts.addAll(products);
  }

  void filterProductsByAroma(String aroma) {
    setState(() {
      _selectedAroma = aroma;
      if (aroma == 'Todos') {
        filteredProducts = List.from(products);
      } else {
        filteredProducts = products.where((product) => product.aroma == aroma).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CriativeAtêlie',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCartPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Usuário', style: TextStyle(color: Colors.white)),
              accountEmail: Text('email@exemplo.com', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {
                Navigator.pop(context);
                // Navegar para a tela de favoritos
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Carrinho de Compras'),
              onTap: () {
                Navigator.pop(context);
                // Navegar para o carrinho de compras
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingCartPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Histórico de Compras'),
              onTap: () {
                Navigator.pop(context);
                // Navegar para histórico de compras
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PurchaseHistoryPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              onTap: () {
                Navigator.pop(context);
                // Navegar para ajuda
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                // Navegar para configurações
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                Navigator.pop(context);
                // Lógica para sair do aplicativo ou navegação para tela inicial
              },
            ),
          ],
        ),
      ),
      ///////////////////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'DESTAQUES',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  changeCategory(index);
                },
              ),
              items: products.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Image.network(
                        'assets/images/velacarrossel.jpg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'ESCOLHA O SEU AROMA:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            // Bolinhas de aroma
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAromaBubble('Todos'),
                  _buildAromaBubble('Maçã com Canela'),
                  _buildAromaBubble('Capim e Limão'),
                  _buildAromaBubble('Pêssego'),
                  _buildAromaBubble('Café'),
                  _buildAromaBubble('Flor de Figo'),
                  _buildAromaBubble('Bergamota'),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomizationPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Fundo preto
                onPrimary: Colors.white, // Texto branco
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0), // Aumenta o tamanho do botão
                textStyle: TextStyle(fontSize: 20), // Aumenta o tamanho do texto
              ),
              child: Text('Personalizar Vela'),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'ESCOLHA A SUA VELA:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            ProductList(filteredProducts),
          ],
        ),
      ),
    );
  }

  // Função para construir cada bolinha de aroma
  Widget _buildAromaBubble(String aroma) {
    return GestureDetector(
      onTap: () => filterProductsByAroma(aroma),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _selectedAroma == aroma ? Colors.black : Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Text(
          aroma[0], // Exibe a primeira letra de cada aroma
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }



  void changeCategory(int index) {}
}
////////////////////////////////////////////////////////////////////////////////////
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: Center(child: Text('Tela de Favoritos')),
    );
  }
}

class PurchaseHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Compras'),
      ),
      body: Center(child: Text('Tela de Histórico de Compras')),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuda'),
      ),
      body: Center(child: Text('Tela de Ajuda')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(child: Text('Tela de Configurações')),
    );
  }
}


///////////////////////////////////////////////////////////////
// Widget para exibir a lista de produtos em cards
class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(products[index]);
      },
      padding: EdgeInsets.all(10.0),
    );
  }
}

// Widget para exibir um card de produto
//aquiiiiiiiiiiii

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
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Define a cor de fundo como preta
                      onPrimary: Colors.white, // Define a cor do texto como branca
                    ),
                    onPressed: () {
                      // Adiciona o produto ao carrinho
                      shoppingCart.addProduct(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} adicionado ao carrinho!'),
                        ),
                      );
                    },
                    child: Text('Adicionar ao Carrinho'),
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

//////////////////////////////////////////////
// Página do carrinho de compras
class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: shoppingCart.products.isEmpty
          ? Center(
        child: Text('Seu carrinho está vazio.'),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shoppingCart.products.length,
              itemBuilder: (context, index) {
                final product = shoppingCart.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  leading: Image.network(product.imageUrl),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    color: Colors.black, // Cor do ícone preta
                    onPressed: () {
                      setState(() {
                        shoppingCart.removeProduct(product);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${shoppingCart.total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black, // Cor de fundo preta
              onPrimary: Colors.white, // Cor do texto branca
            ),
            onPressed: () {
              // Processar o pagamento ou ação final
            },
            child: Text('Finalizar Compra'),
          ),
        ],
      ),
    );
  }
}


// Tela de Pesquisa
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Product> filteredResults = List.from(products);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      filterSearchResults();
    });
  }

  void filterSearchResults() {
    String query = _searchController.text;
    setState(() {
      filteredResults = products
          .where((product) => product.name
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisar Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar por nome...',
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredResults[index].name),
                    subtitle: Text('\$${filteredResults[index].price}'),
                    leading: Image.network(filteredResults[index].imageUrl),
                    onTap: () {
                      // Navega para a página de detalhes do produto
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: filteredResults[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCart {
  // Lista para armazenar os produtos no carrinho
  List<Product> products = [];

  // Adicionar um produto ao carrinho
  void addProduct(Product product) {
    products.add(product);
  }

  // Remover um produto do carrinho
  void removeProduct(Product product) {
    products.remove(product);
  }

  // Obter o total do carrinho
  double get total {
    double total = 0.0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }
}

// Criar uma instância global do carrinho de compras
ShoppingCart shoppingCart = ShoppingCart();