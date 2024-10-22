import 'package:flutter/material.dart';

class RecuperarSenhaEmail extends StatefulWidget {
  const RecuperarSenhaEmail({super.key});

  @override
  State<RecuperarSenhaEmail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RecuperarSenhaEmail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: Center(
          child: SingleChildScrollView(
              child: Form(
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
            Text(
              "saphir",
              style: TextStyle(
                color: Color.fromARGB(255, 23, 44, 228),
                fontSize: 60,
                fontFamily: 'DaysOne',
              ),
            ),
            Text("Digite o email de recuperação:", style: TextStyle(color: Colors.white)),
            Padding(padding:  const EdgeInsets.symmetric(horizontal: 30.0),
            child:  ,)
          ]))))),
    );
  }
}
