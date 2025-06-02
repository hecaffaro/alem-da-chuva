import 'package:flutter/material.dart';

class ArtigosPage extends StatelessWidget {
  final titles = [
    "O que são enchentes?",
    "O que fazer para se precaver",
    "Como as enchentes acontecem?",
    "O que fazer em um momento crítico?"
  ];

  final subTitles = [
    "Este é um texto de exemplo para a legenda do artigo.",
    "Lorem Ipsum é simplesmente um texto fictício da indústria tipográfica.",
    "É um fato estabelecido que um leitor se distrairá com o conteúdo legível.",
    "Várias versões evoluíram ao longo dos anos, às vezes por acidente.",
  ];

  ArtigosPage({super.key});

  Widget buildItem(String titulo, String subtitulo) {
    return ListTile(
      leading: FlutterLogo(),
      title: Text('Artigos sobre enchentes'),
      subtitle: Text(
        subtitulo,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text("1d"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artigos sobre enchentes"),
        leading: Icon(Icons.menu),
      ),
      body: ListView.separated(
        itemCount: titles.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return buildItem(titles[index], subTitles[index % subTitles.length]);
        },
      ),
    );
  }
}
