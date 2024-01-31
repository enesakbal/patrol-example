import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_example/main.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  testWidgets(
    'counter is incremented when plus button is tapped',
    (WidgetTester tester) async {
      PatrolTester $ = PatrolTester(
        tester: tester,
        config: const PatrolTesterConfig(),
      );
      await $.pumpWidget(const MainApp());

      expect($('0'), findsOneWidget);
      expect($('-1'), findsNothing);

      await $(FloatingActionButton).tap();

      expect($('0'), findsNothing);
      expect($('1'), findsOneWidget);
    },
  );
}
