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
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          onTap(index);

          // Definindo a navegação com base no índice
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/salvos');
              break;
            case 2:
              Navigator.pushNamed(context, '/listas');
              break;
            case 3:
              Navigator.pushNamed(context, '/configuracao');
              break;
            default:
              Navigator.pushNamed(context, '/home'); // Rota padrão se o índice não for mapeado
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/nav_bar/home.png', // Substitua pelo caminho da sua imagem
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/nav_bar/salvos.png', // Substitua pelo caminho da sua imagem
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/nav_bar/lista.png', // Substitua pelo caminho da sua imagem
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/nav_bar/config.png', // Substitua pelo caminho da sua imagem
              width: 24,
              height: 24,
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
    );
  }
}
