import 'package:flutter/material.dart';

import 'components/theme.dart';
import 'screens/counter_container.dart';

void main() {
  runApp(const MyBankApp());
}

class MyBankApp extends StatelessWidget {
  const MyBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mybankTheme,
      home: const CounterContainer(),
    );
  }
}
