import 'package:flutter/material.dart';
import 'package:mybank/components/container.dart';
import 'package:mybank/models/name_change.dart';
import 'package:mybank/screens/contacts_list.dart';
import 'package:mybank/screens/name_container.dart';
import 'package:mybank/screens/transactions_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardContainer extends BlocContainer {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit(''),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.verified_user,
                    color: Theme.of(context).colorScheme.primary, size: 50.0),
                Text(
                  'myBank',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            BlocBuilder<NameCubit, String>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: state,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            children: [
              _FeatureItem('Transfer', Icons.monetization_on,
                  onClick: () => _showContactList(context)),
              _FeatureItem('Transaction Feed', Icons.description,
                  onClick: () => _showTransactionsList(context)),
              _FeatureItem('Change name', Icons.person_outline,
                  onClick: () => _showChangeName(context)),
            ],
          ),
        ),
      ),
    );
  }

  void _showContactList(BuildContext context) {
    push(context, const ContactListContainer());
  }

  _showChangeName(BuildContext blocContext) {
    Navigator.of(blocContext).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<NameCubit>(blocContext),
          child: const NameContainer(),
        ),
      ),
    );
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function? onClick;

  const _FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => onClick!(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: 150,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.white, size: 30.0),
                Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
