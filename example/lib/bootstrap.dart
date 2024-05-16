import 'package:flutter/material.dart';
import 'package:ui_extensions_demo/screens/home_scaffold.dart';

void bootStrap(ThemeMode themeMode) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(themeMode: themeMode),
  );
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.light:
        debugPrint('💡 ThemeMode.light');
        break;
      case ThemeMode.dark:
        debugPrint('🌛 ThemeMode.dark');
        break;
      case ThemeMode.system:
        debugPrint('📲 ThemeMode.system');
        break;
    }
    return MaterialApp(
      title: 'Flutter Demo ${themeMode.name}',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      localizationsDelegates: const [],
      home: HomeScaffold(title: 'Flutter Demo ${themeMode.name} mode'),
    );
  }
}
