import 'package:flutter/material.dart';

class Sumary extends StatefulWidget {
  final String? descricao;

  const Sumary({Key? key, this.descricao}) : super(key: key);

  @override
  State<Sumary> createState() => _SumaryState();
}

class _SumaryState extends State<Sumary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black87,
            ),
            alignment: Alignment.topCenter,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sumary',
                        style: TextStyle(
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      widget.descricao!,
                      style: const TextStyle(
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white54),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
