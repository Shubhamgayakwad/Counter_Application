import 'package:flutter/material.dart';
import 'package:hello_flutter/providers/counter.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome'),
          ),
          body: Center(
              child: Text(
            context.watch<Counter>().counter.toString(),
            style: const TextStyle(fontSize: 35),
          ))),
    );
  }
}
