import 'package:flutter/material.dart';

class BarraPesquisa extends StatelessWidget {
  const BarraPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  appBar: AppBar(
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], // cinza claro
                  borderRadius: BorderRadius.circular(20), // borda arredondada
                  border: Border.all(color: Colors.grey[600]!), // borda cinza mais escura
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2), // espaçamento interno

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
    );
  }
}
