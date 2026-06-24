import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/adhkar_provider.dart';
import 'screens/home_screen.dart';
import 'services/notification_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final adhkarProvider = AdhkarProvider();
  await adhkarProvider.load();

  try {
    await NotificationService.instance.initialize();
    await NotificationService.instance.scheduleDailyMorningReminder();
  } catch (_) {
    // Notification setup is best-effort so the app still opens cleanly.
  }

  runApp(
    ChangeNotifierProvider.value(
      value: adhkarProvider,
      child: const AzkarApp(),
    ),
  );
}

class AzkarApp extends StatelessWidget {
  const AzkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'የጠዋት አዝካር',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
