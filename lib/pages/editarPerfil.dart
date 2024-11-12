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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(color: const Color.fromARGB(255, 0, 8, 20)),
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: screenHeight * 0.1,
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
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/conta/foto_usuario.png",
                          width: screenWidth * 0.4,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    _buildTextField("Nome de exibição:", "caadelinha", screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    _buildTextField("Nome do usuário:", "givas", screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    _buildTextField("Descrição:", "cozy gamer\nviolento\n18y\n🤓", screenWidth, maxLines: null),
                    SizedBox(height: screenHeight * 0.05),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: ElevatedButton(
                          onPressed: () {},
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
                              fontFamily: 'DaysOne',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, double screenWidth, {int? maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: "DaysOne",
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          autofocus: false,
          style: const TextStyle(color: Colors.white),
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(100, 3, 4, 105),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
