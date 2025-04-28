import 'package:flutter/material.dart';
import 'screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = Locale('ru');
  int _selectedIndex = 1; // по умолчанию – «Сессии»

  final List<Widget> _pages = [
    MapScreen(),
    SessionsScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavApp',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      locale: _locale,
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Карта',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Сессии',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Аккаунт',
            ),
          ],
        ),
      ),
      // именованные маршруты для модалей/отдельных экранов
      routes: {
        CitySelectionScreen.routeName: (_) => CitySelectionScreen(),
        AuthScreen.routeName: (_) => AuthScreen(),
        PayScreen.routeName: (_) => PayScreen(),
      },
    );
  }
}
