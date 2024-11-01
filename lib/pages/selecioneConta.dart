import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';

class Selecioneconta extends StatefulWidget {
  const Selecioneconta({super.key});

  @override
  State<Selecioneconta> createState() => _SelecionecontaState();
}

class _SelecionecontaState extends State<Selecioneconta> {
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
                margin: const EdgeInsets.only(top: 40), // Adiciona margem acima do título
                child: const Text(
                  "Selecione uma conta:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'DaysOne',
                  ),
                ),
              ),
              backgroundColor: Colors.transparent, // Faz o AppBar transparente
              elevation: 0,
              toolbarHeight: 80, // Ajusta a altura do AppBar
              centerTitle: true, // Centraliza o título horizontalmente
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0), // Espaço entre o AppBar e o texto
                  child: Center(
                    child: Text(
                      "Conta atual: caanelinha",
                      style: TextStyle(
                        color: Color.fromARGB(255, 192, 192, 192),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Espaço entre o texto e o GridView
                Expanded(
                  child: Center(
                    child: GridView.count(
                      crossAxisCount: 2, // Duas colunas
                      crossAxisSpacing: 1, // Espaço entre as colunas
                      mainAxisSpacing: 1, // Espaço entre as linhas
                      shrinkWrap: true, // Permite que o GridView ocupe o menor espaço possível
                      physics: const NeverScrollableScrollPhysics(), // Desativa o scroll do GridView
                      padding: const EdgeInsets.all(20),
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.pushReplacementNamed(context, '/conta')},
                          child: Column(
                            children: [
                              Image.asset("assets/image/selecioneConta/canelinha.png", height: 120, width: 120),
                              const SizedBox(height: 8),
                              const Text(
                                "caanelinha",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset("assets/image/selecioneConta/pedrinho.png", height: 120, width: 120),
                            const SizedBox(height: 8),
                            const Text(
                              "pedrinho26",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/image/selecioneConta/lindinha.png", height: 120, width: 120),
                            const SizedBox(height: 8),
                            const Text(
                              "lindinha333",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/image/selecioneConta/henryco.png", height: 120, width: 120),
                            const SizedBox(height: 8),
                            const Text(
                              "henryco",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
