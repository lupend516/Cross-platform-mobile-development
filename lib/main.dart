// lib/main.dart
import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/account_page.dart';
import 'pages/sessions_page.dart';
import 'pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext _) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    darkTheme: kDarkTheme,
    themeMode: ThemeMode.dark,
    home: MainScreen(),
  );
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1; // по умолчанию «Sessions»
  final _pages = [AccountPage(), SessionsPage(), MapPage()];

  @override
  Widget build(BuildContext c) => Scaffold(
    body: _pages[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: darkBg,
      selectedItemColor: accent,
      unselectedItemColor: textLight,
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Sessions'),
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
      ],
    ),
  );
}
