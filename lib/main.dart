import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybank/screens/counter_container.dart';
import 'package:mybank/screens/name_container.dart';

import 'components/theme.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyBankApp()),
    blocObserver: LogObserver(),
  );
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} > $change');
    super.onChange(bloc, change);
  }
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
