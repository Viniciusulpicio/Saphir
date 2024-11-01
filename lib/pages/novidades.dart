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
    return  Stack(
        children: [
                  Container(
          color: const Color.fromARGB(255, 0, 8, 2), // Fundo preto por trás do gradiente
        ),
        GradientBackground(child: 
        Scaffold(
            backgroundColor: Colors.transparent, // Torna o fundo transparente para o gradiente aparecer

            appBar: AppBar(
              automaticallyImplyLeading: false, // Remove a seta de voltar no AppBar
                          title: const Padding(
              padding: EdgeInsets.only(top: 20.0), // Ajuste o valor de top conforme necessário
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
                    
                    const SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0,),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 3, 4, 105), // Cor de fundo
                              borderRadius: BorderRadius.circular(20), // Borda arredondada
                            ),
                            child: Row(
                              children: [
                                // Coluna com os textos
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Life is Strange",
                                        style: TextStyle(
                                          color: Colors.white70, // Texto secundário
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Life is Strange: Double Exposure é Lançado no Brasil.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Hoje - 08:12",
                                        style: TextStyle(
                                          color: Colors.lightBlueAccent, // Cor para a data/hora
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16), // Espaçamento entre o texto e a imagem
                                // Imagem
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // Borda arredondada da imagem
                                  child: Image.asset(
                                    'assets/image/novidades/lifeIs.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                    const SizedBox(height: 30,),

                    
                   Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 3, 4, 105), // Cor de fundo
                              borderRadius: BorderRadius.circular(20), // Borda arredondada
                            ),
                            child: Row(
                              children: [
                                // Coluna com os textos
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Sims™ 4",
                                        style: TextStyle(
                                          color: Colors.white70, // Texto secundário
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Chegou o The Sims™ 4 Pacote de ExpansãoPé na Cova.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "há 17 horas",
                                        style: TextStyle(
                                          color: Colors.lightBlueAccent, // Cor para a data/hora
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16), // Espaçamento entre o texto e a imagem
                                // Imagem
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // Borda arredondada da imagem
                                  child: Image.asset(
                                    'assets/image/novidades/theSims.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                    const SizedBox(height: 30,),

                    
                   Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 3, 4, 105), // Cor de fundo
                              borderRadius: BorderRadius.circular(20), // Borda arredondada
                            ),
                            child: Row(
                              children: [
                                // Coluna com os textos
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Minecraft",
                                        style: TextStyle(
                                          color: Colors.white70, // Texto secundário
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Nova Snapshot de Minecraft é divulgada.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "há 23 horas",
                                        style: TextStyle(
                                          color: Colors.lightBlueAccent, // Cor para a data/hora
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16), // Espaçamento entre o texto e a imagem
                                // Imagem
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // Borda arredondada da imagem
                                  child: Image.asset(
                                    'assets/image/novidades/minecraftCapa.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                    


                    const SizedBox(height: 30,),

                    
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 4, 105), // Cor de fundo
                          borderRadius: BorderRadius.circular(20), // Borda arredondada
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Borda arredondada da imagem
                              child: Image.asset(
                                'assets/image/novidades/minecraft.png',
                                width: double.infinity, // Largura ocupando todo o espaço disponível
                                fit: BoxFit.cover, // Para manter a proporção da imagem
                              ),
                            ),
                            const SizedBox(height: 16), // Espaçamento entre a imagem e os textos
                            const Text(
                              "Minecraft",
                              style: TextStyle(
                                color: Colors.white70, // Texto secundário
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Nova Snapshot de Minecraft é divulgada.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "há 23 horas",
                              style: TextStyle(
                                color: Colors.lightBlueAccent, // Cor para a data/hora
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    const SizedBox(height: 30,),

                    
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 4, 105), // Cor de fundo
                          borderRadius: BorderRadius.circular(20), // Borda arredondada
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Borda arredondada da imagem
                              child: Image.asset(
                                'assets/image/novidades/cultLamb.png',
                                width: double.infinity, // Largura ocupando todo o espaço disponível
                                fit: BoxFit.cover, // Para manter a proporção da imagem
                              ),
                            ),
                            const SizedBox(height: 16), // Espaçamento entre a imagem e os textos
                            const Text(
                              "Cut of the Lamb",
                              style: TextStyle(
                                color: Colors.white70, // Texto secundário
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Nova Edição de Cut of the Lamb está Disponível para Pré-Venda.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "26 de Setembro",
                              style: TextStyle(
                                color: Colors.lightBlueAccent, // Cor para a data/hora
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),




                    const SizedBox(height: 30,),

                    
                   Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 3, 4, 105), // Cor de fundo
                              borderRadius: BorderRadius.circular(20), // Borda arredondada
                            ),
                            child: Row(
                              children: [
                                // Coluna com os textos
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Stardew Valley",
                                        style: TextStyle(
                                          color: Colors.white70, // Texto secundário
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Nova Atualização de Stardew Valley 1.6.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "19 de Março",
                                        style: TextStyle(
                                          color: Colors.lightBlueAccent, // Cor para a data/hora
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16), // Espaçamento entre o texto e a imagem
                                // Imagem
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // Borda arredondada da imagem
                                  child: Image.asset(
                                    'assets/image/novidades/stardewValley.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                                      const SizedBox(height: 40,),

                  ],
                ),
              ),
            ),
            bottomNavigationBar: navBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
        ))
        ],
    );
  }
}