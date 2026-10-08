import 'package:flutter/material.dart';
import 'package:budgetr/widgets/welcome/welcome_message.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({required this.getStarted, super.key});

  final void Function() getStarted;

  @override
  State<WelcomeScreen> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xfffebb39);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: backgroundColor,
    ));

    return Scaffold(
      backgroundColor: backgroundColor,
      body: const WelcomeMessage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.getStarted();
        },
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 30,
        ),
      ),
    );
  }
}
