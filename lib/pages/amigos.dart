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
                        Container(decoration: 
                        const BoxDecoration(
                          color: Color.fromARGB(100, 3, 5, 105)
                        ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/amigos/jhuanLindo.png",
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "jhuanamalegos33",
                              style: TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            const SizedBox(width: 10),
                            Image.asset(
                              "assets/image/amigos/conversa.png",
                              width: 30,
                              height: 30,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                )))
      ],
    );
  }
}
