import 'dart:developer';

import 'package:example/class.dart';
import 'package:flutter/material.dart';
import 'package:tomlog/tomlog.dart';

void main() {
  log('1');
  TomLog.init(printOnlyCritical: false);
  log('2');
  TomLog().w("Aplicativo iniciado");
  log('3');
  TomLog().w("Aplicativo iniciado2");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SampleClass().sampleMethod();
    return MaterialApp(
      title: 'TomLog Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('TomLog Example')),
        body: const Center(child: Text('Veja o terminal para os logs')),
      ),
    );
  }
}
