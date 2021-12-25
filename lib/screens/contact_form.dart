import 'package:flutter/material.dart';
import 'package:mybank/database/dao/contact_dao.dart';
import 'package:mybank/models/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: _fullNameController,
                  autofocus: true,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
                TextField(
                  controller: _accountNumber,
                  decoration: const InputDecoration(
                    labelText: 'Account number',
                  ),
                  style: const TextStyle(fontSize: 24.0),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  final String fullName = _fullNameController.text;
                  final int? accountNumber =
                      int.tryParse(_accountNumber.text);
                  final Contact newContact =
                      Contact(0, fullName, accountNumber);
                  _contactDao.save(newContact).then(
                        (id) => Navigator.pop(context),
                      );
                },
                child: const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
