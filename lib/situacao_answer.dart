import 'package:flutter/material.dart';
import 'models/situacao_model.dart';

class SituacaoAnswerPage extends StatefulWidget {
  final List<SituacaoModel> lista;
  SituacaoAnswerPage({Key key, this.lista}) : super(key: key);
  @override
  _SituacaoAnswerPageState createState() => _SituacaoAnswerPageState();
}

class _SituacaoAnswerPageState extends State<SituacaoAnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Situação operacional"),
      ),
      body: ListView.builder(
          itemCount: widget.lista.length,
          itemBuilder: (context, index) {
            String apresentacao = '''
            Site: ${widget.lista[index].site},
            Link Inoperante: ${widget.lista[index].link},
            Serviço Inoperante: ${widget.lista[index].servico},
            Cobertura: ${widget.lista[index].servico} ${widget.lista[index].cobertura}
            Serviço Alternativo: 
            QRG:${widget.lista[index].servicoAlternativo} Link:${widget.lista[index].linkAlternativo}
            ''';
            return Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SelectableText.rich(
                    TextSpan(
                      text: "$apresentacao",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    showCursor: true,
                    cursorColor: Colors.blue,
                    cursorWidth: 5,
                    cursorRadius: Radius.circular(5),
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                    scrollPhysics: ClampingScrollPhysics(),
                  ),
                  /*
                      Text(
                        "Site:",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        widget.lista[index].site,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Link inoperante:",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        widget.lista[index].link,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Serviço Fora:",
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      widget.lista[index].servico,
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      widget.lista[index].setor,
                      style: TextStyle(fontSize: 18),
                    ),
                  ]),
                  Row(
                    children: <Widget>[
                      Text(
                        "Cobertura:",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        widget.lista[index].servico,
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        widget.lista[index].cobertura,
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Link Alternativo:",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        widget.lista[index].linkAlternativo,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Serviço Alternativo:",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        widget.lista[index].servicoAlternativo,
                        style: TextStyle(fontSize: 18),
                      ),*/
                ],
              ),
            );
          }
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
