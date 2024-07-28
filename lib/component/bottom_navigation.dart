import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/component/widgets/bottom_nav_bar.dart';
import 'package:vaynow_flutter/component/widgets/tabbar_item.dart';
import 'package:vaynow_flutter/gen/assets.gen.dart';
import 'package:vaynow_flutter/services/di/locator.dart';
import 'package:vaynow_flutter/utils/logger_service.dart';
import 'package:vaynow_flutter/utils/navigator_global_context_helper.dart';
import 'package:vaynow_flutter/view/history/loan_screen.dart';
import 'package:vaynow_flutter/view/home/home_screen.dart';
import 'package:vaynow_flutter/view/loan/promotion_screen.dart';
import 'package:vaynow_flutter/view_model/user_bloc/user_bloc.dart';

final StreamController streamConnectActivity =
    StreamController<bool>.broadcast();
final StreamController streamTabBottomNavBar =
    StreamController<int>.broadcast();

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();
  final List<Widget> _tabs = [
    const HomeScreen(),
    const LoanScreen(),
    const MyLoanScreen(),
  ];
  bool isConnectInternet = true;

  @override
  void initState() {
    printE('BottomNavigation');
    streamConnectActivity.stream.listen((data) {
      isConnectInternet = data;
      setState(() {});
    });
    streamTabBottomNavBar.stream.listen((data) {
      _currentIndex = data;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    streamTabBottomNavBar.close();
    streamConnectActivity.close();
    printE('dispose BottomNavigation');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = context.watch<UserBloc>().state.isLoggedIn;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _tabs[_currentIndex],
            Positioned(
                bottom: 45,
                right: 5,
                child: Assets.images.voucher.image(width: 100, height: 100))
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavBar(
            icons: [
              TabbarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: context.colors.main,
                    size: 24,
                  ),
                  label: 'Home'),
              TabbarItem(
                  icon: Icon(
                    Icons.monetization_on_outlined,
                    color: context.colors.main,
                    size: 24,
                  ),
                  label: 'Loan'),
              TabbarItem(
                  icon: Icon(
                    Icons.event_note_outlined,
                    color: context.colors.main,
                    size: 24,
                  ),
                  label: 'My Loans'),
            ],
            activeIcons: [
              TabbarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: context.colors.hF05D0E,
                    size: 24,
                  ),
                  label: 'Home'),
              TabbarItem(
                  icon: Icon(
                    Icons.monetization_on_outlined,
                    color: context.colors.hF05D0E,
                    size: 24,
                  ),
                  label: 'Loan'),
              TabbarItem(
                  icon: Icon(
                    Icons.event_note_outlined,
                    color: context.colors.hF05D0E,
                    size: 24,
                  ),
                  label: 'My Loans'),
            ],
            selectedIndex: _currentIndex,
            onTap: (index) {
              // if (index == 1 || index == 2) {
              // if (!isLogin) {
              //   showModalBottomSheet<void>(
              //     context: navigationService.getCurrentContext,
              //     backgroundColor: Colors.transparent,
              //     isScrollControlled: true,
              //     useSafeArea: true,
              //     builder: (BuildContext context) {
              //       return const PopupLogin();
              //     },
              //   );
              //   return;
              // }
              // }
              FocusScope.of(context).unfocus();
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ));
  }
}
