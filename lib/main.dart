import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic.dart';
import 'UI.dart';

void main() => runApp(
    ChangeNotifierProvider(
        create: (_) => Logic(),
        child: MyApp(),
    )

);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(),
    );
  }
}
