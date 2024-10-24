import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';
import 'package:saphir/components/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  get children => null;

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
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], // cinza claro
                  borderRadius: BorderRadius.circular(20), // borda arredondada
                  border: Border.all(color: Colors.grey[600]!), // borda cinza mais escura
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2), // espaçamento interno

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha logo/texto à esquerda e ícone à direita
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/image/barra_pesquisa/logo_preto&branco.png'), // logo
                        const SizedBox(width: 10), // espaçamento entre logo e texto
                        const Text(
                          'saphir',
                          style: TextStyle(
                            color: Color.fromARGB(255, 110, 110, 110),
                            fontFamily: 'DaysOne',
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.search, color: Color.fromARGB(255, 60, 60, 60),  size: 35,  ), // ícone de busca no canto direito
                  ],
                ),
              ),
              backgroundColor: Colors.transparent, // Faz o AppBar ser transparente
              elevation: 0,
              toolbarHeight: 80, // Ajusta a altura do AppBar
              centerTitle: true,
            ),
            body: const Center(
              child: Text('Conteúdo da Home'),
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
