import 'package:flutter/material.dart';

class JogosPage extends StatelessWidget {
  final titles = [
    "Jogo sobre enchentes",
    "Jogo sobre precaução",
    "Jogo de como as enchentes acontecem",
    "Jogo de o que fazer em uma situação crítica"
  ];

  final subTitles = [
    "Este é um texto de exemplo para a legenda do artigo.",
    "Lorem Ipsum é simplesmente um texto fictício da indústria tipográfica.",
    "É um fato estabelecido que um leitor se distrairá com o conteúdo legível.",
    "Várias versões evoluíram ao longo dos anos, às vezes por acidente.",
  ];

  JogosPage({super.key});
  
  Widget buildItem(String titulo, String subtitulo) {
    return ListTile(
      leading: FlutterLogo(),
      title: Text(titulo),
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
        title: Text("Jogos Educativos"),
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
