import 'package:flutter/material.dart';
import 'models/situacao_model.dart';

class BuscaResposta extends StatelessWidget {
  final List<Busca> lista;
  BuscaResposta({Key key, this.lista}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TTST CINDACTA II"),
      ),
      body: ListView.builder(
          itemCount: this.lista.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Local",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 5,
                  ),
                  Text(
                    this.lista[index].local,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "Serviço",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    this.lista[index].descricaoServico,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "Canal",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    this.lista[index].canal,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "Link",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    this.lista[index].designacao,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "Central",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    this.lista[index].central,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "Conexões",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    this.lista[index].conexoes,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
