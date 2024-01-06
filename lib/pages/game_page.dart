import 'package:flutter/material.dart';
import 'package:games_list/request/api_game_request.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Infos"),
        backgroundColor: Colors.blueGrey[700],
      ),
      backgroundColor: Colors.indigo[700],
      body: SingleChildScrollView(
        child: Center(
            child: Container(
              padding:const EdgeInsets.all(20),
              child: Column(
          children: [
            if (gameSelec != null) ...[
              SizedBox(
                width: 350,
                child: Image(image: NetworkImage(gameSelec!.image)),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              Text(
                "Titulo: ${gameSelec!.title}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                width: 350,
                child: Text(
                  "Descrição: ${gameSelec!.description}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Text(
                "Data de Lançamento:${gameSelec!.release}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const Text(
                "Categorias:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: gameSelec!.categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          gameSelec!.categories[index],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        )
                      ],
                    );
                  }),
              const Padding(padding: EdgeInsets.all(6)),
              const Text(
                "Plataformas:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: gameSelec!.plataforms.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          gameSelec!.plataforms[index],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        )
                      ],
                    );
                  })
            ]
          ],
        )
            )),
      ),
    );
  }
}
