import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:new88_vaynow/component/bottom_navigation.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/services/api/supa_base_api.dart';
import 'package:new88_vaynow/utils/logger_service.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new88_vaynow/view/home/home_ads.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final String? role = dotenv.env['ROLE']!;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();

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

    if (role == 'user') {
      _initApp();
    }
  }

  Future<void> _initApp() async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        if (mounted) {
          Future.delayed(Duration(seconds: Platform.isIOS ? 0 : 3), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavigation(),
              ),
            );
          });
        }
        return;
      }
      final response = await SupaBaseApi().getStatusApp();
      if (result.isNotEmpty) {
        bool status = response.first['status_link'];
        if (status && mounted) {
          Future.delayed(Duration(seconds: Platform.isIOS ? 0 : 3), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePageBody(),
              ),
            );
          });
        } else {
          if (mounted) {
            Future.delayed(Duration(seconds: Platform.isIOS ? 0 : 0), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavigation(),
                ),
              );
            });
          }
        }
      }
    } catch (e) {
      printE(e.toString());
    } finally {}
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
              Assets.images.icLauncher.image(width: 80, height: 80),
              spaceH4,
              Text(
                'New88 Vay uy tin',
                style: Styles.n18w7
                    .copyWith(color: context.colors.main.withOpacity(0.5)),
              )
            ],
          ),
        ));
  }
}
