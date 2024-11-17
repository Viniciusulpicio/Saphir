import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  String? _errorMessage;

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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null; // Limpa a mensagem de erro ao tentar novamente
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          _errorMessage = 'Usuário não encontrado. Verifique o e-mail.';
        } else if (e.code == 'wrong-password') {
          _errorMessage = 'Senha incorreta.';
        } else {
          _errorMessage = 'Usuario ou senha incorreto. Tente novamente';
        }
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth < 600 ? 30.0 : 80.0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Stack(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 180),
                        _buildEmailField(),
                        const SizedBox(height: 40),
                        _buildPasswordField(),
                        const SizedBox(height: 20),
                        if (_errorMessage != null)
                          Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        const SizedBox(height: 20),
                        _buildForgotPassword(screenWidth),
                        const SizedBox(height: 40),
                        _buildLoginButton(screenWidth),
                        const SizedBox(height: 40),
                        _buildSocialButtons(screenWidth),
                        const SizedBox(height: 30),
                        const Divider(indent: 90, endIndent: 90),
                        const SizedBox(height: 30),
                        _buildSignUpPrompt(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.23,
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
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "E-mail",
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (email) {
            if (email == null || email.isEmpty) {
              return "O e-mail não pode estar vazio";
            }
            if (!email.contains("@") || !email.contains(".")) {
              return "O e-mail não é válido";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        fillColor: Colors.white,
        hintText: "Senha",
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (password) {
        if (password == null || password.isEmpty) {
          return "A senha não pode estar vazia";
        }
        if (password.length < 6) {
          return "A senha deve ter pelo menos 6 caracteres";
        }
        return null;
      },
    );
  }

  Widget _buildForgotPassword(double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth < 600 ? 30.0 : 80.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/recuperarEmail");
          },
          child: const Text(
            "Esqueceu a senha?",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(double screenWidth) {
    return ElevatedButton(
      onPressed: _login,
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
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text(
              "Entrar",
              style: TextStyle(color: Colors.white),
            ),
    );
  }

  Widget _buildSocialButtons(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton('assets/image/login/facebook.png', screenWidth),
        const SizedBox(width: 30),
        _buildSocialButton('assets/image/login/apple.png', screenWidth),
        const SizedBox(width: 30),
        _buildSocialButton('assets/image/login/google.png', screenWidth),
      ],
    );
  }

  Widget _buildSocialButton(String assetPath, double screenWidth) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: screenWidth < 600 ? 50 : 60,
        height: screenWidth < 600 ? 50 : 60,
        child: Image.asset(assetPath),
      ),
    );
  }

  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Não tem uma conta?",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/cadastro");
          },
          child: const Text(
            "Cadastre-se",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
