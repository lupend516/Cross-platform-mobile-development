// lib/pages/account_page.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import 'package:flutter/services.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: darkBg,
    body: Center(
      child: ElevatedButton(
        onPressed: () => _showLoginPhone(c),
        child: Text('Login'),
      ),
    ),
  );

  void _showLoginPhone(BuildContext c) {
    showDialog(
      context: c,
      builder:
          (_) => Dialog(
            backgroundColor: darkBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Access to purchased tickets',
                    style: TextStyle(color: textLight),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Phone number'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(c);
                      _showLoginCode(c);
                    },
                    child: Center(child: Text('Continue')),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _showLoginCode(BuildContext c) {
    showDialog(
      context: c,
      builder:
          (_) => Dialog(
            backgroundColor: darkBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Enter the password from the SMS',
                    style: TextStyle(color: textLight),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (_) => SizedBox(
                        width: 50,
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(counterText: ''),
                          maxLength: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(c);
                    },
                    child: Center(child: Text('Login')),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(c);
                      _showLoginPhone(c);
                    },
                    child: Text(
                      'Change number',
                      style: TextStyle(color: textLight),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend (0:59)',
                      style: TextStyle(color: textLight),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
