import 'package:flutter/material.dart';
import 'room_list_screen.dart';

class RoomDetailsScreen extends StatelessWidget {
  final Room room; // Recebe o quarto específico como argumento

  RoomDetailsScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Quarto'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Exibe a imagem do quarto
            Image.asset(room.img,
                height: 200, width: double.infinity, fit: BoxFit.cover),

            SizedBox(height: 16),

            // Exibe informações do quarto
            Text(
              room.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              room.description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Preço: R\$${room.price.toStringAsFixed(2)} por noite',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 32),

            // Formulário de reserva
            Text(
              'Reservar este quarto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Data de check-in'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Data de check-out'),
            ),

            SizedBox(height: 16),

            // Botão de reserva
            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão de reserva
              },
              child: Text('Reservar'),
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
