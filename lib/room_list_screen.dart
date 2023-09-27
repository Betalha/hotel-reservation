import 'package:flutter/material.dart';
import 'package:hotel/room_details_screen.dart';

class Room {
  final String title;
  final String description;
  final double price;
  final String img;

  Room(this.title, this.description, this.price, this.img);
}

class RoomListScreen extends StatelessWidget {
  final List<Room> rooms = [
    Room('Quarto Deluxe', 'Quarto luxuoso com vista para o mar', 200.00, "img/exc.jpeg"),
    Room('Suíte Executiva', 'Suíte executiva com serviço de mordomo', 300.00, "img/luxo.jpeg"),
    Room('Quarto Padrão', 'Quarto confortável com todas as comodidades', 100.00, "img/basic.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quartos disponiveis'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomDetailsScreen(room: rooms[index],),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset(rooms[index].img),
                title: Text(rooms[index].title),
                subtitle: Text(rooms[index].description),
                trailing: Text('R\$${rooms[index].price.toStringAsFixed(2)}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
