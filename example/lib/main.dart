import 'package:flutter/material.dart';
import 'package:tomlog/tomlog.dart';

void main() {
  TomLog.log("App iniciado", level: LogLevel.info);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TomLog Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('TomLog Example')),
        body: const Center(child: Text('Veja o terminal para os logs')),
      ),
    );
  }
}
