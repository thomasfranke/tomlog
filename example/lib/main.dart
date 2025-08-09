import 'dart:developer';

import 'package:example/categories.dart';
import 'package:example/class.dart';
import 'package:flutter/material.dart';
import 'package:tomlog/tomlog.dart';

void main() {
  log('1');
  TomLog.init(printOnlyCritical: false, printTimeStamp: false);
  log('2');
  TomLog().w("Aplicativo iniciado");
  log('3');
  TomLog().w("Aplicativo iniciado2", category: TomLogCategories.api);

  // inspect(TomLog().history);

  TomLog().printHistory();
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
