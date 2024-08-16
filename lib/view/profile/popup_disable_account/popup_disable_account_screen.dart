import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new88_vaynow/component/app_flush_bar.dart';
import 'package:new88_vaynow/component/bottom_navigation.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/services/hive/hive_data_manager.dart';
import 'package:new88_vaynow/utils/app_colors.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/view_model/home_bloc/home_bloc.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class PopupDisableAccount extends StatefulWidget {
  const PopupDisableAccount({super.key});

  @override
  State<PopupDisableAccount> createState() => _PopupDisableAccountState();
}

class _PopupDisableAccountState extends State<PopupDisableAccount> {
  TextEditingController controllerPassword = TextEditingController();
  late FocusNode focusNode;
  final BuildContext _context = locator.get<NavigatorGlobalContextHelper>().getCurrentContext;
  String password = '';
  bool isDisableAccount = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controllerPassword.clear();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> _disableAccount() async {
    isDisableAccount = true;
    setState(() {});
    BlocProvider.of<HomeBloc>(context).add(DisableAccountEvent(
        pass: controllerPassword.text,
        func: (message, status) {
          if (status) {
            HiveDataManager().logout();
            BlocProvider.of<UserBloc>(context).add(GetCurrentUserInfo());
            isDisableAccount = false;
            setState(() {});
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const BottomNavigation()), (route) => false);
            return;
          }
          if (!status) {
            CommonFlushBar.show(_context, 'Mật khẩu không chính xác', EFlushbarStatus.Failure);
            isDisableAccount = false;
            setState(() {});
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 3.2,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Xóa tài khoản',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    spaceH10,
                                    Container(
                                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.gray, width: 1))),
                                      height: 40,
                                      child: TextField(
                                        autofocus: true,
                                        focusNode: focusNode,
                                        controller: controllerPassword,
                                        style: const TextStyle(color: Colors.black),
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Nhập mật khẩu',
                                          enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          errorText: null,
                                        ),
                                      ),
                                    ),
                                    spaceH10,
                                    Text(
                                      'Bạn có chắc chắn muốn xóa tài khoản không?',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    spaceH10,
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: isDisableAccount ? null : _disableAccount,
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(color: Colors.red, width: 1),
                                                borderRadius: BorderRadius.circular(5), // Bo viền container
                                              ),
                                              alignment: Alignment.center,
                                              child: isDisableAccount
                                                  ? const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: SpinKitCircle(
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    )
                                                  : Text(
                                                      'Đồng ý',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.white,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                        spaceW12,
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              focusNode.unfocus();
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF5D5D5D),

                                                border: Border.all(color: const Color(0xFF5D5D5D), width: 1),
                                                borderRadius: BorderRadius.circular(5), // Bo viền container
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Hủy',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
