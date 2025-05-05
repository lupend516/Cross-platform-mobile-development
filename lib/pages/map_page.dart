// lib/pages/map_page.dart
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(leading: BackButton(), title: SizedBox()),
    body: Container(
      color: Colors.black54,
      child: Center(child: Icon(Icons.map, size: 120, color: Colors.white24)),
    ),
  );
}
