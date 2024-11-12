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
    // Obter a largura e altura da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(color: const Color.fromARGB(255, 0, 8, 20)),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: screenHeight * 0.1, // Altura do app bar com base na altura da tela
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
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
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/conta/foto_usuario.png",
                          width: screenWidth * 0.4, // Ajusta o tamanho da imagem com base na largura da tela
                          height: screenWidth * 0.4, // Mantém a imagem quadrada
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    const Text(
                      "Nome de exibição:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "DaysOne"),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFormField(
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(100, 3, 4, 105),
                        hintText: "caadelinha",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      "Nome do usuário:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "DaysOne"),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFormField(
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(100, 3, 4, 105),
                        hintText: "givas",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      "Descrição:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "DaysOne"),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFormField(
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      maxLines: null, // Permite múltiplas linhas
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(100, 3, 4, 105),
                        hintText: "cozy gamer\nviolento\n18y\n🤓",
                        hintStyle: TextStyle(color: Colors.white),
                        hintMaxLines: 4,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                          child: ElevatedButton(
                            onPressed: () => {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 41, 144, 43),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.15,
                                vertical: screenHeight * 0.02,
                              ),
                            ),
                            child: const Text(
                              'Salvar',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'DaysOne'),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
