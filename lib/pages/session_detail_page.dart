// lib/pages/session_detail_page.dart
import 'package:flutter/material.dart';
import '../theme.dart';

class SessionDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext c) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Бильярд'),
        bottom: TabBar(tabs: [Tab(text: 'About'), Tab(text: 'Активности')]),
      ),
      body: TabBarView(
        children: [
          _AboutTab(),
          Center(
            child: Text(
              'Activities content',
              style: TextStyle(color: textLight),
            ),
          ),
        ],
      ),
    ),
  );
}

class _AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext c) => ListView(
    padding: EdgeInsets.all(16),
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://picsum.photos/400/200', // заменишь на свой URL
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '5',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text('Людей согласились', style: TextStyle(color: textLight)),
            ],
          ),
          Column(
            children: [
              Text(
                '7.9',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text('Рейтинг', style: TextStyle(color: textLight)),
            ],
          ),
        ],
      ),
      SizedBox(height: 16),
      Text(
        'Играем в бильярд, AITUSA. Призы есть, приходить с хорошим настроением.',
        style: TextStyle(color: textLight),
      ),
      SizedBox(height: 16),
      ...[
        ['Certificate', '16+'],
        ['Runtime', '04:00'],
        ['When', '07.04.2025, 14:40'],
      ].map(
        (e) => Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: Text(e[0], style: TextStyle(color: textLight)),
              ),
              Text(e[1]),
            ],
          ),
        ),
      ),
      SizedBox(height: 24),
      ElevatedButton(
        onPressed: () => Navigator.pop(c),
        child: Text('Select session'),
        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
      ),
    ],
  );
}
