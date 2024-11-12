import 'package:flutter/material.dart';
import 'package:saphir/components/nav_bar.dart';
import 'package:saphir/shared/style.dart';

class Plano extends StatefulWidget {
  const Plano({super.key});

  @override
  State<Plano> createState() => _PlanoState();
}

class _PlanoState extends State<Plano> {
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
                  margin: const EdgeInsets.only(top: 25), // Adiciona margem apenas acima do título
                  child: const Text(
                    "Plano de Assinatura:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'DaysOne',
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent, // Faz o AppBar também ser transparente
              elevation: 0,
              toolbarHeight: 80, // Ajusta a altura do AppBar
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Status: Plano Ativo",
                  style: TextStyle(
                    color: Color.fromARGB(255, 192, 192, 192),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(130, 3, 4, 105), // Cor de fundo
                      borderRadius: BorderRadius.circular(20), // Borda arredondada
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/image/plano/bolt.png'),
                            const SizedBox(width: 8),
                            const Text(
                              "Spark Único",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 9),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pop(); // Fecha o diálogo automaticamente após 1 segundo
                                });
                                return AlertDialog(
                                  content: Image.asset('assets/image/plano/absolute.jfif'),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(130, 3, 4, 105),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 205, 4, 4),
                                width: 6,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                          ),
                          child: const Text(
                            'Cancelar Plano',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 205, 4, 4),
                              fontFamily: 'DaysOne',
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Vencimento: 06/09/2024",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
                    padding: const EdgeInsets.all(20), // Aumente o padding para mais espaçamento
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(130, 3, 4, 105),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "O Spark Inclui",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        buildFeatureRow("Acesso à uma infinidade de jogos"),
                        buildFeatureRow("Crie sua lista de jogos predileta"),
                        buildFeatureRow("Jogos de qualidade alta"),
                        buildFeatureRow("Baixe para jogar no modo offline"),
                        buildFeatureRow("Jogue com amigos em tempo real"),
                        buildFeatureRow("Cancele quando quiser"),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                )

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

  Widget buildFeatureRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
      child: Row(
        children: [
          Image.asset(
            'assets/image/plano/check.png',
            width: 24, // Aumente o tamanho do ícone, se necessário
            height: 24,
          ),
          const SizedBox(width: 12), // Aumente o espaçamento entre ícone e texto
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }

}
