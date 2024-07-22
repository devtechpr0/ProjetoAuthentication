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
  final _formKey = GlobalKey<FormState>();
  String _pass = 'Teste';
  bool verSenha = true;
  double cordY = 0;

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
              key:
                  _formKey, //chave necessária para validação do formulario na hora que pressonar o botão
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
                                  'Já possui Cadastro? Entrar aqui...',
                                  style: TextStyle(
                                    color: MyColors.branco,
                                  ),
                                )),
                            const SizedBox(
                              height: 75,
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
                                    //Validação do campo Nome
                                    validator: (String? value) {
                                      //Se o campo estiver vazio
                                      if (value == null) {
                                        return '*Campo Obrigatório';
                                      }
                                      if (value.isEmpty) {
                                        return '*Campo Obrigatório!';
                                      }
                                      //Nome curto
                                      else if (value.length < 3) {
                                        return 'Nome ou Apelido curto';
                                      }
                                      //Se estiver tudo certo
                                      return null;
                                    },
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
                        //Validação do campo e-mail
                        validator: (String? value) {
                          //Se o campo estiver vazio
                          if (value == null) {
                            return '*Campo Obrigatório!';
                          }
                          if (value.isEmpty) {
                            return '*Campo Obrigatório!';
                          }
                          //Sem o @ e espaço
                          if (!value.contains('@') ||
                              value.length < 2 ||
                              value.contains(' ')) {
                            return 'E-mail inválido';
                          }
                          //Se estiver tudo certo
                          return null;
                        },
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
                      Stack(
                        alignment: AlignmentDirectional(0.95, cordY),
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration:
                                getAuthenticationInputDecoration('***********'),
                            //Validação da senha ??
                            validator: (String? value) {
                              _pass = value.toString();
                              //Se o campo estiver vazio
                              if (value == null) {
                                return '*Campo  Obrigatório';
                              } else if //E-mail curto
                                  (value.length < 4) {
                                setState(() {
                                  cordY = -0.75;
                                });
                                return 'Senha curta';
                              } else if (value.contains(' ')) {
                                setState(() {
                                  cordY = -0.75;
                                });
                                return 'Espaço não é aceito';
                              }
                              //Se estiver tudo certo
                              setState(() {
                                cordY = 0;
                              });
                              return null;
                            },
                            obscureText: verSenha,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.remove_red_eye_rounded,
                              color: MyColors.cinzaEscuro,
                            ),
                            onPressed: () => setState(() {
                              verSenha = !verSenha;
                            }),
                          )
                        ],
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
                                validator: (String? value) {
                                  //Se o campo estiver vazio
                                  if (value == null) {
                                    return '* Campo Obrigatório';
                                  } else if //Senha forem diferente
                                      (value != _pass) {
                                    return 'Senhas Diferentes';
                                  }
                                  //Se estiver tudo certo
                                  return null;
                                },
                                obscureText: verSenha,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 32,
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
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
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

  botaoPrincipalClicado() {
    if (_formKey.currentState!.validate()) {
      print('Tudo Certo');
    } else {
      print('Algo errado');
    }
  }
}
