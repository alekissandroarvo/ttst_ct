import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SituacaoModel {
  String id;
  String site;
  String servico;
  String link;
  String setor;
  String cobertura;
  String linkAlternativo;
  String servicoAlternativo;
  String central;
  String observacoes;
  List<SituacaoModel> lista_situacao = [];

  SituacaoModel.createList() {
    listCreate();
  }

  SituacaoModel(
      {String id,
      String site,
      String servico,
      String link,
      String setor,
      String cobertura,
      String linkAlternativo,
      String servicoAlternativo,
      String central,
      String observacoes}) {
    this.id = id;
    this.site = site;
    this.servico = servico;
    this.link = link;
    this.setor = setor;
    this.cobertura = cobertura;
    this.linkAlternativo = linkAlternativo;
    this.servicoAlternativo = servicoAlternativo;
    this.central = central;
    this.observacoes = observacoes;
  }

  SituacaoModel.lista(List<String> lista) {
    this.id = lista[0];
    this.site = lista[1];
    this.servico = lista[2];
    this.link = lista[3];
    this.setor = lista[4];
    this.cobertura = lista[5];
    this.linkAlternativo = lista[6];
    this.servicoAlternativo = lista[7];
    this.central = lista[8];
    this.observacoes = lista[9];
  }

  Future<void> listCreate() async {
    var bytes = await rootBundle.load("assets/ttst_ct.xlsx");
    var buffer = bytes.buffer;
    var streamBuffer =
        buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    var excel = Excel.decodeBytes(streamBuffer);
    var sheet = excel['map'];

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
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class Busca {
  String id;
  String local;
  String servico;
  String descricaoServico;
  String canal;
  String designacao;
  String conexoes;
  String central;
  List<Busca> listaBusca = [];

  Busca.createList() {
    listCreate();
  }

  Busca(
      {String id,
      String local,
      String servico,
      String descricaoServico,
      String canal,
      String designacao,
      String conexoes,
      String central}) {
    this.id = id;
    this.local = local;
    this.servico = servico;
    this.descricaoServico = descricaoServico;
    this.canal = canal;
    this.designacao = designacao;
    this.conexoes = conexoes;
    this.central = central;
  }
  Busca.lista(List<String> lista) {
    this.id = lista[0];
    this.local = lista[1];
    this.servico = lista[2];
    this.descricaoServico = lista[3];
    this.canal = lista[4];
    this.designacao = lista[5];
    this.conexoes = lista[6];
    this.central = lista[7];
  }

  Future<void> listCreate() async {
    var bytes = await rootBundle.load("assets/ttst_ct.xlsx");
    var buffer = bytes.buffer;
    var streamBuffer =
        buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    var excel = Excel.decodeBytes(streamBuffer);
    var sheet = excel['map2'];

    for (int row = 0; row < sheet.maxRows; row++) {
      List<String> lista = [];
      for (int i = 0; i < sheet.maxCols; i++) {
        lista.add(sheet
            .cell(CellIndex.indexByColumnRow(rowIndex: row, columnIndex: i))
            .value
            .toString());
      }
      listaBusca.add(Busca.lista(lista));
    }
  }
}
