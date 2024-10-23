import 'package:flutter/material.dart';

class MyColors{
  static const Color azulEscuro = Color.fromARGB(255, 20, 31, 40);

  static const Color azulTopGradiente = Color(0xFF00ADFA);
  static const Color azulBottomGradiente = Color(0xFFBFF9FF);
}

class MyFonts{
  static String fontPrimary = "NotoSansWarangCiti";
}


class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradiente superior (com altura menor)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 150, // Altura menor para o gradiente superior
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF030469), // Cor no topo
                  Color(0xFF000814), // Cor mais escura no meio
                ],
                stops: [0.0, 1.0], // Suavidade do gradiente
              ),
            ),
          ),
        ),
        // Gradiente inferior
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200, // Altura do gradiente inferior
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF000814), // Cor mais escura
                    Color(0xFF030469), // Cor no fundo
                  ],
                  stops: [0.3, 1.0], // Controle de transição
                ),
              ),
            ),
          ),
        ),
        // Conteúdo da página
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}