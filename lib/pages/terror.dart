import 'package:flutter/material.dart';
import 'package:saphir/components/barra_pesquisa.dart';
import 'package:saphir/components/nav_bar.dart';
import 'package:saphir/shared/style.dart';

class Terror extends StatefulWidget {
  const Terror({super.key});

  @override
  State<Terror> createState() => _TerrorState();
}

class _TerrorState extends State<Terror> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

        final List<Map<String, dynamic>> principais = [
    {'image': 'assets/image/terror/silentHill.png', 'route': '/silentHill'},
    {'image': 'assets/image/terror/residentEvil.png', 'route': '/'},
    {'image': 'assets/image/terror/layersFear.png', 'route': '/'},
  ];

        final List<Map<String, dynamic>> breve = [
    {'image': 'assets/image/terror/beautifulLight.png', 'route': '/'},
    {'image': 'assets/image/terror/midnightWalk.png', 'route': '/'},
    {'image': 'assets/image/terror/pathologic.png', 'route': '/'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
          const SizedBox(height: 16), // Espaço entre a imagem e o texto

        Container(
          color: const Color.fromARGB(255, 0, 8, 20), // Fundo preto por trás do gradiente
        ),
        GradientBackground(
          child: Scaffold(       
            backgroundColor: Colors.transparent, // Torna o fundo transparente para o gradiente aparecer
            appBar: AppBar(
              title: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: const BarraPesquisaWidget(),
                    ),
                  ),

                ],
              ),
              backgroundColor: Colors.transparent, // Faz o AppBar ser transparente
              elevation: 0,
              toolbarHeight: 80, // Ajusta a altura do AppBar
              centerTitle: true,
            ),
            body: Column(
              children: [
                                const SizedBox(height: 10),

                GestureDetector(
                  child: Image.asset('assets/image/terror/outlast.png', scale: 0.95,), // Imagem do top 1
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/outlast'); // Navega para a rota
                  },
                ),
                const SizedBox(height: 20), // Espaço entre a imagem e o texto

                Container(
                  margin: const EdgeInsets.only(left: 45.0), // Alinhado com o grid
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'PRINCIPAIS TÍTULOS: ',                     
                    style: TextStyle(
                        color: Colors.white, fontFamily: "DaysOne", fontSize: 18),)),

                // const SizedBox(height: 10), // Espaço entre os textos
                const SizedBox(height: 15), // Espaço entre a imagem e o texto

                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0), // Espaço abaixo do carrossel
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0), // Espaçamento nas bordas do carrossel
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: principais.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  // Navega para a rota especificada ao tocar na imagem
                                  Navigator.pushReplacementNamed(context, item['route']);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0), // Espaçamento entre imagens
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item['image'], // Usa o caminho da imagem
                                      fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o espaço disponível
                                      width: 200, // Largura fixa para as imagens
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),


                                Container(
                  margin: const EdgeInsets.only(left: 45.0), // Alinhado com o grid
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'EM BREVE: ',                     
                    style: TextStyle(
                        color: Colors.white, fontFamily: "DaysOne", fontSize: 18),)),

                // const SizedBox(height: 8), // Espaço entre os textos
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0), // Espaço abaixo do carrossel
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0), // Espaçamento nas bordas do carrossel
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: breve.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  // Navega para a rota especificada ao tocar na imagem
                                  Navigator.pushReplacementNamed(context, item['route']);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0), // Espaçamento entre imagens
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item['image'], // Usa o caminho da imagem
                                      fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o espaço disponível
                                      width: 200, // Largura fixa para as imagens
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

              ],
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
