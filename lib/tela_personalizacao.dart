import 'package:flutter/material.dart';
import 'package:loja_velass/tela_contatovendedor.dart';

class CustomizationPage extends StatefulWidget {
  @override
  _CustomizationPageState createState() => _CustomizationPageState();
}

class _CustomizationPageState extends State<CustomizationPage> {
  String? selectedColor = 'Branco';
  String? customColor;
  String? selectedSize = 'P';
  String? selectedGlassType = 'Redondo';

  final List<String> colors = ['Branco', 'Marrom', 'Azul', 'Verde', 'Rosa', 'Preto', 'Amarelo', 'Roxo'];
  final List<String> sizes = ['P', 'M', 'G'];
  final List<String> glassTypes = ['Redondo', 'Quadrado', 'Triangular', 'Coração'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalização de Vela'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Escolha a Cor da Vela:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: selectedColor,
              onChanged: (String? newValue) {
                setState(() {
                  selectedColor = newValue;
                });
              },
              items: colors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text('Ou insira uma cor personalizada:', style: TextStyle(fontSize: 16)),
            TextField(
              onChanged: (text) {
                setState(() {
                  customColor = text;
                });
              },
              decoration: InputDecoration(hintText: 'Digite a cor personalizada'),
            ),
            SizedBox(height: 16),
            Text('Escolha o Tamanho da Vela:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: selectedSize,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSize = newValue;
                });
              },
              items: sizes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Escolha o Tipo de Vidro:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: selectedGlassType,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGlassType = newValue;
                });
              },
              items: glassTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Aqui você pode adicionar lógica para enviar o pedido
                    String customMessage = 'Pedido Personalizado: Cor: $selectedColor, Tamanho: $selectedSize, Vidro: $selectedGlassType, Cor personalizada: $customColor';
                    print(customMessage);

                    // Exibe o SnackBar confirmando o envio do pedido
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Pedido Personalizado Enviado!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Fundo preto
                    onPrimary: Colors.white, // Texto branco
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Aumenta o tamanho do botão
                    textStyle: TextStyle(fontSize: 18), // Aumenta o tamanho do texto
                  ),
                  child: Text('Enviar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navega para a tela de contato com o vendedor
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Fundo preto
                    onPrimary: Colors.white, // Texto branco
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Aumenta o tamanho do botão
                    textStyle: TextStyle(fontSize: 18), // Aumenta o tamanho do texto
                  ),
                  child: Text('Entrar em Contato '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
