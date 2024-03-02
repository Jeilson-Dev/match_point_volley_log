import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:match_point_volley_log/features/single_match/single_match_page.dart';

import '../widget_for_tests.dart';

void main() {
  final deviceBuilder = DeviceBuilder()
    ..overrideDevicesForAllScenarios(devices: [Device.iphone11])
    ..addScenario(
      widget: widgetBuilder(SingleMatchPage.create()),
    );

  testGoldens('''when [SingleMatchPage] loads 
  should display the timer at zero, and the both scores cleared''', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "single_match_page_content");
  });

  testGoldens('''when tap to increment team A 
  should increment the counter and display ball possession above the score of team A''', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('increment-team-a')));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "single_match_page_increment_a");
  });

  testGoldens('''when tap to increment team A and tap and hold to decrement the score of team A
  should display the counter with zero[0]''', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('increment-team-a')));
    await tester.pumpAndSettle();
    await tester.longPress(find.byKey(const Key('increment-team-a')));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "single_match_page_decrement_a");
  });

  testGoldens('''when tap to increment team B 
  should increment the counter and display ball possession above the score of team B''', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('increment-team-b')));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "single_match_page_increment_b");
  });

  testGoldens('''when tap to increment team B and tap and hold to decrement the score of team B
  should display the counter with zero[0]''', (WidgetTester tester) async {
    await loadAppFonts();

    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('increment-team-b')));
    await tester.pumpAndSettle();
    await tester.longPress(find.byKey(const Key('increment-team-b')));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "single_match_page_decrement_b");
  });
}
