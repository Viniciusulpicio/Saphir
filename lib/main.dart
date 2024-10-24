import 'package:flutter/material.dart';
import 'package:saphir/pages/jogos/stardew_valley.dart';
import 'package:saphir/shared/style.dart';

import 'package:saphir/pages/splash.dart';
import 'package:saphir/pages/login.dart';
import 'package:saphir/pages/cadastro.dart';
import 'package:saphir/pages/configuracao.dart';
import 'package:saphir/pages/conta.dart';
import 'package:saphir/pages/home.dart';
import 'package:saphir/pages/jogos/life_is_strange.dart';
import 'package:saphir/pages/jogos/red_dead.dart';
import 'package:saphir/pages/jogos/star_wars.dart';
import 'package:saphir/pages/recuperar_senha/nova_senha.dart';
import 'package:saphir/pages/recuperar_senha/recuperar_senha_codigo.dart';
import 'package:saphir/pages/recuperar_senha/recuperar_senha_email.dart';
import 'package:saphir/components/barra_pesquisa.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulEscuro),
        useMaterial3: true,
      ),

      initialRoute: "/home",
      routes: {
        // '/' : (context) => const Splash(),
        '/login' : (context) => const Login(),
        '/cadastro' : (context) => const Cadastro(),
        '/home' : (context) => const Home(),
        '/configuracao' : (context) => const Configuracao(),
        '/conta' : (context) => const Conta(),
        '/lifeIs' : (context) =>  const LifeIsStrange(),
        '/redDead' : (context) => const RedDead(),
        '/starWars' : (context) => const StarWars(),
        '/stardewValley' : (context) => const StardewValley(),
        '/novaSenha' : (context) => const NovaSenha(),
        '/recuperarCodigo' : (context) => const RecuperarSenhaCodigo(),
        '/recuperarEmail' : (context) => const RecuperarSenhaEmail(),
        '/barraPesuisa' : (context) => const BarraPesquisa(),

        

      },
    );
  }
} 