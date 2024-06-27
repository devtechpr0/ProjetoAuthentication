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
                width: 15,
                height: 15,
                color: Colors.deepPurple,
              ),
              const Text('Testando a centralização'),
            ],
          ),
        ),
      ),
    );
  }
}
