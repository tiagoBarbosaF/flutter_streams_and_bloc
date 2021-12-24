import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  void changeName(String name) => emit(name);
}

class NameContainer extends StatelessWidget {
  const NameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit('Tiago'),
      child: NameView(),
    );
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  NameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Name'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Desired name'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  context.read<NameCubit>().changeName(name);
                  // Navigator.pop(context);
                },
                child: const Text('Changed'),
              ),
            ),
          ),
          BlocBuilder<NameCubit, String>(
            builder: (context, state) {
              return Text(
                context.read<NameCubit>().state,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
