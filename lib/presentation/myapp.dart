import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/state/ModelCountController.dart';
import 'package:flutter_testing/presentation/ui/home.dart';
import 'package:flutter_testing/service_locator.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ModelCountController(sl()),
        child: const MyHomePage(),
      ),
    );
  }
}
