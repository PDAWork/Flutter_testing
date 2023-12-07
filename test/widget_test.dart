// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/domain/model/count_model.dart';
import 'package:flutter_testing/domain/repository/count_repository.dart';

import 'package:flutter_testing/presentation/state/ModelCountController.dart';
import 'package:flutter_testing/presentation/ui/home.dart';
import 'package:provider/provider.dart';

class FakeSharedPreferences implements CountRepository {
  CountModel model = CountModel(count: 0);

  @override
  CountModel getCountModel() {
    return model;
  }

  @override
  Future<bool> setCountModel(CountModel model) async {
    model = model;
    return true;
  }
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => ModelCountController(FakeSharedPreferences()),
          child: const MyHomePage(),
        ),
      ),
    );

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await tester.drag(find.byType(ListView), const Offset(0.0, -300.0));

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
