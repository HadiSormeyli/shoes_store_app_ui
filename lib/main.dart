import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store_app/presentation/providers/theme_notifier.dart';
import 'package:shoes_store_app/presentation/screens/welcome_screen.dart';

import 'config/config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeNotifier themeNotifier = ThemeNotifier();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeNotifier.darkTheme =
        await themeNotifier.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeNotifier;
      },
      child: Consumer<ThemeNotifier>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(themeNotifier.darkTheme, context),
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
