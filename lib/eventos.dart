import 'package:flutter/material.dart';

class Evento {
  final String nome;
  final String local;
  final String horario;

  Evento(this.nome, this.local, this.horario);
}

class Eventos extends StatelessWidget {
  final List listaEventos = [
    Evento("Palestra X", "Auditório Y", "13:30"),
    Evento("Gincana", "Parque Infantil", "17:20"),
// Adicione mais eventos aqui
  ];

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: Text('Eventos Diários no Hotel'),
        backgroundColor: Colors.red,
      ),
        body: ListView.builder(
          itemCount: listaEventos.length,
          itemBuilder: (context, index) {
            final evento = listaEventos[index];
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(evento.nome),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Local: ${evento.local}'),
                    Text('Horário: ${evento.horario}'),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
