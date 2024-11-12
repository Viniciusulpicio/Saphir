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
    {'image': 'assets/image/home/lego star wars 2.png', 'route': '/gameScreen', 'arguments': 1},
    {'image': 'assets/image/home/life_is_strangw.png', 'route': '/gameScreen', 'arguments': 4},
    {'image': 'assets/image/home/red dead.png', 'route': '/gameScreen', 'arguments': 7},
    {'image': 'assets/image/home/eldenRing.png', 'route': '/gameScreen', 'arguments': 16},
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  children: [
                    const Expanded(
                      child: BarraPesquisaWidget(),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/image/home/raio.png",
                        height: screenHeight * 0.04,
                      ),
                      onTap: () => Navigator.pushNamed(context, '/plano'),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: screenHeight * 0.1,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    child: Image.asset("assets/image/home/Stardew Valley 2.png"),
                    onTap: () {
                      Navigator.pushNamed(context, '/gameScreen', arguments: 3);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.1),
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
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
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
                  SizedBox(height: screenHeight * 0.03),
                  _buildSectionTitle("MAIS JOGADOS:", screenWidth),
                  _buildHorizontalCarousel(imgList, screenWidth, screenHeight, context),
                  _buildSectionTitle("MAIS JOGADOS PELOS AMIGOS:", screenWidth),
                  _buildHorizontalCarousel(amigosList, screenWidth, screenHeight, context),
                  _buildSectionTitle("NOVIDADES:", screenWidth),
                  _buildHorizontalCarousel(novidadeList, screenWidth, screenHeight, context),
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

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.1),
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

  Widget _buildHorizontalCarousel(List<Map<String, dynamic>> itemList, double screenWidth, double screenHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: Container(
        height: screenHeight * 0.2,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: itemList.map((item) {
              return GestureDetector(
                onTap: () {
                  if (item['route'].isNotEmpty) {
                    Navigator.pushNamed(context, item['route'], arguments: item['arguments']);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item['image'],
                      fit: BoxFit.cover,
                      width: screenWidth * 0.45,
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
