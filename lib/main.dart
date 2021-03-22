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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Situação Operacional"),
      ),
      body: Center(
        child: Text("APP das Situações Operacioanis"),
      ),
    );
  }
}
