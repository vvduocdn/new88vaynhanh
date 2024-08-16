import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/component/widgets/bottom_nav_bar.dart';
import 'package:new88_vaynow/component/widgets/tabbar_item.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/utils/logger_service.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/view/auth/add_vay_now.dart';
import 'package:new88_vaynow/view/home/home_screen.dart';
import 'package:new88_vaynow/view/loan/loan_screen.dart';
import 'package:new88_vaynow/view/my_loan/my_loan_screen.dart';
import 'package:new88_vaynow/view/widget/popup_comfirm.dart';
import 'package:new88_vaynow/view_model/home_bloc/home_bloc.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

final StreamController streamConnectActivity = StreamController<bool>.broadcast();
final StreamController streamTabBottomNavBar = StreamController<int>.broadcast();

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final NavigatorGlobalContextHelper navigationService = locator.get<NavigatorGlobalContextHelper>();
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
    BlocProvider.of<HomeBloc>(context).add(RandomMoney());
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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                _tabs[_currentIndex],
                // Positioned(
                //     bottom: 45,
                //     right: 5,
                //     child: GestureDetector(
                //         onTap: () {
                //           if (state.userInfo?.phone != null &&
                //               state.userInfo!.phone!.isNotEmpty) {
                //             PopupComfirm.showPopModelDialog(
                //                 context,
                //                 () async {},
                //                 'Thông báo',
                //                 'Bạn đã sử dụng gói vay now đ 30,000,000.\nVui lòng theo dõi gói vay now nha!!',
                //                 'Đóng');
                //             return;
                //           }
                //           Navigator.push(
                //               context,
                //               CupertinoPageRoute(
                //                   builder: (_) => const AddVayNow()));
                //         },
                //         child: Assets.images.voucher
                //             .image(width: 100, height: 100)))
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
      },
    );
  }
}
