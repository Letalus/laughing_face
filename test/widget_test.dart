
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:laughing_face/main.dart';

void main() {
  testGoldens('UI Test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.iphone11])
      ..addScenario(widget: const LaughingFaceScreen(), name: 'default page');

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'default_page');
  });
}
