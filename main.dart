import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayText = "Привет, мир!";
  Color _bgColor = Colors.white;

  void _addText() {
    setState(() {
      _displayText += " Добавлено!";
    });
  }

  void _removeText() {
    setState(() {
      if (_displayText.length > 0) {
        _displayText = _displayText.replaceFirst(" Добавлено!", "");
      }
    });
  }

  void _changeColor() {
    setState(() {
      _bgColor = _bgColor == Colors.white ? Colors.lightBlueAccent : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Text('Мое приложение'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayText,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addText,
              child: Text('Добавить текст'),
            ),
            ElevatedButton(
              onPressed: _removeText,
              child: Text('Удалить текст'),
            ),
            ElevatedButton(
              onPressed: _changeColor,
              child: Text('Изменить цвет'),
            ),
          ],
        ),
      ),
    );
  }
}
