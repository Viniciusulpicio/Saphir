import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Chave Global para o formulário
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Define largura e altura da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Center(
        child: Form(
          key: _formKey, // Associar a chave ao Form
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  Text(
                    "saphir",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 23, 44, 228),
                      fontSize: screenWidth * 0.12, // Tamanho da fonte responsivo
                      fontFamily: 'DaysOne',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Cadastre-se para jogar com seus amigos.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05, // Tamanho da fonte responsivo
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      print("Entrar com o Google pressionado");
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.25,
                        vertical: screenHeight * 0.02,
                      ),
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/image/cadastro/google.png',
                          height: screenHeight * 0.03,
                          width: screenHeight * 0.03,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "Entrar com o Google",
                          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          color: Colors.white,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                        child: Text(
                          'ou',
                          style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.white,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Número de telefone ou email',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (String? email) {
                      if (email == null || email.isEmpty) {
                        return "O campo email não pode estar vazio";
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
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Nome de Usuário',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (String? usuario) {
                      if (usuario == null || usuario.isEmpty) {
                        return "O campo usuário não pode estar vazio";
                      }
                      if (usuario.length < 4) {
                        return "O nome de usuário deve ter pelo menos 4 caracteres";
                      }
                      if (usuario.length > 12) {
                        return "O nome de usuário deve ter no máximo 16 caracteres";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (String? senha) {
                      if (senha == null || senha.isEmpty) {
                        return "O campo senha não pode estar vazio";
                      }
                      if (senha.length < 8) {
                        return "A senha deve ter pelo menos 8 caracteres";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirme sua Senha',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (String? confirmPassword) {
                      if (confirmPassword == null || confirmPassword.isEmpty) {
                        return "Esse campo não pode estar vazio";
                      }
                      if (confirmPassword != _passwordController.text) {
                        return "Senha incorreta";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      } else {
                        print("Erro no formulário");
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.3, vertical: screenHeight * 0.02),
                        side: const BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: const Color.fromARGB(255, 30, 30, 30)),
                    child: Text("Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04)),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Tem uma conta? Entre",
                      style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.04),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
