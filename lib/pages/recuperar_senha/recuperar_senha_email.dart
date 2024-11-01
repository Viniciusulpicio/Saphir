import 'package:flutter/material.dart';

class RecuperarSenhaEmail extends StatefulWidget {
  const RecuperarSenhaEmail({super.key});

  @override
  State<RecuperarSenhaEmail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RecuperarSenhaEmail> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
                    "saphir",
                    style: TextStyle(
                      color: Color.fromARGB(255, 23, 44, 228),
                      fontSize: 60,
                      fontFamily: 'DaysOne',
                    ),
                  )
        
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0.0, // Top left corner
              left: 0.0, // Top left corner
              right: 0.0, // Occupy full width
              child: Container(
                color: Colors.transparent, // Maintain background color
              ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Digite seu E-mail de recuperação",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22)),
                            ])),
                            const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                            filled: true, // Preenche o fundo
                            fillColor: Colors.white,
                            iconColor: Color.fromARGB(255, 23, 44, 228),
                            hintText: "E-mail",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      indent: 90,
                      endIndent: 90,
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Enviaremos um e-mail com um \ncódigo de recuperação.",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 500,
                              )
                            ])),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          buttonEnterClick();
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 170, vertical: 15),
                            side:
                                const BorderSide(color: Colors.white, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor:
                                const Color.fromARGB(255, 30, 30, 30)),
                        child: const Text("Próximo",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/recuperarCodigo');
    } else {
      print("form erro");
    }
  }
}

