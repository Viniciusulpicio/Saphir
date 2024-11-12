import 'package:flutter/material.dart';

// Componente de barra de pesquisa extraído
class BarraPesquisaWidget extends StatelessWidget {
  const BarraPesquisaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/pesquisa'), // Navegação ao clicar em qualquer parte
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300], // cinza claro
          borderRadius: BorderRadius.circular(15), // borda arredondada
          border: Border.all(color: Colors.grey[600]!), // borda cinza mais escura
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2), // espaçamento interno

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const Icon(Icons.search, color: Color.fromARGB(255, 60, 60, 60), size: 35),
          ],
        ),
      ),
    );
  }
}
