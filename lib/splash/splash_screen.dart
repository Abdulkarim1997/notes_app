import 'package:flutter/material.dart';

import '../../shard/components/components.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () => navigateAndFinish(context, HomeScreen()),
    );
  }
}
