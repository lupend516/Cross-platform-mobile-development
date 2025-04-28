import 'package:flutter/material.dart';

/// === 1. MapScreen (вкладка «Карта») ===
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(
            context, CitySelectionScreen.routeName),
        child: Text('Выбрать город'),
      ),
    );
  }
}

/// Модальный экран выбора города
class CitySelectionScreen extends StatelessWidget {
  static const routeName = '/city';
  final List<String> cities = [
    'Almaty', 'Shymkent', 'Astana', 'Karaganda',
    'Kokshetau', 'Pavlodar', 'Oskemen', 'Semey',
    'Kostanay', 'Oral',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2633),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Color(0xFF2C333F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: cities.length,
              separatorBuilder: (_, __) => Divider(color: Colors.white12),
              itemBuilder: (_, i) {
                final city = cities[i];
                return ListTile(
                  title: Text(city, style: TextStyle(color: Colors.white)),
                  trailing: city == 'Astana'
                      ? Icon(Icons.check, color: Colors.white)
                      : null,
                  onTap: () => Navigator.pop(context, city),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// === 2. SessionsScreen (вкладка «Сессии») ===
class SessionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2633),
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2633),
        elevation: 0,
        title: Text('Сессии'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // здесь можно реализовать фильтры (дата, сортировка, toggle)
          // а затем ListView.builder с карточками сессий точно по макету
          Expanded(
            child: Center(
              child: Text(
                'Ваш список сессий',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// === 3. AccountScreen (вкладка «Аккаунт») ===
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () =>
            Navigator.pushNamed(context, AuthScreen.routeName),
        child: Text('Войти'),
      ),
    );
  }
}

/// Экран логина (модалка)
class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2633),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              'Access to purchased tickets',
              style: TextStyle(color: Colors.white54),
            ),
            SizedBox(height: 16),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Phone number',
                hintStyle: TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Color(0xFF2C333F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, PayScreen.routeName),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Экран успешной оплаты / подтверждения
class PayScreen extends StatelessWidget {
  static const routeName = '/pay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2633),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text('Успешно!', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Инфо по заказу
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Бильярд для друзей',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 8),
            // … тут ваше детали заказа (Place, Date, Hall, Seats)
            SizedBox(height: 24),
            // индикатор шагов (dots)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == 4 ? Colors.orangeAccent : Colors.white24,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            Spacer(),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Phone number',
                hintStyle: TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Color(0xFF2C333F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Text('Продолжить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
