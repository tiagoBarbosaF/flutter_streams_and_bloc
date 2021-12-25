import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BlocContainer extends StatelessWidget {
  const BlocContainer({Key? key}) : super(key: key);
}

void push(BuildContext context, BlocContainer container){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => container,
    ),
  );
}