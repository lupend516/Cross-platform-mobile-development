// lib/widgets/modals.dart
import 'package:flutter/material.dart';
import '../theme.dart';

Future<String?> showCitySelector(
  BuildContext c,
  List<String> cities,
  String selected,
) {
  return showModalBottomSheet<String>(
    context: c,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (_) => DraggableScrollableSheet(
          initialChildSize: 0.6,
          builder:
              (_, ctl) => Container(
                decoration: BoxDecoration(
                  color: darkBg,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: cities.length,
                        separatorBuilder:
                            (_, i) => Divider(color: Colors.white12),
                        itemBuilder: (_, i) {
                          final name = cities[i];
                          return ListTile(
                            title: Text(name),
                            trailing:
                                name == selected
                                    ? Icon(Icons.check, color: accent)
                                    : null,
                            onTap: () => Navigator.pop(c, name),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
        ),
  );
}

Future<void> showSortModal(BuildContext c) {
  String sortBy = 'Time';
  String order = 'Ascending';
  return showModalBottomSheet(
    context: c,
    backgroundColor: darkBg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder:
        (_) => Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Sort by', style: TextStyle(color: textLight)),
              ),
              ...['Time', 'Distance', 'Price'].map(
                (o) => ListTile(
                  title: Text(o),
                  leading:
                      sortBy == o ? Icon(Icons.check, color: accent) : null,
                  onTap: () => sortBy = o,
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Order', style: TextStyle(color: textLight)),
              ),
              ...['Ascending', 'Descending'].map(
                (o) => ListTile(
                  title: Row(
                    children: [
                      Text(o),
                      if (o == 'Ascending')
                        Icon(Icons.arrow_upward, size: 16, color: textLight),
                      if (o == 'Descending')
                        Icon(Icons.arrow_downward, size: 16, color: textLight),
                    ],
                  ),
                  leading: order == o ? Icon(Icons.check, color: accent) : null,
                  onTap: () => order = o,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(c),
                child: Center(child: Text('Apply')),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
  );
}
