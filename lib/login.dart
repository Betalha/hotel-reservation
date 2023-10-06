import 'package:flutter/material.dart';
import 'package:hotel/main.dart';
import 'room_list_screen.dart'; // Importe o arquivo da tela de quartos
import 'User.dart';

class PaginaLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String nomeUsuario = "Error";
  final String emailUsuario = "Error";
  final String senhaUsuario = "Error";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ElevatedButton(
              onPressed: () {
                // Lógica de cadastro aqui

                String email = emailController.text;
                String senha = passwordController.text;

                User achouUser = users.firstWhere(
                    (user) => user.email == email && user.password == senha,
                    orElse: () => User(
                        name: nomeUsuario,
                        email: emailUsuario,
                        password: senhaUsuario));

                if (achouUser.name != nomeUsuario) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoomListScreen(),
                    ),
                  );
                } else {
                  // Credenciais incorretas, exiba uma mensagem de erro
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Erro de login'),
                        content:
                            Text('Credenciais incorretas. Tente novamente.'),
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

                print('Email: $email');
                print('Senha: $senha');

                // Limpa os campos após o cadastro

                emailController.clear();
                passwordController.clear();
              },
              child: Text('Login'),
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
