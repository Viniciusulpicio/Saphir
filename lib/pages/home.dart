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
    {'image': 'assets/image/home/lego star wars 2.png', 'route': '/starWars'},
    {'image': 'assets/image/home/life_is_strangw.png', 'route': '/lifeIs'},
    {'image': 'assets/image/home/red dead.png', 'route': '/redDead'},
    {'image': 'assets/image/home/eldenRing.png', 'route': '/eldenRing'},
  ];

  final List<Map<String, dynamic>> amigosList = [
    {'image': 'assets/image/home/mineirinhoUltra.png', 'route': ''},
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600; // Verifica se é uma tela maior

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 8, 20), // Fundo preto por trás do gradiente
        ),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: BarraPesquisaWidget(),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      child: Image.asset("assets/image/home/raio.png", height: 35),
                      onTap: () => Navigator.pushNamed(context, '/plano'),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: isTablet ? 100 : 80, // Altura do AppBar para telas maiores
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Image.asset(
                      "assets/image/home/Stardew Valley 2.png",
                      width: isTablet ? screenWidth * 0.7 : screenWidth * 0.9, // Ajusta a largura
                    ),
                    onTap: () => Navigator.pushNamed(context, '/stardewValley'),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(left: isTablet ? 60.0 : 45.0),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isTablet ? 60.0 : 40.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2, // Mais colunas para telas maiores
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3.0,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, category['route']);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              category['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle("MAIS JOGADOS:", isTablet),
                  _buildHorizontalCarousel(imgList, isTablet),
                  _buildSectionTitle("MAIS JOGADOS PELOS AMIGOS:", isTablet),
                  _buildHorizontalCarousel(amigosList, isTablet),
                  _buildSectionTitle("NOVIDADES:", isTablet),
                  _buildHorizontalCarousel(novidadeList, isTablet),
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

  Widget _buildSectionTitle(String title, bool isTablet) {
    return Container(
      margin: EdgeInsets.only(left: isTablet ? 60.0 : 45.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "DaysOne",
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildHorizontalCarousel(List<Map<String, dynamic>> itemList, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 175.0,
        margin: EdgeInsets.symmetric(horizontal: isTablet ? 35.0 : 25.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: itemList.map((item) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, item['route']);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item['image'],
                      fit: BoxFit.cover,
                      width: isTablet ? 250 : 200, // Ajusta a largura para telas maiores
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
