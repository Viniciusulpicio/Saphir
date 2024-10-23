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
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Life is Strange: Remastered Collection",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          elevation: 0,
        ),
        body: const Center(
          child: Text(
            "Jogo 1 teste",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        bottomNavigationBar: navBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}