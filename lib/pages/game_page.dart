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
        title:const Text("Game Infos"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
                Column(
                      children: [
                        if(gameSelec != null)...[
                        SizedBox(
                          width: 350,
                          child: Image(image: NetworkImage(gameSelec!.image)),
                        ),
                        Text("Titulo: ${gameSelec!.title}", style: TextStyle(fontSize: 18),),
                        Text("Descrição: ${gameSelec!.description}", style: TextStyle(fontSize: 18),),
                        const Text("Categorias:", style: TextStyle(fontSize: 18),),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: gameSelec!.categories.length,
                          itemBuilder: (context, index){
                           return Column(
                            children: [
                              Text(gameSelec!.categories[index], style: TextStyle(fontSize: 18),)
                            ],
                           );
                        })
                        ]
                      ],
                    )
              ],
            ),
        ),
      ),
    );
  }
}