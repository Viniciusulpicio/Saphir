import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';
import 'package:saphir/components/nav_bar.dart';

class Conta extends StatefulWidget {
  const Conta({super.key});

  @override
  State<Conta> createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <
        600; // Verifica se a tela é menor que 600px (geralmente dispositivos móveis)

    // Definindo o tamanho da fonte e espaçamentos com base na largura da tela
    double fontSize = isMobile ? 18 : 22; // Menor fonte para telas pequenas
    double paddingHorizontal =
        isMobile ? 20 : 50; // Mais padding em telas maiores
    double buttonPaddingHorizontal =
        isMobile ? 25 : 35; // Ajuste no padding dos botões
    double buttonPaddingVertical =
        isMobile ? 12 : 15; // Ajuste no padding vertical

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(
              255, 0, 8, 20), // Fundo preto por trás do gradiente
        ),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,

            // AppBar
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Conta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          fontSize, // Usando a variável de tamanho de fonte
                      fontFamily: 'DaysOne',
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 80,
            ),

            // Body
            body: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorizontal), // Ajuste no padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/selecioneConta');
                      },
                      child: SizedBox(
                        child: Image.asset(
                            'assets/image/conta/acessar_contas.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 17),
                        Row(
                          children: [
                            Image.asset('assets/image/conta/usuario_conta.png'),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'caanelinha',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isMobile
                                            ? 20
                                            : 24, // Ajuste do tamanho da fonte
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/plano');
                                        },
                                        child: Image.asset(
                                            'assets/image/conta/raio_conta.png')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'givas',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isMobile
                                            ? 16
                                            : 19, // Ajuste do tamanho da fonte
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    Image.asset(
                                        'assets/image/conta/brasil.png'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'cozy gamer violento',
                                style: TextStyle(color: Colors.white),
                              ),
                              const Text(
                                '18y',
                                style: TextStyle(color: Colors.white),
                              ),
                              Image.asset('assets/image/conta/nerd.png'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: isMobile
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/editarPerfil');
                                buttonEnterClick();
                              },
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: buttonPaddingHorizontal,
                                    vertical: buttonPaddingVertical),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor:
                                    const Color.fromARGB(255, 1, 7, 45),
                              ),
                              child: const Text(
                                "Editar Perfil",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                buttonEnterClick();
                                Navigator.pushNamed(context, '/amigos');
                              },
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: buttonPaddingHorizontal,
                                    vertical: buttonPaddingVertical),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor:
                                    const Color.fromARGB(255, 1, 7, 45),
                              ),
                              child: const Text(
                                "Amigos",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Amizades:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  '23 amigos',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Jogos Salvos:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  '5 jogos',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Assinatura:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  'Spark Único',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Column(
                            children: [
                              const Text(
                                'Jogado Recentemente',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(13.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 1, 7, 45),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/gameScreen',
                                              arguments:
                                                  3); // Passando o ID do jogo
                                        },
                                        child: Image.asset(
                                            'assets/image/conta/stardew_jogados.png')),
                                    const SizedBox(width: 32),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Última sessão',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '22 de Abril',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          'Tempo jogado',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '584,9 horas',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Jogado Recentemente',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(13.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 1, 7, 45),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/gameScreen',
                                                arguments:
                                                    6); // Passando o ID do jogo
                                          },
                                          child: Image.asset(
                                              'assets/image/conta/sims_favorito.png'),
                                        ),
                                        const SizedBox(width: 29),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/gameScreen',
                                                arguments:
                                                    4); // Passando o ID do jogo
                                          },
                                          child: Image.asset(
                                              'assets/image/conta/lis_favorito.png'),
                                        ),
                                        const SizedBox(width: 29),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/gameScreen',
                                                arguments:
                                                    3); // Passando o ID do jogo
                                          },
                                          child: Image.asset(
                                              'assets/image/conta/stardew_favorito.png'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // NavBar
            bottomNavigationBar: navBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ],
    );
  }

  void buttonEnterClick() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, '/home');
    } else {
      print("Erro no formulário");
    }
  }
}
