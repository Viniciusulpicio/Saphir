import 'package:flutter/material.dart';

class navBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const navBar({required this.currentIndex, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index);
        
        // Definindo a navegação com base no índice
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/conta');
            break;
          case 2:
            Navigator.pushNamed(context, '/configuracao');
            break;
          case 3:
            Navigator.pushNamed(context, '/login');
            break;
          default:
            Navigator.pushNamed(context, '/home'); // Rota padrão se o índice não for mapeado
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Conta',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configurações',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.login),
          label: 'Login',
        ),
      ],
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    );
  }
}