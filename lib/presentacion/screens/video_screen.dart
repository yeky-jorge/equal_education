import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:go_router/go_router.dart';


// Page pirncipal ( 2 main)
class VideoBackgroundScreen extends StatefulWidget {
  @override
  _VideoBackgroundScreenState createState() => _VideoBackgroundScreenState();
}

class _VideoBackgroundScreenState extends State<VideoBackgroundScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/assets/videos/b_video.mp4')
      ..initialize().then((_) {
        _controller
            .setLooping(true); // Hacer que el video se reproduzca en loop
        _controller.play(); // Reproducir automáticamente
        setState(() {}); // Redibujar cuando esté inicializado
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Video de fondo
          Positioned.fill(
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Container(
                    color: Colors.black,
                  ),
          ),
          // Texto en el centro
          // Overlay para oscurecer un poco el video
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4), // Oscurecer el fondo
            ),
          ),
          // Imagen (logo) en la esquina superior izquierda
          Positioned(
            top: -65,
            left: 5,
            child: Image.asset(
              'lib/assets/img/3.png', // Cambia esto por tu imagen de logo
              width: 250,
              // Ajusta el tamaño según tu diseño
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Ajusta el tamaño del contenido al mínimo necesario
                children: [
                  // Texto arriba del botón
                  Text(
                    'Rompiendo barreras, \ncreando oportunidades \ncon una nueva forma \nde Aprender',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white, fontSize: 22, height: 1.5),
                       // Espaciado entre líneas
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                      height: 40), // Espaciado entre el texto y el botón
                  // Botón
                  SizedBox(
                    width: 290,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        context.go('/course');
                        // Acción al presionar el botón
                      },
                      child: const Text(
                        'Comenzar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Geist',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
