import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';
import 'package:saphir/components/nav_bar.dart';

class LifeIsStrange extends StatefulWidget {
  const LifeIsStrange({super.key});

  @override
  State<LifeIsStrange> createState() => _LifeIsStrangeState();
}

class _LifeIsStrangeState extends State<LifeIsStrange> {
  int _selectedIndex = 0;

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

              title: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 40), // Adiciona margem apenas acima do título
                  child: Center(
                    child: const Text(
                      "Life is Strange: Remastered Collection",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'DaysOne',
                      ),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent, // Faz o AppBar também ser transparente
              elevation: 0,
              toolbarHeight: 80, // Ajusta a altura do AppBar
            ),
            body: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ajusta a altura da coluna de acordo com o conteúdo
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/image/jogos/lifeStrange.png',
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Título e informações do jogo
                    const Row(
                      children: [
                        Text(
                          'Life is Strange: Re...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DaysOne',
                          ),
                          ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '8,5/10',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          
                        
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Data de Lançamento: ', // Parte que ficará em negrito
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Negrito
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: '30/Set/2015', // Parte que ficará normal
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                        Row(

                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,

                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Distribuidora: ', // Parte que ficará em negrito
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Negrito
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: 'Square Enix', // Parte que ficará normal
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                        const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sinopse: ', // Parte que ficará em negrito
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Negrito
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: 'Acompanhe Max Caulfield, uma jovem estudante de fotografia, que descobre a habilidade de voltar no tempo e deve usá-la para evitar uma tragédia iminente, enquanto enfrenta dilemas emocionais e escolhas difíceis.', // Parte que ficará normal
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 20),
                    // Botões
                    Column(
                      children: [
                        // Botão verde "JOGAR"
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 41, 144, 43), // Cor de fundo verde
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), // Bordas arredondadas
                              side: const BorderSide(color: Color.fromARGB(255, 51, 84, 60), width: 6), // Borda branca
                              
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15), // Tamanho do botão
                          ),
                          child: const Text(
                            'JOGAR',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Cor do texto branco
                              fontFamily: 'DaynsOne'
                            ),
                          ),
                        ),
                        const SizedBox(height: 10), // Espaço entre os botões

                        // Botão branco com borda "Adicionar aos Salvos"
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white, width: 5), // Borda branca
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), // Bordas arredondadas
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Tamanho do botão
                          ),
                          child: const Text(
                            'Adicionar aos Salvos',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Cor do texto branco
                            ),
                          ),
                        ),
                      ],
                    )
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
}
