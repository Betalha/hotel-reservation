import 'package:flutter/material.dart';
import 'package:hotel/main.dart';
import 'User.dart';

class PaginaCadastro extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final String errorMessage = ''; // Mensagem de erro inicialmente vazia
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordConfirmController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirme a Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica de cadastro aqui
                String nome = nameController.text;
                String email = emailController.text;
                String senha = passwordController.text;
                String confirmaSenha = passwordConfirmController.text;

                if (nome.isNotEmpty &&
                    email.isNotEmpty &&
                    senha.isNotEmpty &&
                    confirmaSenha.isNotEmpty) {
                  User newUser =
                      User(name: nome, email: email, password: senha);
                  users.add(newUser);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Erro de cadastro'),
                        content: Text('Preencha todos os campos'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Fecha o AlertDialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }

                // Exemplo de impressão dos dados
                print('Nome: $nome');
                print('Email: $email');
                print('Senha: $senha');
                print('Confirmação de Senha: $confirmaSenha');

                // Limpa os campos após o cadastro
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                passwordConfirmController.clear();
              },
              child: Text('Cadastrar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
