import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view/add_vay_now.dart';
import 'package:new88_vaynow/view_model/app_mode_bloc/app_mode_bloc.dart';
import 'package:new88_vaynow/view_model/app_mode_bloc/app_mode_state.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class MyLoanScreen extends StatefulWidget {
  const MyLoanScreen({super.key});

  @override
  State<MyLoanScreen> createState() => _MyLoanScreenState();
}

class _MyLoanScreenState extends State<MyLoanScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.canRequestFocus;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppModeBloc, AppModeState>(
      builder: (context, appModeState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: context.colors.hF05D0E,
                body: Container(
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: context.colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFFFE5F06)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 30,
                            ),
                            Text(
                              'Vay Uy Tín',
                              style: Styles.n18w7
                                  .copyWith(color: context.colors.white),
                            ),
                            Container(
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: (state.userInfo?.phone ?? '').isEmpty,
                        child: Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              spaceH100,
                              spaceH10,
                              Assets.images.businessLoans
                                  .image(width: 120, height: 120),
                              spaceH10,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Hiện tại bạn chưa có đơn hàng nào tồn đọng, hãy đăng ký vay ngay',
                                  style: Styles.n14w4
                                      .copyWith(color: context.colors.text),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => const AddVayNow()));
                                },
                                child: Container(
                                  height: 48,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 20).add(
                                      const EdgeInsets.symmetric(
                                          horizontal: 30)),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Color(0xFFFE5F06)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Đăng ký vay ngay',
                                    style: Styles.n16b
                                        .copyWith(color: context.colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (state.userInfo?.phone ?? '').isNotEmpty,
                        child: Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              spaceH100,
                              Text(
                                'Gói vay now đ 30,000,000 đang được xét duyệt. Vui lòng đợi, chúng tôi sớm sẽ liện hệ bạn',
                                style: Styles.n18w4
                                    .copyWith(color: context.colors.text),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
