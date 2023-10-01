import 'package:flutter/material.dart';
import 'package:budgetr/widgets/welcome_message.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xfffebb39),
      body: const WelcomeMessage(),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          widget.getStarted();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
        ),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 30,
        ),
      ),
    );
  }
}
