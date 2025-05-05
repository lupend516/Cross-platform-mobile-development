// lib/pages/loading_page.dart
import 'package:flutter/material.dart';
import '../theme.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: darkBg,
    body: Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(textLight),
        ),
      ),
    ),
  );
}
