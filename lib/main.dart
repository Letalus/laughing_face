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

  static const leftInnerEyeKey = Key('left inner eye key');

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

  final _eyeMovementRadius = 80.0;
  Offset _eyeOffsetPercentage = const Offset(0.45, 0.45);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        onPan(details.globalPosition);
      },
      onPanStart: (details) {
        onPan(details.globalPosition);
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_eye(key: LaughingFaceScreen.leftInnerEyeKey), _eye()],
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
                    Expanded(
                        child: Container(
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
      ),
    );
  }

  void onPan(Offset globalPosition) {
    final screenOffset = Offset(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    setState(() {
      _eyeOffsetPercentage = Offset(globalPosition.dx/screenOffset.dx, globalPosition.dy/screenOffset.dy);
    });
  }

  Widget _eye({Key? key}) {
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
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                key: key,
                top: _eyeMovementRadius*_eyeOffsetPercentage.dy,
                left: _eyeMovementRadius*_eyeOffsetPercentage.dx,
                child: Container(
                  width: _innerEyeWidth,
                  height: _innerEyeWidth,
                  decoration: BoxDecoration(color: _innerEyeColor, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
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
