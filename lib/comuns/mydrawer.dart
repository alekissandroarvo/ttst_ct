import 'package:flutter/material.dart';
import 'package:ttst_ct/busca_planilha.dart';
import 'package:ttst_ct/models/situacao_model.dart';
import '../situacao.dart';

class TTSTDrawer extends StatelessWidget {
  final List<Busca> lista2;
  TTSTDrawer({Key key, this.lista2}) : super(key: key);
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'MENU',
              style: TextStyle(height: 5, fontSize: 14),
            ),
            decoration: BoxDecoration(
              color: Colors.blue[100],
            ),
          ),
          Card(
            child: ListTile(
                title: Text("Situação Operacional"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SituacaoPage(),
                      ));
                }),
          ),
          Card(
            child: ListTile(
                title: Text("Pesquisa"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuscaWidget(),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
