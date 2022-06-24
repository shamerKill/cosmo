import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/main.dart';

void main() {
  testWidgets('start pages animation', (WidgetTester tester) async {
    await tester.pumpWidget(const PlugRoot());
    expect(find.text("cosmo wallet"), findsOneWidget);
    expect(find.text("L\r\r\r\r\rI\r\r\r\r\rN\r\r\r\r\rK"), findsOneWidget);
  });
}