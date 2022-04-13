import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigState();
}

class _ConfigState extends State<ConfigPage> {
  late int indexscreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.greenAccent),
        child: SafeArea(child: ListView()),
      ),
    );
  }
}
