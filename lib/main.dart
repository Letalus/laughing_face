import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Laughing Face',
      home: LaughingFaceScreen(),
    );
  }
}

class LaughingFaceScreen extends StatefulWidget {
  const LaughingFaceScreen({super.key});

  @override
  State<LaughingFaceScreen> createState() => _LaughingFaceScreenState();
}

class _LaughingFaceScreenState extends State<LaughingFaceScreen> {
  final _outerEyeColor = const Color(0xFFE8F2FF);
  final _middleEyeMouthColor = const Color(0xFF68DBFF);
  final _innerEyeColor = const Color(0xFF00FFFF);

  final _outerEyeWidth = 150.0;
  final _middleEyeWidth = 110.0;
  final _innerEyeWidth = 40.0;

  final _eyeToMouthSpace = 80.0;
  final _mouthHeight = 120.0;
  final _mouthWidth = 50.0;
  final _largeMouthRadiusVal = 30.0;
  final _smallMouthRadiusVal = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(),
        ),
      ),
    );
  }
}
