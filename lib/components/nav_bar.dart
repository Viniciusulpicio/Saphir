import 'package:flutter/material.dart';

class navBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const navBar({required this.currentIndex, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent, // Garantindo transparência
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0), // Espaçamento nas laterais
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == currentIndex) {
              // Se o índice atual for o mesmo, não faça nada
              return;
            }

            // Se for uma nova página, chame a função de navegação
            onTap(index);

            // Navegação
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/home');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/salvos');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/listas');
                break;
              case 3:
                Navigator.pushReplacementNamed(context, '/configuracao');
                break;
              default:
                Navigator.pushReplacementNamed(context, '/home');
            }
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Espaçamento entre os itens
                child: Image.asset(
                  'assets/image/nav_bar/home.png',
                  width: 24,
                  height: 24,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Espaçamento entre os itens
                child: Image.asset(
                  'assets/image/nav_bar/salvos.png',
                  width: 24,
                  height: 24,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Espaçamento entre os itens
                child: Image.asset(
                  'assets/image/nav_bar/lista.png',
                  width: 24,
                  height: 24,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Espaçamento entre os itens
                child: Image.asset(
                  'assets/image/nav_bar/config.png',
                  width: 24,
                  height: 24,
                ),
              ),
              label: '',
            ),
          ],
          backgroundColor: Colors.transparent, // Barra transparente
          elevation: 0, // Remove a sombra
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed, // Evita animações desnecessárias
        ),
      ),
    );
  }
}
