import 'package:flutter/material.dart';
import 'room_list_screen.dart'; // Importe o arquivo da tela de quartos

class PaginaLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String emailUsuario = "emailusuario@gmail.com";
  final String senhaUsuario = "123456789";
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

                if (email == emailUsuario && senha == senhaUsuario) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoomListScreen(),
                    ),
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
