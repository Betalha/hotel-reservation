import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hotel/eventos.dart';
import 'cadastro.dart';
import 'login.dart';
import 'perfil.dart';
import 'User.dart';

void main() {
  runApp(MyApp());
}

List<User> users = [];

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        home: HotelPhotoScreen(),
      ),
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
        actions: [
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return authProvider.isLoggedIn
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                    )
                  : Container();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
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
                const SizedBox(width: 10),
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
                    child: const Text("Login"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
                    child: const Text("Eventos"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final authProvider =
                          Provider.of<AuthProvider>(context, listen: false);

                      if (authProvider.isLoggedIn) {
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
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaginaLogin(),
                          ),
                        );
                      }
                    },
                    child: const Text("Perfil"),
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
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
