import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MainPage Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
      title: new Text('Test Task'),
    ))));

    expect(find.text('Test Task'), findsOneWidget);

    await tester
        .pumpWidget(MaterialApp(home: Center(child: Text('Hey there'))));

    expect(find.text('Hey there'), findsOneWidget);
  });

  testWidgets('SecondScreen Test', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(appBar: AppBar(title: Text('Info')))));
    expect(find.text('Info'), findsOneWidget);

    final String infoText =
        "You can see the test task from Solid Software. You, as a user, can click anywhere on the screen and the background will be changed to a random color. Good luck:)";
    await tester.pumpWidget(MaterialApp(
        home: Container(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        children: <Widget>[
          Text(infoText,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black87, fontSize: 30),
              maxLines: 7),
        ],
      ),
    )));

    expect(find.text(infoText), findsOneWidget);
  });
}
