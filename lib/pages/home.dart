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
    {'image': 'assets/image/home/acao.png', 'route': '/acaoPage'},
    {'image': 'assets/image/home/casual.png', 'route': '/casualPage'},
    {'image': 'assets/image/home/rpg.png', 'route': '/rpgPage'},
    {'image': 'assets/image/home/terror.png', 'route': '/terrorPage'},
    {'image': 'assets/image/home/simulacao.png', 'route': '/simulacaoPage'},
    {'image': 'assets/image/home/luta.png', 'route': '/lutaPage'},
  ];

      final List<Map<String, dynamic>> imgList = [
    {'image': 'assets/image/home/lego star wars 2.png', 'route': '/starWars'},
    {'image': 'assets/image/home/life_is_strangw.png', 'route': '/lifeIs'},
    {'image': 'assets/image/home/red dead.png', 'route': '/redDead'},
    {'image': 'assets/image/home/eldenRing.png', 'route': '/eldenRing'},

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
                  child: Image.asset("assets/image/home/Stardew Valley 2.png"),
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/stardewValley'),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.only(left: 45.0), // Alinhado com o grid
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "NAVEGUE POR CATEGORIA:",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "DaysOne", fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                // Grid das categorias
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0), // Melhor espaçamento nas bordas
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.1, // Espaçamento entre as linhas
                      crossAxisSpacing: 10, // Espaçamento entre as colunas
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


                Container( 
                  margin: const EdgeInsets.only(left: 45.0),  
                  alignment: Alignment.centerLeft, 
                  child: const Text( "MAIS JOGADOS:", 
                  style: TextStyle( 
                    color: Colors .white, 
                    fontFamily: "DaysOne", 
                    fontSize: 18
                    ), 
                    ), ), 
  
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0), // Espaço abaixo do carrossel
                      child: Container(
                        height: 175.0, // Altura do carrossel
                        margin: const EdgeInsets.symmetric(horizontal: 25.0), // Espaçamento nas bordas do carrossel
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: imgList.map((item) {
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