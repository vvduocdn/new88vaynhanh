import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/bottom_navigation.dart';
import 'package:new88_vaynow/component/custom_button.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/utils/device_util.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class RegisterSuccess extends StatefulWidget {
  const RegisterSuccess({super.key});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: MediaQuery.of(context).size.height,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: context.colors.white, borderRadius: const BorderRadius.all(Radius.circular(8))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      spaceH20,
                                      Assets.icons.icUpdateCar.svg(width: 100, height: 100, color: context.colors.hF05D0E),
                                      spaceH20,
                                      Text(
                                        'Đăng ký thành công',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: context.colors.text,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Đăng ký thành công, bạn có thể đang ký gói vây đ  ${(formatNumber(int.parse(state.userInfo?.money ?? '0')))}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: context.colors.text,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      spaceH20,
                                      CustomButton(
                                        onPressed: () {
                                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const BottomNavigation()), (route) => false);
                                        },
                                        text: 'Tiếp tục',
                                        colorText: context.colors.white,
                                        backgroundColors: context.colors.hF05D0E,
                                        colorBorder: context.colors.hF05D0E,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
