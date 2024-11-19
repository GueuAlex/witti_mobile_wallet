import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../config/constantes.dart';
import '../screens/home/home.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _goToHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constantes.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/witti.jpg',
              width: 110,
            ),
            const Gap(8.0),
            LoadingAnimationWidget.flickr(
              leftDotColor: const Color.fromARGB(255, 92, 92, 208),
              rightDotColor: const Color(0xFFEA3799),
              size: 35,
            ),
          ],
        ),
      ),
    );
  }

  void _goToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        WittiHome.routeName,
        (route) => false,
      );
    }
  }
}
