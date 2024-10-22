import 'package:flutter/material.dart';
import 'package:saphir/pages/login.dart';
import 'package:saphir/pages/home.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Cadastro> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    "saphir",
                    style: TextStyle(
                      color: Color.fromARGB(255, 23, 44, 228),
                      fontSize: 60,
                      fontFamily: 'DaysOne',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Cadastre-se para jogar com seus amigos.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print("Entrar com o Google pressionado");
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10),
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
                          'assets/image/cadastro/google.png', // Substitua pelo caminho do seu ícone do Google
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Entrar com o Google",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text('ou',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Número de telefone ou email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
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
                    }, // Para ocul
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Nome de Usuário',
                      hintStyle: const TextStyle(color: Colors.grey),
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
                        return "O nome de usuário não pode estar vazio";
                      }
                      if (usuario.length < 4) {
                        return "O nome de usuário deve ter pelo menos 4 caracteres";
                      }
                      if (usuario.length > 12) {
                        return "O nome de usuário deve ter no máximo 12 caracteres";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: const TextStyle(color: Colors.grey),
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
                        return "A senha não pode estar vazia";
                      }
                      if (senha.length < 8) {
                        return "A senha deve ter pelo menos 8 caracteres";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirme sua Senha',
                      hintStyle: const TextStyle(color: Colors.grey),
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
                        return "A confirmação de senha não pode estar vazia";
                      }
                      if (confirmPassword != _passwordController.text) {
                        return "Senha incorreta";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Se todos os campos forem válidos, navega para a home
                        Navigator.pushNamed(context, '/home');
                      } else {
                        // Caso contrário, o formulário exibe os erros
                        print("Erro no formulário");
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 170, vertical: 15),
                        side: const BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: const Color.fromARGB(255, 30, 30, 30)),
                    child: const Text("Cadastrar",
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "Tem uma conta? Entre",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
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

// ignore: camel_case_types
class _formKey {
  // ignore: prefer_typing_uninitialized_variables
  static var currentState;
}
