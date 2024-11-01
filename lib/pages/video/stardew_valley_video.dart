import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class StardewValleyVideo extends StatefulWidget {
  @override
  _StardewValleyVideoState createState() => _StardewValleyVideoState();
}

class _StardewValleyVideoState extends State<StardewValleyVideo> {
  late VideoPlayerController _controller;
  bool isLandscape = true;

  @override
  void initState() {
    super.initState();
    // Define a orientação inicial como horizontal
    _setOrientation();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _controller = VideoPlayerController.asset('assets/video/stardewVideo.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  void _setOrientation() {
    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  @override
  void dispose() {
    // Retorna a orientação e a interface do sistema ao normal ao sair
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _controller.dispose();
    super.dispose();
  }

  void _toggleOrientation() {
    setState(() {
      isLandscape = !isLandscape;
      _setOrientation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Define fundo preto para dar efeito de tela cheia
      body: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: FittedBox(
                      fit: BoxFit.fill, // Faz o vídeo cobrir toda a área, distorcendo se necessário
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.screen_rotation, color: Colors.white),
              onPressed: _toggleOrientation,
            ),
          ),
        ],
      ),
    );
  }
}
