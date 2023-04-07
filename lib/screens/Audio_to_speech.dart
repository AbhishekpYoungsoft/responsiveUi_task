import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechScreen> {
  //SpeechScreen _speechToText = SpeechScreen(); //initilize
  bool isListening = false;
  String text = 'Press to start specaking';
  double confidence = 1.0;
  stt.SpeechToText speechToText = stt.SpeechToText();

  @override
  void initState() {
    super.initState();
    stt.SpeechToText speechToText = stt.SpeechToText();
  }

  void Listen() async {
    if (!isListening) {
      bool availabe = await speechToText.initialize(
        onStatus: (val) => print("OnStatus:$val"),
        onError: (val) => print("OnError:$val"),
      );
      if (availabe) {
        setState(() => isListening = true);
        speechToText.listen(
            onResult: (val) => setState(() {
                  text = val.recognizedWords;
                  if (val.hasConfidenceRating && val.confidence > 0) {
                    confidence = val.confidence;
                  }
                }));
      }
    } else {
      setState(() {
        isListening = false;
      });
      speechToText.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPeech to Text'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: Listen,
          child: Icon(isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }
}
