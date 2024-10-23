import 'package:flutter/material.dart';

class RecuperarSenhaEmail extends StatefulWidget {
  const RecuperarSenhaEmail({super.key});

  @override
  State<RecuperarSenhaEmail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RecuperarSenhaEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                          "saphir",
                          style: TextStyle(
                              color: Color.fromARGB(255, 23, 44, 228),
                              fontSize: 60,
                              fontFamily: 'DaysOne',
                              ),
                        ),
                              const Text("Digite o email de recuperação:",
                                  style: TextStyle(color: Colors.white)),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: TextFormField(
                                      autocorrect: false,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                          filled: true, // Preenche o fundo
                                          fillColor: Colors.white,
                                          iconColor:
                                              Color.fromARGB(255, 23, 44, 228),
                                          hintText: "E-mail",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              borderSide: BorderSide.none)))),
                            ]))))));
  }
}
