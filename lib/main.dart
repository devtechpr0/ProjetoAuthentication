import 'package:flutter/material.dart';
import 'package:projeto_authentication/telas/autenticacao_tela.dart';

void main(List<String> args) {
  runApp(const TelaAutenticacao());
}

class TelaAutenticacao extends StatelessWidget {
  const TelaAutenticacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationScreen(),
    );
  }
}
