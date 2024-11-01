import 'package:flutter/material.dart';
import 'package:saphir/pages/acao.dart';
import 'package:saphir/pages/casual.dart';
import 'package:saphir/pages/editarPerfil.dart';
import 'package:saphir/pages/jogos/bloons_TD.dart';
import 'package:saphir/pages/jogos/elden_ring.dart';
import 'package:saphir/pages/jogos/elder_scrolls.dart';
import 'package:saphir/pages/jogos/legoBatman.dart';
import 'package:saphir/pages/jogos/lego_city.dart';
import 'package:saphir/pages/jogos/lego_super_herois.dart';
import 'package:saphir/pages/jogos/mineirinho_ultra.dart';
import 'package:saphir/pages/jogos/mortal_kombat.dart';
import 'package:saphir/pages/jogos/outlast.dart';
import 'package:saphir/pages/jogos/silent_hill.dart';
import 'package:saphir/pages/jogos/stardew_valley.dart';
import 'package:saphir/pages/jogos/the_last_us.dart';
import 'package:saphir/pages/jogos/the_sims2.dart';
import 'package:saphir/pages/jogos/the_sims4.dart';
import 'package:saphir/pages/luta.dart';
import 'package:saphir/pages/rpg.dart';
import 'package:saphir/pages/salvos.dart';
import 'package:saphir/pages/simulacao.dart';
import 'package:saphir/pages/terror.dart';
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
      initialRoute: "/editarPerfil",
      routes: {
        // '/' : (context) => const Splash(),
        '/login': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        '/home': (context) => const Home(),
        '/configuracao': (context) => const Configuracao(),
        '/conta': (context) => const Conta(),
        '/novaSenha': (context) => const NovaSenha(),
        '/recuperarCodigo': (context) => const RecuperarSenhaCodigo(),
        '/recuperarEmail': (context) => const RecuperarSenhaEmail(),
        '/salvos': (context) => const Salvos(),
        '/acao': (context) => const Acao(),
        '/casual': (context) => const Casual(),
        '/luta': (context) => const Luta(),
        '/rpg': (context) => const Rpg(),
        '/simulacao': (context) => const Simulacao(),
        '/terror': (context) => const Terror(),
        '/editarPerfil': (context) => const Editarperfil(),
        // jogos
        '/lifeIs': (context) => const LifeIsStrange(),
        '/redDead': (context) => const RedDead(),
        '/starWars': (context) => const StarWars(),
        '/bloondTD': (context) => const BloonsTd(),
        '/eldenRing': (context) => const EldenRing(),
        '/elderScrolls': (context) => const ElderScrolls(),
        '/legoCity': (context) => const LegoCity(),
        '/legoHerois': (context) => const LegoSuperHerois(),
        '/legoBatman': (context) => const Legobatman(),
        '/mineirinhoUltra': (context) => const MineirinhoUltra(),
        '/mortalKombat': (context) => const MortalKombat(),
        '/outlast': (context) => const Outlast(),
        '/stardewValley': (context) => const StardewValley(),
        '/silentHill': (context) => const SilentHill(),
        '/theLastUs': (context) => const TheLastUs(),
        '/theSims2': (context) => const TheSims2(),
        '/theSims4': (context) => const TheSims4(),
      },
    );
  }
}
