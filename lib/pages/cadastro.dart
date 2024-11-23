import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _signInWithGoogle() async {
    try {
      // Inicializar o Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // O usuário cancelou o login
        return;
      }

      // Obter as credenciais do Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Criar credenciais para o Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Fazer login com o Firebase
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Navegar para a próxima tela
      Navigator.pushReplacementNamed(context, '/home');

      if (kDebugMode) {
        print("Usuário autenticado: ${userCredential.user?.displayName}");
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
      });
    } catch (e) {
      setState(() {
      });
    }
  }


  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Criação do usuário no Firebase
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cadastro realizado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navega para a página principal
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'E-mail já está em uso.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'E-mail inválido.';
        } else if (e.code == 'weak-password') {
          errorMessage = 'A senha é muito fraca.';
        } else {
          errorMessage = 'Erro: ${e.message}';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  Text(
                    "saphir",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 23, 44, 228),
                      fontSize: screenWidth * 0.15,
                      fontFamily: 'DaysOne',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Cadastre-se para jogar com seus amigos.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      try {
                        _signInWithGoogle(); // Chama a autenticação do Google
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,
                        vertical: screenHeight * 0.015,
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
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.04),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                            color: Colors.white,
                            indent: screenWidth * 0.02,
                            endIndent: screenWidth * 0.02),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.07),
                        child: Text(
                          'ou',
                          style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                            color: Colors.white,
                            indent: screenWidth * 0.02,
                            endIndent: screenWidth * 0.02),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Insira seu email',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: screenWidth * 0.04),
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
                      if (email.length < 6 || !email.contains("@")) {
                        return "E-mail inválido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Nome de Usuário',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: screenWidth * 0.04),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (String? usuario) {
                      if (usuario == null ||
                          usuario.isEmpty ||
                          usuario.length < 4) {
                        return "Nome de usuário inválido";
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
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: screenWidth * 0.04),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (String? senha) {
                      if (senha == null || senha.isEmpty || senha.length < 8) {
                        return "Senha inválida";
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
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: screenWidth * 0.04),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (String? confirmPassword) {
                      if (confirmPassword != _passwordController.text) {
                        return "Senhas não coincidem";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: _register,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.3,
                        vertical: screenHeight * 0.02,
                      ),
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                    ),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.045),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Tem uma conta? Entre",
                      style: TextStyle(
                          color: Colors.blue, fontSize: screenWidth * 0.04),
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
