import 'package:appinio_code_challenge/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: MainPage.routeName,
        routes: <String, WidgetBuilder>{
          MainPage.routeName: (BuildContext context) => const MainPage()
        });
  }
}
