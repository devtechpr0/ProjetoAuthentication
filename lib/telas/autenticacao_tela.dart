import 'package:flutter/material.dart';
import 'package:projeto_authentication/_core/decoracao.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // Colocar efeito gradiente em um Container
            decoration: const BoxDecoration(
                gradient: RadialGradient(radius: 1, colors: [
              MyColors.gradUm,
              MyColors.gradDois,
            ])),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            //Widget necessário para criar formularios
            child: Form(
              child: Center(
                // Widget para poder dar scroll na tela
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Visibility(
                        visible: queroEntrar,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/logo.png",
                              height: 225,
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                      // Widget para esconder ou mostrar algo (necessário um controle)
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            const Text(
                              'Criar Nova',
                              style: TextStyle(
                                color: MyColors.branco,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              'Conta',
                              style: TextStyle(
                                color: MyColors.branco,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Divider(),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    queroEntrar = !queroEntrar;
                                  });
                                },
                                child: const Text(
                                  'Já possui Cadastro? Entrar aqui..',
                                  style: TextStyle(
                                    color: MyColors.branco,
                                  ),
                                )),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: !queroEntrar,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                    child: Text(
                                      'NOME',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: MyColors.branco,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Formularios/Input do Usuário
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration:
                                        getAuthenticationInputDecoration(
                                            'Nome'),
                                  ),
                                ],
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 16,
                        child: Text(
                          'EMAIL',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: MyColors.branco,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: getAuthenticationInputDecoration(
                            'exemplo@email.com.br'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 16,
                        child: Text('SENHA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: MyColors.branco,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration:
                            getAuthenticationInputDecoration('***********'),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Visibility(
                          visible: !queroEntrar,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                                child: Text('CONFIRMAR SENHA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: MyColors.branco,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                textAlign: TextAlign.center,
                                decoration: getAuthenticationInputDecoration(
                                    'Confirme Senha'),
                                obscureText: true,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            //Mexer na borda do ElevatedButton
                            shape: WidgetStatePropertyAll(
                                // Tipo da borda
                                ContinuousRectangleBorder(
                                    // Aqui mexe no raio
                                    borderRadius: BorderRadius.circular(15))),
                            fixedSize: const WidgetStatePropertyAll(
                                Size(double.infinity, 65)),
                            backgroundColor:
                                const WidgetStatePropertyAll<Color>(
                                    MyColors.azulEscuro)),
                        onPressed: () {},
                        child: Text(
                          (queroEntrar) ? 'Entrar' : 'Cadastrar',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: MyColors.branco),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Visibility(
                        visible: queroEntrar,
                        child: Column(
                          children: [
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
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
