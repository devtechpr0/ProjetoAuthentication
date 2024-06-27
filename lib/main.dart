import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TelaAutenticacao());
}

class TelaAutenticacao extends StatelessWidget {
  const TelaAutenticacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(65),
                width: 200,
                height: 200,
                color: Colors.deepPurple,
                child: const Text(
                  'Aqui vai uma imagem.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Campo 1 pra digitar usuário'),
              const SizedBox(
                height: 15,
              ),
              const Text('Campo 2 pra digitar senha')
            ],
          ),
        ),
      ),
    );
  }
}
