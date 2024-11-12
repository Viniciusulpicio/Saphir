import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saphir/shared/style.dart';
import 'package:saphir/components/nav_bar.dart';

class GameScreen extends StatefulWidget {
  final int gameId; // ID do jogo para buscar os dados

  const GameScreen({Key? key, required this.gameId}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _selectedIndex = 0;
  Map<String, dynamic>? gameData;
  String buttonText = "Carregando...";
  String route = "/defaultRoute";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> loadGameData() async {
    final String response = await rootBundle.loadString('assets/data/games.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      gameData = data.firstWhere((game) => game['id'] == widget.gameId);
      loadButtonData();
    });
  }

  void loadButtonData() {
    // Obtendo os dados do JSON do jogo carregado
    if (gameData != null) {
      setState(() {
        buttonText = gameData!['button_text'] ?? "JOGAR";
        route = gameData!['route'] ?? "/defaultRoute";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadGameData();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (gameData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 8, 20),
        ),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                child: Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.05),
                  child: Flexible(
                    child: Text(
                      gameData!['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22 * textScaleFactor,
                        fontFamily: 'DaysOne',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: screenHeight * 0.1,
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(gameData!['image']),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              gameData!['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18 * textScaleFactor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'DaysOne',
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            gameData!['rating'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16 * textScaleFactor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Data de Lançamento: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16 * textScaleFactor,
                                  ),
                                ),
                                TextSpan(
                                  text: gameData!['releaseDate'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16 * textScaleFactor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Distribuidora: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16 * textScaleFactor,
                                ),
                              ),
                              TextSpan(
                                text: gameData!['publisher'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16 * textScaleFactor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sinopse: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16 * textScaleFactor,
                              ),
                            ),
                            TextSpan(
                              text: gameData!['synopsis'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16 * textScaleFactor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // Botões
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, route);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 41, 144, 43),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: Color.fromARGB(255, 51, 84, 60), width: 6),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.1,
                                vertical: screenHeight * 0.02,
                              ),
                            ),
                            child: Text(
                              buttonText,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'DaynsOne',
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white, width: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.1,
                                vertical: screenHeight * 0.02,
                              ),
                            ),
                            child: Text(
                              'Adicionar aos Salvos',
                              style: TextStyle(
                                fontSize: 16 * textScaleFactor,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: navBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ],
    );
  }
}
