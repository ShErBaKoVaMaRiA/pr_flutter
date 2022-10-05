import 'package:flutter/material.dart';
import 'package:pr_flutter_1/meditate2_screen.dart';
import 'package:pr_flutter_1/meditate_screen.dart';
import 'package:pr_flutter_1/welcome_screen.dart';

void main() {
  runApp(const MyApp()); //запуск проекта
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Практическая №1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: PageView(children: const [
          WelcomeScreen(), //экран 1
          MeditateScreen(), //экран 2
          Meditate2_Screen(), //экран 3
        ]));
  }
}
