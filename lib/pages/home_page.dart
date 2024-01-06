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
  void initState() {
    super.initState();
    loadGames();
  }

  final gamesRequest = GamesRequest();
  int counter = 1;

  Future<void> loadGames() async {
    await gamesRequest.request();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.indigo[700]),
      appBar: AppBar(
        title: const Text(
          'Melhores Jogos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SingleChildScrollView(
        child: ListenableBuilder(
            listenable: gamesRequest,
            builder: (context, _) {
              if (gamesRequest.games != null &&
                  gamesRequest.games!.isNotEmpty &&
                  gamesRequest.categories != null) {
                return Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: gamesRequest.games!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const Padding(padding: EdgeInsets.all(16)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo[700],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const GamePage())));
                                  gameSelec = gamesRequest.games![index];
                                },
                                child: SizedBox(
                                  width: 350,
                                  child: Image(
                                    image: NetworkImage(
                                      gamesRequest.games![index].image,
                                    ),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        })
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
