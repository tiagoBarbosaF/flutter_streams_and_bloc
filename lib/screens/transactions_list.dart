import 'package:flutter/material.dart';
import 'package:mybank/components/centered_message.dart';
import 'package:mybank/components/progress.dart';
import 'package:mybank/http/webclients/transaction_webclient.dart';
import 'package:mybank/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _webClient = TransactionWebClient();

  TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _webClient.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress(message: "Loading ...");
              // ignore: dead_code
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction> transactions =
                    snapshot.data as List<Transaction>;
                if (transactions.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on,
                              color: Theme.of(context).colorScheme.primary),
                          title: Text(
                            transaction.contact.fullName,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          subtitle: Text(
                            'Account: ${transaction.contact.accountNumber.toString()}',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          trailing: Text(
                            NumberFormat.simpleCurrency(
                                    name: "BRL", decimalDigits: 2)
                                .format(transaction.value),
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions.length,
                    reverse: true,
                    shrinkWrap: true,
                  );
                }
              }
              return const CenteredMessage(
                'No transaction found',
                icon: Icons.warning_amber_rounded,
              );
              // ignore: dead_code
              break;
          }
          return const CenteredMessage('Unknown error');
        },
      ),
    );
  }
}
