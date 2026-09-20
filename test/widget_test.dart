
import 'package:flutter_test/flutter_test.dart';
import 'package:azkar/app.dart';

void main() {
  testWidgets('shows the Azkar home screen', (tester) async {
    await tester.pumpWidget(const AzkarApp());

    await tester.pumpAndSettle();

    expect(find.textContaining('Morning Azkar'), findsOneWidget);
    expect(find.textContaining('Evening Azkar'), findsOneWidget);
    expect(find.textContaining('Dua'), findsOneWidget);
  });
}

