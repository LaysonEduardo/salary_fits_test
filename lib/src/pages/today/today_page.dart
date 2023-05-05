import 'package:flutter/material.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Today Page')),
      body: Center(
        child: Text('Test'),
      ),
    );
  }
}
