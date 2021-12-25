import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String _message;

  const ErrorView(this._message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Processing"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: '😩\n\n',
                    style: TextStyle(fontSize: 64),
                  ),
                  TextSpan(
                    text: _message,
                    style: const TextStyle(fontSize: 24),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
