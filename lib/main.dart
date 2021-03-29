import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'models/situacao_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'comuns/mydrawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var bytes = await rootBundle.load("assets/ttst_ct.xlsx");
  var buffer = bytes.buffer;
  var streamBuffer =
      buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

  var excel = Excel.decodeBytes(streamBuffer);
  //var sheet = excel['map'];
  var sheet2 = excel['map2'];

  List<Busca> lista_situacao2 = [];

  for (int row = 0; row < sheet2.maxRows; row++) {
    List<String> lista2 = [];
    for (int i = 0; i < sheet2.maxCols; i++) {
      lista2.add(sheet2
          .cell(CellIndex.indexByColumnRow(rowIndex: row, columnIndex: i))
          .value
          .toString());
    }
    lista_situacao2.add(Busca.lista(lista2));
  }

  runApp(
    MyApp(listaApp2: lista_situacao2),
  );
}

// print(lista_situacao);

class MyApp extends StatelessWidget {
  final List<Busca> listaApp2;

  MyApp({Key key, this.listaApp2}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        lista2: listaApp2,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Busca> lista2;
  MyHomePage({Key key, this.lista2}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TTSTDrawer(
        lista2: lista2,
      ),
      appBar: AppBar(
        title: Text("TTST CINDACTA2"),
      ),
      body: Center(
        child: Text(
          "APP das Situações Operacionais",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
