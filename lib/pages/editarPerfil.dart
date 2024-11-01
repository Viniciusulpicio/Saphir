import 'package:flutter/material.dart';
import 'package:saphir/shared/style.dart';

class Editarperfil extends StatefulWidget {
  const Editarperfil({super.key});

  @override
  State<Editarperfil> createState() => _EditarperfilState();
}

class _EditarperfilState extends State<Editarperfil> {
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
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, "/conta");
                          },
                        ),
                        centerTitle: true,
                        title: const Text(
                          "Editar perfil",
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
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "assets/image/conta/foto_usuario.png"),
                                ],
                              ),
                              const SizedBox(height: 60),
                              const Text(
                                "Nome de exibição:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "DaysOne"),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    filled: true, // Preenche o fundo
                                    fillColor: Color.fromARGB(100, 3, 4, 105),
                                    hintText: "caadelinha",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        borderSide: BorderSide.none)),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Nome do usuário:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "DaysOne"),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    filled: true, // Preenche o fundo
                                    fillColor: Color.fromARGB(100, 3, 4, 105),
                                    hintText: "givas",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        borderSide: BorderSide.none)),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Descrição:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "DaysOne"),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                maxLines:
                                    null, // Permite que o usuário digite em múltiplas linhas
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(100, 3, 4, 105),
                                  hintText: "cozy gamer\nviolento\n18y\n🤓",
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintMaxLines:
                                      4, // Limita o número de linhas do hint
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: ElevatedButton(
                                      onPressed: () => (),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 41, 144, 43), // Cor de fundo verde
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              50), // Bordas arredondadas
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 55,
                                            vertical: 15), // Tamanho do botão
                                      ),
                                      child: const Text(
                                        'Salvar',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Colors.white, // Cor do texto branco
                                            fontFamily: 'DaysOne'),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    )))
      ],
    );
  }
}
