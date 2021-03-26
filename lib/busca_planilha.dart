import 'package:flutter/material.dart';
import 'package:ttst_ct/busca_planilha_answer.dart';
import 'package:ttst_ct/models/situacao_model.dart';

class BuscaWidget extends StatelessWidget {
  final List<Busca> lista;
  BuscaWidget({Key key, this.lista}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final siteController = TextEditingController();
  final descricaoServicoController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TTST-CT"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Localidade",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      controller: siteController,
                      decoration: InputDecoration(
                        hintText: "ASSIS",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "SERVIÇO",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      controller: descricaoServicoController,
                      decoration: InputDecoration(
                        hintText: "121.5",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          List<Busca> filtro = [];
                          filtro.addAll(this.lista.where((element) =>
                              element.local.contains(siteController.text) &&
                              element.descricaoServico
                                  .contains(descricaoServicoController.text)));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuscaResposta(
                                  lista: filtro,
                                ),
                              ));
                        },
                        child: Text("Pesquisar"))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
