import 'package:example/categories.dart';
import 'package:example/class.dart';
import 'package:flutter/material.dart';
import 'package:tomlog/tomlog.dart';

void main() {
  TomLog.init(
    printOnlyCritical: false,
    printTimeStamp: false,
    printClassName: false,
    printFilename: true,
    printLogLevel: true,
  );
  TomLog().w("Aplicativo iniciado");
  TomLog().w("API Inicializada", category: TomLogCategories.api);

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
