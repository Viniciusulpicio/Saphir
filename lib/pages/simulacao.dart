import 'package:flutter/material.dart';
import 'package:saphir/components/barra_pesquisa.dart';
import 'package:saphir/components/nav_bar.dart';
import 'package:saphir/shared/style.dart';

class Simulacao extends StatefulWidget {
  const Simulacao({super.key});

  @override
  State<Simulacao> createState() => _SimulacaoState();
}

class _SimulacaoState extends State<Simulacao> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

        final List<Map<String, dynamic>> principais = [
    {'image': 'assets/image/simulacao/euroTruck.png', 'route': '/'},
    {'image': 'assets/image/simulacao/theSims3.png', 'route': ''},
    {'image': 'assets/image/simulacao/theSims2.png', 'route': ''},
  ];

        final List<Map<String, dynamic>> breve = [
    {'image': 'assets/image/simulacao/inzoi.png', 'route': ''},
    {'image': 'assets/image/simulacao/assettoCorsa.png', 'route': ''},
    {'image': 'assets/image/simulacao/civilization.png', 'route': ''},
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
              automaticallyImplyLeading: false, // Remove a seta de voltar no AppBar
              title: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0,),
                child: Row(
                  children: [
                    const Expanded(
                      child: BarraPesquisaWidget(),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 5.0,),),

                    
                    GestureDetector(
                      child: Image.asset("assets/image/home/raio.png",
                    height: 35,),
                    onTap: () => Navigator.pushNamed(context, '/plano'),
                    )
                  ],
                ),
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
                  child: Image.asset('assets/image/simulacao/theSims4.png', scale: 0.95,), // Imagem do top 1
                  onTap: () {
                    Navigator.pushNamed(context, '/theSims4'); // Navega para a rota
                  },
                ),
                const SizedBox(height: 20), // Espaço entre a imagem e o texto

                Container(
                  margin: const EdgeInsets.only(left: 45.0,), // Alinhado com o grid
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
                                  Navigator.pushNamed(context, item['route']);
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
                                  Navigator.pushNamed(context, item['route']);
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
