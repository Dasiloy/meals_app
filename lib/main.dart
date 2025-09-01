import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/theme/theme.dart';
import 'package:meals_app/screens/tab_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return _App();
  }
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const TabScreen();
  }
}
