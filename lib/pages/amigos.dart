import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';

class Amigos extends StatefulWidget {
  const Amigos({super.key});

  @override
  State<Amigos> createState() => _AmigosState();
}

class _AmigosState extends State<Amigos> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color.fromARGB(255, 0, 8, 20)),
        GradientBackground(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    toolbarHeight: 100,
                    leading: IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, "/conta");
                      },
                    ),
                    centerTitle: true,
                    title: const Text(
                      "Amigos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'DaysOne',
                      ),
                    )),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                              16.0), // Define o padding ao redor do Column
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                100, 3, 5, 105), // Define a cor de fundo
                            borderRadius: BorderRadius.circular(
                                20), // Adiciona bordas arredondadas, se desejado
                          ),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/image/amigos/jhuanLindo.png",
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "jhuanamalegos33",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'DaysOne',
                                    ),
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/image/amigos/conversa.png",
                                    width: 25,
                                    height: 25,
                                  )
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/image/amigos/legominecraft827.png",
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "legominecraft827",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'DaysOne',
                                    ),
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/image/amigos/conversa.png",
                                    width: 25,
                                    height: 25,
                                  )
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/image/amigos/pedrohenriquelegooos.png",
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "pedrohenriquelegooos",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'DaysOne',
                                    ),
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/image/amigos/conversa.png",
                                    width: 25,
                                    height: 25,
                                  )
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/image/amigos/TomasSkibidi.png",
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "TomásSkibidi",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'DaysOne',
                                    ),
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/image/amigos/conversa.png",
                                    width: 25,
                                    height: 25,
                                  )
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Mostrar mais",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'DaysOne',
                              ),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(
                              16.0), // Define o padding ao redor do Column
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                100, 3, 5, 105), // Define a cor de fundo
                            borderRadius: BorderRadius.circular(
                                20), // Adiciona bordas arredondadas, se desejado
                          ),
                          child: Column(children: [
                            const Text(
                              "Conquistas",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'DaysOne',
                                  color: Colors.white),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      "assets/image/amigos/TomasSkibidi.png",
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "TomásSkibidi",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'DaysOne',
                                    ),
                                  ),
                                ]),
                            GestureDetector(
                              child: Image.asset(
                                  "assets/image/jogos/mineirinhoUtra.png",
                                  height: 125),
                              onTap: () {
                                Navigator.pushNamed(context, '/gameScreen',
                                    arguments: 13); // Passando o ID do jogo
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Use spaceBetween aqui
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/image/amigos/conquista.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Só o começo - Mineir...",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'DaysOne',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                              width: MediaQuery.of(context).size.width *
                                  0.5, // Define metade do tamanho
                              child: const Divider(
                                color: Colors.white, // Define a cor do Divider
                                thickness: 1, // Espessura do Divider
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    "assets/image/amigos/jhuanLindo.png",
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "jhuanamalegos33",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'DaysOne',
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              child: Image.asset(
                                  "assets/image/jogos/silentHill2.png",
                                  height: 125),
                              onTap: () {
                                Navigator.pushNamed(context, '/gameScreen',
                                    arguments: 12); // Passando o ID do jogo
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Mostrar mais",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'DaysOne',
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                )))
      ],
    );
  }
}
