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
    {'image': 'assets/image/terror/silentHill.png',  'route': '/gameScreen', 'arguments': 12,},
    {'image': 'assets/image/terror/residentEvil.png', 'route': ''},
    {'image': 'assets/image/terror/layersFear.png', 'route': ''},
  ];

        final List<Map<String, dynamic>> breve = [
    {'image': 'assets/image/terror/beautifulLight.png', 'route': ''},
    {'image': 'assets/image/terror/midnightWalk.png', 'route': ''},
    {'image': 'assets/image/terror/pathologic.png', 'route': ''},
  ];

 @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                        height: screenHeight * 0.05,
                      ),
                      onTap: () => Navigator.pushNamed(context, '/plano'),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: screenHeight * 0.1,
              centerTitle: true,
            ),
            body: SingleChildScrollView( // Adiciona rolagem
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),

                  GestureDetector(
                                      child: Image.asset('assets/image/terror/outlast.png', scale: 0.95),

                    onTap: () {
                      Navigator.pushNamed(context, '/gameScreen', arguments: 17);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.12),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'PRINCIPAIS TÍTULOS: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DaysOne",
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: principais.map((item) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, item['route']);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.03),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                    width: screenWidth * 0.5,
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
                    margin: EdgeInsets.only(left: screenWidth * 0.12),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'EM BREVE: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DaysOne",
                          fontSize: 18),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: breve.map((item) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, item['route']);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.03),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                    width: screenWidth * 0.5,
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
