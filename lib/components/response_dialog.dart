import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData? icon;
  final Color colorIcon;

  // ignore: use_key_in_widget_constructors
  const ResponseDialog(
      {this.title = "",
        this.message = "",
        this.buttonText = "Ok",
        this.icon,
        this.colorIcon = Colors.black});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Visibility(
            child: Text(title,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            visible: title.isNotEmpty),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Icon(icon, size: 64, color: colorIcon)),
                  visible: icon != null),
              Visibility(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      child: Text(message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24))),
                  visible: message.isNotEmpty)
            ]),
        actions: [
          TextButton(
              child: Text(buttonText.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              onPressed: () => Navigator.pop(context))
        ]);
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  // ignore: use_key_in_widget_constructors
  const SuccessDialog(this.message,
      {this.title = "Success", this.icon = Icons.done});

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
        title: title, message: message, icon: icon, colorIcon: Colors.green);
  }
}

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  // ignore: use_key_in_widget_constructors
  const FailureDialog(this.message,
      {this.title = "Failure", this.icon = Icons.warning});

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
        title: title, message: message, icon: icon, colorIcon: Colors.red);
  }
}