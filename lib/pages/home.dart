import 'package:flutter/material.dart';
import 'package:saphir/components/barra_pesquisa.dart';
import 'package:saphir/shared/style.dart';
import 'package:saphir/components/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'image': 'assets/image/home/acao.png', 'route': '/acao'},
    {'image': 'assets/image/home/casual.png', 'route': '/casual'},
    {'image': 'assets/image/home/rpg.png', 'route': '/rpg'},
    {'image': 'assets/image/home/terror.png', 'route': '/terror'},
    {'image': 'assets/image/home/simulacao.png', 'route': '/simulacao'},
    {'image': 'assets/image/home/luta.png', 'route': '/luta'},
  ];

  final List<Map<String, dynamic>> imgList = [
    {'image': 'assets/image/home/lego star wars 2.png', 'route': '/gameScreen', 'arguments': 1, },
    {'image': 'assets/image/home/life_is_strangw.png', 'route': '/gameScreen', 'arguments': 4, },
    {'image': 'assets/image/home/red dead.png', 'route': '/gameScreen', 'arguments': 7, },
    {'image': 'assets/image/home/eldenRing.png', 'route': '/gameScreen', 'arguments': 16, },
  ];

    final List<Map<String, dynamic>> amigosList = [
    {'image': 'assets/image/home/mineirinhoUltra.png', 'route': '/gameScreen', 'arguments': 13},
    {'image': 'assets/image/home/goat.png', 'route': ''},
    {'image': 'assets/image/home/lizardsMust.png', 'route': ''},
    {'image': 'assets/image/home/ark.png', 'route': ''},
  ];

    final List<Map<String, dynamic>> novidadeList = [
    {'image': 'assets/image/home/aeternum.png', 'route': ''},
    {'image': 'assets/image/home/lostark.png', 'route': ''},
    {'image': 'assets/image/home/lensProtoco.png', 'route': ''},
    {'image': 'assets/image/home/eteanalFrost.png', 'route': ''},
  ];

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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Image.asset("assets/image/home/Stardew Valley 2.png", ),
                    onTap: () {
                                  Navigator.pushNamed(context, '/gameScreen', arguments: 3); // Passando o ID do jogo
                                },
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.only(left: 45.0), // Alinhado com o grid
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "NAVEGUE POR CATEGORIA:",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DaysOne",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Grid das categorias
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0), // Melhor espaçamento nas bordas
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3.0, // Diminuído para aumentar as imagens
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            // Navegar para a página específica da categoria
                            Navigator.pushNamed(context, category['route']);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              category['image'],
                              fit: BoxFit.contain, // Não estica a imagem além do tamanho original
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 45.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "MAIS JOGADOS:",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DaysOne",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0), // Espaço abaixo do carrossel
                    child: Container(
                      height: 160.0, // Altura do carrossel
                      margin: const EdgeInsets.symmetric(horizontal: 25.0), // Espaçamento nas bordas do carrossel
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: imgList.map((item) {
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
                    margin: const EdgeInsets.only(left: 45.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "MAIS JOGADOS PELOS AMIGOS:",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DaysOne",
                        fontSize: 18,
                      ),
                    ),
                  ),

                                    Padding(
                    padding: const EdgeInsets.only(bottom: 10.0), // Espaço abaixo do carrossel
                    child: Container(
                      height: 175.0, // Altura do carrossel
                      margin: const EdgeInsets.symmetric(horizontal: 25.0), // Espaçamento nas bordas do carrossel
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: amigosList.map((item) {
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
                    margin: const EdgeInsets.only(left: 45.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "NOVIDADES:",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DaysOne",
                        fontSize: 18,
                      ),
                    ),
                  ),

                                    Padding(
                    padding: const EdgeInsets.only(bottom: 10.0), // Espaço abaixo do carrossel
                    child: Container(
                      height: 175.0, // Altura do carrossel
                      margin: const EdgeInsets.symmetric(horizontal: 25.0), // Espaçamento nas bordas do carrossel
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: novidadeList.map((item) {
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
