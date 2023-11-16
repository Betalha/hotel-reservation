import 'package:flutter/material.dart';
import 'User.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Campo de imagem de perfil
              CircleAvatar(
                radius: 60, // Ajuste conforme necessário
                backgroundImage: AssetImage(
                    'img/PerfilTeste.png'), // Substitua pelo caminho da imagem do perfil
              ),
              SizedBox(
                  height:
                      20), // Espaçamento entre a imagem e as informações do usuário
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
      ),
    );
  }
}
