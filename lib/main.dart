import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/myapp.dart';
import 'package:flutter_testing/service_locator.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

