import 'package:flutter/material.dart';
import 'User.dart'; // Importe a classe User

class Perfil extends StatelessWidget {
  final User user;

  Perfil({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuário'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nome: ${user.name}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 18),
            ),
            // Adicione outros campos de informação do usuário aqui, se necessário
          ],
        ),
      ),
    );
  }
}
