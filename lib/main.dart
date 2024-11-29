import 'package:flutter/material.dart';
import 'tela_login.dart';

void main() {
  runApp(MaterialApp(
    home: MeuApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // Definindo o esquema de cores
      primaryColor: Colors.black,
      //scaffoldBackgroundColor: Colors.black, // Fundo da aplicação
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        primary: Colors.black, // Cor primária
        secondary: Colors.grey, // Cor secundária
      ),
      // Estilizando os botões
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black, // Cor dos botões
        textTheme: ButtonTextTheme.primary, // Texto dos botões
      ),
      // Estilizando AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black, // Cor da AppBar
        iconTheme: IconThemeData(color: Colors.white), // Cor dos ícones
      ),
      // Estilizando o texto

    ),
  ));
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TelaLogin();
  }
}