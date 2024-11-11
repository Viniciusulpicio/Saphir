import 'package:flutter/material.dart';
import 'package:saphir/components/barra_pesquisa.dart';
import 'package:saphir/components/nav_bar.dart';
import 'package:saphir/shared/style.dart';

class Luta extends StatefulWidget {
  const Luta({super.key});

  @override
  State<Luta> createState() => _LutaState();
}

class _LutaState extends State<Luta> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

        final List<Map<String, dynamic>> principais = [
    {'image': 'assets/image/luta/finalFantasy.png', 'route': ''},
    {'image': 'assets/image/luta/devilMay.png', 'route': ''},
    {'image': 'assets/image/luta/streetFighter.png', 'route': ''},
  ];

        final List<Map<String, dynamic>> breve = [
    {'image': 'assets/image/luta/bleach.png', 'route': ''},
    {'image': 'assets/image/luta/dynastyWarriors.png', 'route': ''},
    {'image': 'assets/image/luta/turtles.png', 'route': ''},
  ];

  @override
  Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      
            children: [
        const SizedBox(height: 16),
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
                    const Expanded(child: BarraPesquisaWidget()),
                    SizedBox(width: screenWidth * 0.01),
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

            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    child: Image.asset(
                      'assets/image/luta/mortalKombat.png',
                      width: screenWidth * 0.9, // Ocupa até metade da largura da tela
                      height: screenHeight * 0.45, // Limita a altura da imagem para não ocupar muito espaço
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/bloondTD');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.1),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'PRINCIPAIS TÍTULOS: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DaysOne",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: principais.map((item) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, item['route']);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
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
                    margin: EdgeInsets.only(left: screenWidth * 0.1),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'EM BREVE: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DaysOne",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: breve.map((item) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context, item['route'], (route) => false);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
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
