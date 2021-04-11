import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testapptest/Page/Main/main.dart';
import 'package:testapptest/Page/add_todo/add_page.dart';
import 'package:testapptest/Page/Main/main_model.dart';
import 'package:testapptest/utils/flavor.dart';
import 'package:testapptest/utils/utility.dart';

void mainDelegate(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runZoned(() {
    Utility.init().then((e) {
      runApp(FlavorProvider(
        flavor: flavor,
        child: MyApp(),
      ));
    });
  });
}

void main() async {
  //mainがないとbitriseでエラーが起きるので追加しておく。
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        SystemUiOverlayStyle.dark.systemNavigationBarDividerColor,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
