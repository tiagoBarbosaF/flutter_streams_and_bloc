// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybank/screens/dashboard.dart';
import 'package:device_preview/device_preview.dart';

import 'components/theme.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const MyBankApp(),
      ),
    ),
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
      home: const DashboardContainer(),
    );
  }
}
