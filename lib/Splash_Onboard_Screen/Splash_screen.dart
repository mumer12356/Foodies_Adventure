import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration:const Duration(seconds: 5) );
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Lottie.asset('assets/Animation/Foodies.json',height: 400,
            //alignment: Alignment.topCenter,
            controller: _controller,
              onLoaded: (compos){
              _controller
              ..duration=compos.duration
              ..forward().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OnboardingScreen(),));
              });
              }
            ),
          ),
          const Text('My food App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
        ],
      ),
    );
  }
}

