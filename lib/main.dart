import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'models/situacao_model.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'comuns/mydrawer.dart';
import 'situacao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var bytes = await rootBundle.load("assets/ttst_ct.xlsx");
  var buffer = bytes.buffer;
  var some = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

  var excel = Excel.decodeBytes(some);
  var sheet = excel['map'];

  List<SituacaoModel> lista_situacao = [];

  for (int row = 0; row < sheet.maxRows; row++) {
    List<String> lista = [];
    for (int i = 0; i < sheet.maxCols; i++) {
      lista.add(sheet
          .cell(CellIndex.indexByColumnRow(rowIndex: row, columnIndex: i))
          .value
          .toString());
    }
    lista_situacao.add(SituacaoModel.lista(lista));
  }

  runApp(MyApp(listaApp: lista_situacao));
}

// print(lista_situacao);

class MyApp extends StatelessWidget {
  final List<SituacaoModel> listaApp;

  MyApp({Key key, this.listaApp}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        lista: listaApp,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<SituacaoModel> lista;
  MyHomePage({Key key, this.lista}) : super(key: key);

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
                    Text(
                      "Localidade da pane",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      controller: siteController,
                      decoration: InputDecoration(
                        hintText: "Assis",
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
                              builder: (context) => SituacaoPage(
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
