import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;

  const Progress({Key? key,
    this.message = 'Loading',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              message,
              style: const TextStyle(fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
          ),
          const CircularProgressIndicator(
            strokeWidth: 5.0,
          ),
        ],
      ),
    );
  }
}

class ProgressView extends StatelessWidget {
  const ProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Processing"),
      ),
      body: const Progress(
        message: '😣🤞\n\nSending...',
      ),
    );
  }
}
