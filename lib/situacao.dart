import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'models/situacao_model.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'comuns/mydrawer.dart';
import 'situacao_answer.dart';

class SituacaoPage extends StatelessWidget {
  List<SituacaoModel> lista;
  SituacaoPage({Key key, this.lista}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final siteController = TextEditingController();
  final linkController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TTSTDrawer(
        lista: this.lista,
      ),
      appBar: AppBar(
        title: Text("Situação Operacional"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // Trecho para averiguar impacto via TextFormField
                    Text(
                      "Localidade da pane",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      controller: siteController,
                      decoration: InputDecoration(
                        hintText: "CT",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "Link Inoperante",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      controller: linkController,
                      decoration: InputDecoration(
                        hintText: "OI",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List<SituacaoModel> filtro = [];
                        filtro.addAll(this.lista.where((element) =>
                            element.site == siteController.text &&
                            element.link == linkController.text));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SituacaoAnswerPage(
                                lista: filtro,
                              ),
                            ));
                      },
                      child: Text("Get Situation"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
