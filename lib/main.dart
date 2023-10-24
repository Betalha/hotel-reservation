import 'package:flutter/material.dart';
import 'package:hotel/eventos.dart';

import 'cadastro.dart';
import 'login.dart';
import 'eventos.dart';
import 'User.dart';

void main() {
  runApp(MyApp());
}

List<User> users = [];

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotelPhotoScreen(),
    );
  }
}

class HotelPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos do Hotel'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaginaCadastro(),
                ),
              );
            },
            child: const Text("Cadastro"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaginaLogin(),
                ),
              );
            },
            child: Text("Login"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Eventos(),
                ),
              );
            },
            child: Text("Eventos"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          ),
          HotelPhoto(imageUrl: 'img/basic.jpeg'),
          HotelPhoto(imageUrl: 'img/luxo.jpeg'),
          HotelPhoto(imageUrl: 'img/exc.jpeg'),
          // Adicione mais imagens conforme necessário
        ],
      ),
    );
  }
}

class HotelPhoto extends StatelessWidget {
  final String imageUrl;

  HotelPhoto({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.asset(imageUrl),
    );
  }
}
