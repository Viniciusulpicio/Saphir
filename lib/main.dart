import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saphir/pages/acao.dart';
import 'package:saphir/pages/amigos.dart';
import 'package:saphir/pages/casual.dart';
import 'package:saphir/pages/editarPerfil.dart';
import 'package:saphir/pages/jogos/game_scream.dart';
import 'package:saphir/pages/luta.dart';
import 'package:saphir/pages/novidades.dart';
import 'package:saphir/pages/pesquisa.dart';
import 'package:saphir/pages/plano.dart';
import 'package:saphir/pages/rpg.dart';
import 'package:saphir/pages/salvos.dart';
import 'package:saphir/pages/selecioneConta.dart';
import 'package:saphir/pages/simulacao.dart';
import 'package:saphir/pages/terror.dart';
import 'package:saphir/pages/video/star_wars_video.dart';
import 'package:saphir/pages/video/stardew_valley_video.dart';
import 'package:saphir/shared/style.dart';

import 'package:saphir/pages/splash.dart';
import 'package:saphir/pages/login.dart';
import 'package:saphir/pages/cadastro.dart';
import 'package:saphir/pages/configuracao.dart';
import 'package:saphir/pages/conta.dart';
import 'package:saphir/pages/home.dart';
import 'package:saphir/pages/recuperar_senha/nova_senha.dart';
import 'package:saphir/pages/recuperar_senha/recuperar_senha_codigo.dart';
import 'package:saphir/pages/recuperar_senha/recuperar_senha_email.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
);
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

      initialRoute: "/",
      routes: {
        //geral
        '/' : (context) => const Splash(),
        '/gameScreen': (context) => GameScreen(gameId: ModalRoute.of(context)!.settings.arguments as int),
        '/login': (context) =>  Login(),
        '/pesquisa': (context) =>  GameListScreen(),
        '/cadastro': (context) => const Cadastro(),
        '/home': (context) => const Home(),
        '/configuracao': (context) => const Configuracao(),
        '/conta': (context) => const Conta(),
        '/novaSenha': (context) => const NovaSenha(),
        '/recuperarCodigo': (context) => const RecuperarSenhaCodigo(),
        '/recuperarEmail': (context) => const RecuperarSenhaEmail(),
        '/salvos': (context) => const Salvos(),
        '/novidade' : (context) => const Novidades(),
        '/plano' : (context) => const Plano(),
        '/acao': (context) => const Acao(),
        '/casual': (context) => const Casual(),
        '/luta': (context) => const Luta(),
        '/rpg': (context) => const Rpg(),
        '/simulacao': (context) => const Simulacao(),
        '/terror': (context) => const Terror(),
        '/editarPerfil': (context) => const Editarperfil(),
        '/amigos': (context) => const Amigos(),
        '/selecioneConta': (context) => const Selecioneconta(),
        '/starWarsVideo': (context) =>  StarWarsVideo(),
        '/stardewValleyVideo': (context) =>  StardewValleyVideo(),


        //video
        '/videoStardew' : (context) =>  StardewValleyVideo(), 
        '/videoStarWars' : (context) =>  StarWarsVideo(),
      },
    );
  }
}
