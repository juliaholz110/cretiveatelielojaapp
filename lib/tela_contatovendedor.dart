import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController _messageController = TextEditingController(); // Controlador para a caixa de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato com o Vendedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texto explicativo
            Text(
              'Entre em contato com o vendedor para mais informações.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Nome do vendedor
            Text(
              'Nome: João Silva',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Número de telefone fictício
            Text(
              'Telefone: (11) 98765-4321',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),

            // E-mail fictício
            Text(
              'E-mail: joao.silva@exemplo.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Caixa de texto para enviar uma mensagem
            Text(
              'Escreva sua mensagem:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _messageController,
              maxLines: 5, // Permite várias linhas de texto
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite sua mensagem aqui...',
              ),
            ),
            SizedBox(height: 20),

            // Botão de envio
            ElevatedButton(
              onPressed: () {
                // Captura a mensagem
                String message = _messageController.text;

                if (message.isNotEmpty) {
                  // Exibe a mensagem personalizada de sucesso
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Mensagem enviada")),
                  );
                  // Limpa a caixa de texto após o envio
                  _messageController.clear();
                } else {
                  // Exibe uma mensagem de erro caso a caixa de texto esteja vazia
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Por favor, escreva uma mensagem!")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Fundo preto
                onPrimary: Colors.white, // Texto branco
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0), // Aumenta o tamanho do botão
                textStyle: TextStyle(fontSize: 18), // Aumenta o tamanho do texto
              ),
              child: Text('Enviar mensagem '),
            ),
          ],
        ),
      ),
    );
  }
}
