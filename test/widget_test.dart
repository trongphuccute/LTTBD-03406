import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // sửa tên package nếu khác

void main() {
  testWidgets('Email validation test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: EmailCheckApp()));

    final emailField = find.byKey(Key('emailField'));
    final checkButton = find.byKey(Key('checkButton'));
    final resultText = find.byKey(Key('resultText'));

    await tester.enterText(emailField, '');
    await tester.tap(checkButton);
    await tester.pump();
    expect(find.text('Email không hợp lệ'), findsOneWidget);

    await tester.enterText(emailField, 'abc.com');
    await tester.tap(checkButton);
    await tester.pump();
    expect(find.text('Email không đúng định dạng'), findsOneWidget);

    await tester.enterText(emailField, 'abc@gmail.com');
    await tester.tap(checkButton);
    await tester.pump();
    expect(find.text('Bạn đã nhập email hợp lệ'), findsOneWidget);
  });
}
