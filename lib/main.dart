import 'package:flutter/material.dart';
import 'package:hotel/eventos.dart';
import 'cadastro.dart';
import 'login.dart';
import 'perfil.dart';
import 'User.dart';

void main() {
  runApp(MyApp());
}

List<User> users = [];
bool isLoggedIn =
    false; // Adicione essa variável para controlar o status de login

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
        title: Text('Fotos do Hotel'),
        backgroundColor: Colors.red,
        actions: [
          // Adicione um indicador de login na barra de aplicativos
          isLoggedIn
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                )
              : Container(), // Oculta o indicador se o usuário não estiver logado
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
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
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
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
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
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
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Aqui, estamos criando uma instância fictícia de User.
                      // Você deve substituir isso com o usuário real que está logado.
                      User currentUser = User(
                          name: 'Nome do Usuário',
                          email: 'usuario@email.com',
                          password: "12345");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Perfil(user: currentUser),
                        ),
                      );
                    },
                    child: Text("Perfil"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: HotelPhoto(imageUrl: 'img/basic.jpeg'),
                  ),
                ),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: HotelPhoto(imageUrl: 'img/luxo.jpeg'),
                  ),
                ),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: HotelPhoto(imageUrl: 'img/exc.jpeg'),
                  ),
                ),
                // Adicione mais imagens conforme necessário
              ],
            ),
          ),
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
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
