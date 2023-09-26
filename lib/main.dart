import 'package:flutter/material.dart';
import 'room_list_screen.dart'; // Importe o arquivo da tela de quartos
import 'cadastro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de teste'),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomListScreen(),
                ),
              );
            },
            child: Text('Ver Quartos'),
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
                  builder: (context) => Cadastro(),
                ),
              );
            },
            child: Text("Cadastro"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          )
        ],
      )),
    );
  }
}
