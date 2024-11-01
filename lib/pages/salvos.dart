import 'package:flutter/material.dart';
import 'package:saphir/components/barra_pesquisa.dart';
import 'package:saphir/components/nav_bar.dart';
import 'package:saphir/shared/style.dart';

class Salvos extends StatefulWidget {
  const Salvos({super.key});

  @override
  State<Salvos> createState() => _SalvosState();
}

class _SalvosState extends State<Salvos> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 8, 2), // Fundo preto por trás do gradiente
        ),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent, // Torna o fundo transparente para o gradiente aparecer

          appBar: AppBar(
                            automaticallyImplyLeading: false, // Remove a seta de voltar no AppBar

            title: const Padding(
              padding: EdgeInsets.only(top: 20.0), // Ajuste o valor de top conforme necessário
              child: Text(
                "Salvos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'DaysOne',
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 80,
            centerTitle: true,
          ),

            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0), // Define margem de 45 à direita e à esquerda
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                
                    const BarraPesquisaWidget(),
                
                    const SizedBox(height: 45), // Espaço entre a imagem e o texto
              
                    GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/bloondTD');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/bloonsTD.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bloons TD 6",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'há 13 dias', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '25,8 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                    SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/lifeIs');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/lifeStrange.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Life is Strange",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '23 de Julho', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '10,3 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                        SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/stardewValley');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/stardewValley.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stardew Valley",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '22 de Abril', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '584,9 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                    SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/elderScrolls');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/elderScrolls.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Elder Scroll...",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '15 de Junho', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '34,7 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                                      SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/theSims4');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/theSims4.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Sims 4",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'há 2 dias', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '2149,3 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                                                        SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/CS.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Counter Strike",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '9 de Agosto', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '227 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                                                        SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/leagueOFLegends.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "League of Legends",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '7 de Agosto', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '374 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                                                        SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/theForest.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Forest",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '24 de Abril', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '7 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                                                        SizedBox(height: 30),
              
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, '/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centraliza todo o conteúdo no Row
                        crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente ao centro
                        children: [
                          Image.asset(
                            "assets/image/salvos/theWitcher.png",
                          ),
                          const SizedBox(width: 10), // Espaço entre a imagem e o texto
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Witcher",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "DaysOne"
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Última sessão: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '2 de Janeiro', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tempo jogado: ', // Parte que ficará em negrito
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Negrito
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '13,7 horas', // Parte que ficará normal
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                                                                            SizedBox(height: 35),

              
                    
              
                  ],
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
