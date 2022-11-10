import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:laughing_face/main.dart';

void main() {
  void gestureGoldenTest({
    required String description,
    required String screenshotName,
    required Offset offset
  }) {
    testGoldens(
        description,
            (tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(devices: [Device.iphone11])
            ..addScenario(
                widget: const MyApp(),
                onCreate: (scenarioWidgetKey) async {
                  await tester.tapAt(offset);
                });

          await tester.pumpDeviceBuilder(builder);

          await screenMatchesGolden(tester, screenshotName);
        });
  }

  group('Tap Events', () {
    gestureGoldenTest(
        description: 'GIVEN user taps at the left top corner, WHEN the gesture detector is listening, THEN show that the inner eye is at the top left of its frame',
        screenshotName: 'default_page_tap_top_left',
        offset: const Offset(100, 100));
    gestureGoldenTest(
        description: 'GIVEN user taps at the right bottom corner, WHEN the gesture detector is listening, THEN show that the inner eye is at the middle right of its frame',
        screenshotName: 'default_page_tap_bottom_right',
        offset: const Offset(400, 400));
    gestureGoldenTest(
        description: 'GIVEN user taps at the right bottom corner, WHEN the gesture detector is listening, THEN show that the inner eye is at the bottom left of its frame',
        screenshotName: 'default_page_tap_bottom_left',
        offset: const Offset(10, 600));
  });
}
