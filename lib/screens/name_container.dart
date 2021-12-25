import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybank/components/container.dart';
import 'package:mybank/models/name_change.dart';

class NameContainer extends BlocContainer {
  const NameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  NameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;

    BlocBuilder<NameCubit, String>(
      builder: (context, state){
        return Text(state);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Desired name'),
              autofocus: true,
              autocorrect: true,
              enableSuggestions: true,
              enableInteractiveSelection: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text;
                    context.read<NameCubit>().changeName(name);
                    Navigator.pop(context);
                  },
                  child: const Text('Change name'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
