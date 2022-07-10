import 'package:appinio_code_challenge/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

/// Splash page
class SplashPage extends StatelessWidget {
  /// constructor
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacementNamed(context, MainPage.routeName);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blue,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'This is a Test app for'),
                        TextSpan(
                            text: ' Appinio ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'code challenge.'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Powered by. Samin Sheyda",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Image.asset('assets/logo.png'),
          ),
        ],
      )),
    );
  }
}
