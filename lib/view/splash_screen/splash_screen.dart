import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vaynow_flutter/component/bottom_navigation.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/gen/assets.gen.dart';
import 'package:vaynow_flutter/utils/spaces.dart';
import 'package:vaynow_flutter/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // RqPermission().determinePosition();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
    Future.delayed(Duration(seconds: Platform.isIOS ? 0 : 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.hF05D0E,
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: context.colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.iconApp.image(width: 80, height: 80),
              spaceH4,
              Text(
                'VayNow',
                style: Styles.n18w7
                    .copyWith(color: context.colors.main.withOpacity(0.5)),
              )
            ],
          ),
        ));
  }
}
