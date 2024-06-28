import 'package:flutter/material.dart';
import 'package:projeto_authentication/_core/minhas_cores.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool queroEntrar = true;

  @override
  Widget build(BuildContext context) {
    onPressed() {}
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(radius: 1, colors: [
              MyColors.gradUm,
              MyColors.gradDois,
            ])),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 225,
                  ),
                  const Text(
                    'DiegoApp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    height: 16,
                    child: Text(
                      'EMAIL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: MyColors.branco, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('example@email.com'),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    height: 16,
                    child: Text('SENHA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: MyColors.branco,
                            fontWeight: FontWeight.bold)),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        fixedSize:
                            WidgetStatePropertyAll(Size(double.infinity, 65)),
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(MyColors.azulEscuro)),
                    // ElevatedButton.styleFrom(
                    //     backgroundColor: MyColors.azulEscuro,
                    //     minimumSize: Size(double.infinity, 65),
                    //     ),
                    onPressed: () {},
                    child: Text(
                      (queroEntrar) ? 'Entrar' : 'Cadastrar',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: MyColors.branco),
                    ),
                  ),
                  const Divider(),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          queroEntrar = !queroEntrar;
                        });
                      },
                      child: const Text(
                        'Não tem conta? Clique aqui.',
                        style: TextStyle(
                          color: MyColors.branco,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
