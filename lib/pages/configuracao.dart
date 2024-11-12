import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';
import 'package:saphir/components/nav_bar.dart';

class Configuracao extends StatefulWidget {
  const Configuracao({super.key});

  @override
  State<Configuracao> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Configuracao> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtendo a largura da tela
    double screenWidth = MediaQuery.of(context).size.width;

    // Definindo tamanho de fonte e padding com base na largura da tela
    double fontSize =
        screenWidth < 400 ? 14 : 16; // Menor que 400px largura, usa font 14
    double horizontalPadding =
        screenWidth < 400 ? 20 : 50; // Menor que 400px usa padding menor

    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 8, 20),
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
                  child: const Text(
                    'Configurações',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
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
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/conta');
                      },
                      child: buildMenuOption(
                        icon: 'assets/image/configuracao/conta.png',
                        label: 'Conta',
                        fontSize: fontSize,
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildMenuOption(
                      icon: 'assets/image/configuracao/idioma.png',
                      label: 'Idioma',
                      fontSize: fontSize,
                    ),
                    const SizedBox(height: 20),
                    buildMenuOption(
                      icon: 'assets/image/configuracao/notificacao.png',
                      label: 'Notificações',
                      fontSize: fontSize,
                    ),
                    const SizedBox(height: 20),
                    buildMenuOption(
                      icon: 'assets/image/configuracao/seguranca.png',
                      label: 'Segurança',
                      fontSize: fontSize,
                    ),
                    const SizedBox(height: 20),
                    buildMenuOption(
                      icon: 'assets/image/configuracao/ajuda.png',
                      label: 'Ajuda',
                      fontSize: fontSize,
                    ),
                    const SizedBox(height: 20),
                    buildMenuOption(
                      icon: 'assets/image/configuracao/sobre.png',
                      label: 'Sobre',
                      fontSize: fontSize,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: buildMenuOption(
                        icon: 'assets/image/configuracao/sair.png',
                        label: 'Sair',
                        fontSize: fontSize,
                        labelColor:
                            Color.fromARGB(255, 205, 4, 4), // Cor para "Sair"
                      ),
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

  Widget buildMenuOption({
    required String icon,
    required String label,
    double fontSize = 16,
    Color labelColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 1, 7, 45),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Image.asset(icon),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
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
