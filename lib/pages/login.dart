import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 5.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtém o tamanho da tela
    double screenWidth = MediaQuery.of(context).size.width;

    // Define o padding com base na largura da tela
    double horizontalPadding = screenWidth < 600 ? 30.0 : 80.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Center(
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 180),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          iconColor: Color.fromARGB(255, 23, 44, 228),
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (String? email) {
                          if (email == "" || email == null) {
                            return "O email não pode estar vazio";
                          }
                          if (email.length < 6) {
                            return "O e-mail está muito curto";
                          }
                          if (!email.contains("@")) {
                            return "O e-mail não é valido";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: TextFormField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          filled: true,
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassword ? Icons.visibility : Icons.visibility_off,
                            ),
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                          fillColor: Colors.white,
                          iconColor: const Color.fromARGB(255, 23, 44, 228),
                          hintText: "Senha",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (String? senha) {
                          if (senha == null || senha.isEmpty) {
                            return "A senha não pode estar vazia";
                          }
                          if (senha.length < 8) {
                            return "A senha deve ter pelo menos 8 caracteres";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: const Text(
                            "Esqueceu a senha?",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/recuperarEmail");
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          buttonEnterClick();
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth < 600 ? 80 : 170,
                            vertical: 15,
                          ),
                          side: const BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                        ),
                        child: const Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset('assets/image/login/facebook.png'),
                          ),
                        ),
                        const SizedBox(width: 30),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset('assets/image/login/apple.png'),
                          ),
                        ),
                        const SizedBox(width: 30),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset('assets/image/login/google.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Divider(indent: 90, endIndent: 90),
                    const SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Não tem uma conta?",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            child: const Text(
                              "Cadastre-se",
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/cadastro");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: const Text(
                    "saphir",
                    style: TextStyle(
                      color: Color.fromARGB(255, 23, 44, 228),
                      fontSize: 60,
                      fontFamily: 'DaysOne',
                    ),
                  ),
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
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print("form erro");
    }
  }
}
