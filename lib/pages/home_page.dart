import 'package:flutter/material.dart';
import 'package:games_list/pages/game_page.dart';
import 'package:games_list/request/api_game_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    loadGames();
  }

  final gamesRequest = GamesRequest();
  int counter = 1;

  Future<void> loadGames() async{
    await gamesRequest.request();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.black),
      appBar: AppBar(
        title: const Text('Melhores Jogos', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: ListenableBuilder(listenable: gamesRequest, 
        builder: (context, _){
          if(gamesRequest.games != null && gamesRequest.games!.isNotEmpty && gamesRequest.categories != null){
            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics:const BouncingScrollPhysics(),
                  itemCount: gamesRequest.games!.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        Container(
                          width: 300,
                          child: Image(image: NetworkImage(gamesRequest.games![index].image)),
                        ),

                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => GamePage())));
                          gameSelec = gamesRequest.games![index];
                        }, child: Text("Mais info")),
                      ],
                    );
                  })
              ],
            );
          }else{
            return Text("Carregando");
          }
        }),
      ),
    );
  }
}