import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/theme/theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CategoriesScreen();
  }
}
