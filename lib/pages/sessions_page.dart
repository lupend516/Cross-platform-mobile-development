// lib/pages/sessions_page.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/modals.dart';
import 'session_detail_page.dart';

class SessionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8),
        child: CircleAvatar(backgroundColor: Colors.white24),
      ),
      title: const Text('Активность'),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.location_on), onPressed: () {}),
      ],
    ),
    body: Column(
      children: [
        // фильтр
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap:
                    () => showCitySelector(c, [
                      'Almaty',
                      'Astana',
                      'Karaganda',
                    ], 'Astana'),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: textLight),
                    const SizedBox(width: 8),
                    const Text('April, 7', style: TextStyle(color: textLight)),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => showSortModal(c),
                child: Row(
                  children: [
                    const Icon(Icons.sort, color: textLight),
                    const SizedBox(width: 8),
                    const Text('Time ↑', style: TextStyle(color: textLight)),
                  ],
                ),
              ),
              const Spacer(),
              Switch(value: false, onChanged: (_) {}),
            ],
          ),
        ),
        // хедер для колонок
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Time', style: TextStyle(color: textLight)),
              Text('Adult', style: TextStyle(color: textLight)),
              Text('Child', style: TextStyle(color: textLight)),
              Text('Student', style: TextStyle(color: textLight)),
              Text('VIP', style: TextStyle(color: textLight)),
            ],
          ),
        ),
        const Divider(color: Colors.white12),
        // список
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: 7,
            separatorBuilder: (_, i) => const Divider(color: Colors.white12),
            itemBuilder: (_, i) {
              final time =
                  [
                    '14:40',
                    '15:10',
                    '15:40',
                    '16:05',
                    '16:15',
                    '15:10',
                    '16:45',
                  ][i];
              final lang = ['Рус', 'Рус', 'Eng', 'Каз', 'Рус', 'Рус', 'Рус'][i];
              final title =
                  [
                    'Бильярд',
                    'Футбол',
                    'Бассейн',
                    'Мафия',
                    'Крыша',
                    'Коттедж',
                    'Баскетбол',
                  ][i];
              return ListTile(
                onTap:
                    () => Navigator.push(
                      c,
                      MaterialPageRoute(builder: (_) => SessionDetailPage()),
                    ),
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          lang,
                          style: const TextStyle(
                            fontSize: 12,
                            color: textLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Expanded(child: Text(title)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
