import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:azkar/main.dart';
import 'package:azkar/providers/adhkar_provider.dart';

void main() {
  testWidgets('shows the Morning Adhkar home screen', (tester) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});

    final provider = AdhkarProvider();
    await provider.load();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: provider,
        child: const AzkarApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('የጠዋት አዝካር'), findsOneWidget);
    expect(find.text('Ayat al-Kursi'), findsOneWidget);
  });
}
