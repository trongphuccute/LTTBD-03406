

import 'package:flutter_test/flutter_test.dart' show WidgetTester, expect, find, findsOneWidget, testWidgets;

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
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
  });
}
