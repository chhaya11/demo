import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swazei/app/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'DM Sans'
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {'/splash': (context) => Splash(),
      });
  }
}

