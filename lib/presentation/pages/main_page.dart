import 'package:appinio_code_challenge/presentation/pages/resume_tab.dart';
import 'package:appinio_code_challenge/presentation/pages/weather_tab.dart';
import 'package:flutter/material.dart';

/// main page of the application
class MainPage extends StatelessWidget {
  /// constructor
  const MainPage({Key? key}) : super(key: key);
  static const String routeName = 'main';

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.sunny_snowing)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
            title: const Text('Appinino Code Challenge'),
          ),
          body: const TabBarView(
            children: [
              WeatherTab(),
              ResumeTab(),
            ],
          ),
        ),
      );
}
