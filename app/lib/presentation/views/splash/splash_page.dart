import 'package:boobook/presentation/views/home/home_page.dart';
import 'package:boobook/presentation/views/sign_in/sign_in_landing_page.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/sign_in.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashPageBuilder(
      home: const HomePage(),
      landing: const SignInLandingPage(),
    );
  }
}
