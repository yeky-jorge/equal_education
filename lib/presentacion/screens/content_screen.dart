import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ContentScreen extends StatefulWidget {
  final int courseId;
  final int signatureId;

  const ContentScreen({
    super.key,
    required this.courseId,
    required this.signatureId,
  });

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  // ===========================================================
  // Variables para Speech-to-Text (Reconocimiento de voz)
  // ===========================================================
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _transcribedText = '';

  // ===========================================================
  // Variables para FlutterTTS (Texto a voz)
  // ===========================================================
  final FlutterTts _flutterTts = FlutterTts();

  // ===========================================================
  // Variables para captura de fotos/videos
  // ===========================================================
  final ImagePicker _picker = ImagePicker();

  // ===========================================================
  // Variables para la interfaz y el chat
  // ===========================================================
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = []; // Lista para almacenar los mensajes

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  // ===========================================================
  // Métodos para captura de fotos y videos
  // ===========================================================
  Future<void> _capturePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final File savedImage = await _saveFileToLocalStorage(photo);
      _addMediaToChat(savedImage, isImage: true);
    }
  }

  Future<void> _recordVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      final File savedVideo = await _saveFileToLocalStorage(video);
      _addMediaToChat(savedVideo, isImage: false);
    }
  }

  Future<File> _saveFileToLocalStorage(XFile file) async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String path = '${appDir.path}/${file.name}';
    return File(file.path).copy(path);
  }

  void _addMediaToChat(File file, {required bool isImage}) {
    setState(() {
      _messages.add({
        'file': file,
        'isImage': isImage,
      });
    });
  }

  // ===========================================================
  // Métodos para FlutterTTS (Texto a voz)
  // ===========================================================
  Future<void> _initTts() async {
    await _flutterTts.setLanguage("es-ES");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
  }

  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  // ===========================================================
  // Métodos para Speech-to-Text (Reconocimiento de voz)
  // ===========================================================
  Future<void> _initSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        setState(() {
          _isListening = status == 'listening';
        });
      },
      onError: (error) {
        print('Error: $error');
        setState(() {
          _isListening = false;
        });
      },
    );

    if (available) {
      _startListening();
    } else {
      print('El reconocimiento de voz no está disponible');
    }
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        setState(() {
          _transcribedText = result.recognizedWords;
          if (result.finalResult) {
            _messages.add({
              'text': _transcribedText,
              'isTranscribed': true,
            });
            _transcribedText = '';
          }
        });
      },
      localeId: 'es_ES',
    );
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  // ===========================================================
  // Métodos para enviar mensajes
  // ===========================================================
  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': text,
          'isTranscribed': false,
        });
      });
      _messageController.clear();
      _speak(text);
    }
  }

  // ===========================================================
  // Construcción de la interfaz
  // ===========================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenido'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/signature/${widget.courseId}');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final message = _messages[index];
                if (message.containsKey('file')) {
                  return message['isImage']
                      ? Image.file(message['file'], width: 100, height: 100)
                      : Icon(Icons.videocam, size: 50);
                }
                return Text(message['text']);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: _capturePhoto,
                  heroTag: 'photo',
                  child: const Icon(Icons.camera),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _recordVideo,
                  heroTag: 'video',
                  child: const Icon(Icons.videocam),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  heroTag: 'send',
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
