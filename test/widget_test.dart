<<<<<<< HEAD
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
=======


import 'package:flutter_test/flutter_test.dart' show WidgetTester, expect, find, findsOneWidget, testWidgets;
>>>>>>> e449149c5cf7377c5f23bba3fbcec5c1bba8ba20

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
<<<<<<< HEAD
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
=======
    // ignore: unused_element
    void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Build widget
    var profile_app = Profile_app();
    var profile_app2 = profile_app;
    var profile_app22 = profile_app2;
    await tester.pumpWidget(profile_app22);

    // Tìm text
    expect(find.text('Profile_app'), findsOneWidget); // Cập nhật theo text thực tế của bạn
  });
}
>>>>>>> e449149c5cf7377c5f23bba3fbcec5c1bba8ba20
  });
}
