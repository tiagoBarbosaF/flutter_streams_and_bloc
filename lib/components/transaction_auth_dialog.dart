import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  // ignore: use_key_in_widget_constructors
  const TransactionAuthDialog({required this.onConfirm});

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Password",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary)),
      content: Padding(
        padding: const EdgeInsets.only(top: 64, bottom: 16),
        child: TextField(
          controller: _passwordController,
          autofocus: true,
          obscureText: true,
          maxLength: 4,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 64, letterSpacing: 32),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: InputBorder.none),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("cancel".toUpperCase(),
              style:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
          child: Text("confirm".toUpperCase(),
              style:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}