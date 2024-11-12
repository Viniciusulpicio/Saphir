import 'package:flutter/material.dart';
import 'package:saphir/components/nav_bar.dart';
import 'package:saphir/shared/style.dart';

class Novidades extends StatefulWidget {
  const Novidades({super.key});

  @override
  State<Novidades> createState() => _NovidadesState();
}

class _NovidadesState extends State<Novidades> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 60.0 : 20.0; // Ajuste de padding para telas maiores

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 8, 2), // Fundo preto por trás do gradiente
        ),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent, // Fundo transparente para o gradiente aparecer
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Novidades",
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
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildNewsContainer(
                              "Life is Strange",
                              "Life is Strange: Double Exposure é Lançado no Brasil.",
                              "Hoje - 08:12",
                              'assets/image/novidades/lifeIs.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildNewsContainer(
                              "The Sims™ 4",
                              "Chegou o The Sims™ 4 Pacote de Expansão Pé na Cova.",
                              "há 17 horas",
                              'assets/image/novidades/theSims.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildNewsContainer(
                              "Minecraft",
                              "Nova Snapshot de Minecraft é divulgada.",
                              "há 23 horas",
                              'assets/image/novidades/minecraftCapa.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: buildLargeNewsContainer(
                        "Minecraft",
                        "Nova Snapshot de Minecraft é divulgada.",
                        "há 23 horas",
                        'assets/image/novidades/minecraft.png',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: buildLargeNewsContainer(
                        "Cut of the Lamb",
                        "Nova Edição de Cut of the Lamb está Disponível para Pré-Venda.",
                        "26 de Setembro",
                        'assets/image/novidades/cultLamb.png',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildNewsContainer(
                              "Stardew Valley",
                              "Nova Atualização de Stardew Valley 1.6.",
                              "19 de Março",
                              'assets/image/novidades/stardewValley.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
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

  Widget buildNewsContainer(String title, String subtitle, String date, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(130, 3, 4, 105),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLargeNewsContainer(String title, String subtitle, String date, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(130, 3, 4, 105),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
