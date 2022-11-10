import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LaughingFaceScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class LaughingFaceScreen extends StatefulWidget {
  const LaughingFaceScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_eye(), _eye()],
              ),
              SizedBox(
                height: _eyeToMouthSpace,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _outerMouthPiece(BorderRadius.only(
                      topLeft: Radius.circular(_smallMouthRadiusVal),
                      topRight: Radius.circular(_smallMouthRadiusVal),
                      bottomLeft: Radius.circular(_largeMouthRadiusVal))),
                  Expanded(child: Container(
                    height: _mouthWidth,
                    color: _middleEyeMouthColor,
                  )),
                  _outerMouthPiece(BorderRadius.only(
                      topLeft: Radius.circular(_smallMouthRadiusVal),
                      topRight: Radius.circular(_smallMouthRadiusVal),
                      bottomRight: Radius.circular(_largeMouthRadiusVal))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _eye() {
    return Container(
      width: _outerEyeWidth,
      height: _outerEyeWidth,
      decoration: BoxDecoration(color: _outerEyeColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Container(
        width: _middleEyeWidth,
        height: _middleEyeWidth,
        decoration: BoxDecoration(color: _middleEyeMouthColor, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Container(
          width: _innerEyeWidth,
          height: _innerEyeWidth,
          decoration: BoxDecoration(color: _innerEyeColor, shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget _outerMouthPiece(BorderRadius borderRadius) {
    return Container(
        height: _mouthHeight,
        width: _mouthWidth,
        decoration: BoxDecoration(color: _middleEyeMouthColor, borderRadius: borderRadius));
  }
}
