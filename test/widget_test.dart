// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:oishii_project/main.dart';
import 'package:oishii_project/screens/home_screen.dart'; // ✅ Update import

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that HomeScreen is displayed
    expect(find.byType(HomeScreen), findsOneWidget); // ✅ Update test
  });
}