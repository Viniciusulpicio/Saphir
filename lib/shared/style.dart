import 'package:flutter/material.dart';

class MyColors{
  static const Color azulEscuro = Color.fromARGB(255, 20, 31, 40);

  static const Color azulTopGradiente = Color(0xFF00ADFA);
  static const Color azulBottomGradiente = Color(0xFFBFF9FF);
}

class MyFonts{
  static String fontPrimary = "NotoSansWarangCiti";
}

// import 'package:flutter/material.dart';

// class GradientBackground extends StatelessWidget {
//   final Widget child;

//   const GradientBackground({required this.child, Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Gradiente superior
//         Positioned.fill(
//           child: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xFF000814), // Cor no topo
//                   Color(0xFF030469), // Cor embaixo
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // Gradiente inferior (com cores invertidas)
//         Positioned.fill(
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 200, // Altura do gradiente inferior
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFF030469), // Cor no topo
//                     Color(0xFF000814), // Cor embaixo
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // Conteúdo da página
//         child,
//       ],
//     );
//   }
// }
