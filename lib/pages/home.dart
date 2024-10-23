import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';
import 'package:saphir/components/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Aqui você pode adicionar a lógica de navegação se necessário
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Define o fundo como transparente
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255), // Torna o AppBar também transparente
          elevation: 0, // Remove a sombra do AppBar
        ),
        body: const Center(
          child: Text(
            "Home",
            style: TextStyle(fontSize: 24, color: Colors.white), // Torna o texto visível
          ),
        ),
        bottomNavigationBar: navBar( // Aqui está o navBar que você quer reutilizar
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}