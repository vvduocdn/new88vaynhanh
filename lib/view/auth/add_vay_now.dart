import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/base_widget_spinkit.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/utils/regex.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view/auth/login_screen.dart';
import 'package:new88_vaynow/view/home/widget/search_widget.dart';
import 'package:new88_vaynow/view/profile/popup_success.dart';
import 'package:new88_vaynow/view/web_view/web_view_screen.dart';
import 'package:new88_vaynow/view/widget/popup_comfirm.dart';
import 'package:new88_vaynow/view_model/app_mode_bloc/app_mode_bloc.dart';
import 'package:new88_vaynow/view_model/app_mode_bloc/app_mode_state.dart';
import 'package:new88_vaynow/view_model/home_bloc/home_bloc.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

import '../../component/widgets/field.dart';

class AddVayNow extends StatefulWidget {
  const AddVayNow({super.key});

  @override
  State<AddVayNow> createState() => _AddVayNowState();
}

class _AddVayNowState extends State<AddVayNow> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passOldController = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final NavigatorGlobalContextHelper navigationService = locator.get<NavigatorGlobalContextHelper>();
  bool isValidate = false;
  String phone = '';
  String pass = '';
  String passOld = '';

  @override
  void initState() {
    super.initState();
  }

  void validate() {
    bool isValid = true;

    // Kiểm tra nếu bất kỳ trường nào là trống
    if (phone.isEmpty || pass.isEmpty || passOld.isEmpty) {
      isValid = false;
    } else {
      if (phone.isNotEmpty) {
        if (!Regex.phone.hasMatch(phone) || phone.contains(' ')) {
          isValid = false;
        }
      }
      if (pass.isNotEmpty) {
        if (pass.length < 8) {
          isValid = false;
        }
      }
      if (passOld.isNotEmpty) {
        if (pass.length < 8 || pass != passOld) {
          isValid = false;
        }
      }
    }

    if (isValidate != isValid) {
      setState(() {
        isValidate = isValid;
      });
    }
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
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: context.colors.hF05D0E,
                body: BaseWidgetSpinkit(
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: context.colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFFE5F06).withOpacity(1.0),
                                  const Color(0xFFFE5F06).withOpacity(1.0),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: RotatedBox(quarterTurns: 2, child: Assets.icons.arrowLeft.svg(width: 30, height: 30, color: context.colors.white)),
                              ),
                              Text(
                                'Vay New88',
                                style: Styles.n18w7.copyWith(color: context.colors.white),
                              ),
                              Container(
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 180,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/images/banner_6.jpg"),
                                fit: BoxFit.fill,
                              )),
                            ),
                            Container(
                              height: 180,
                              width: double.infinity,
                              color: context.colors.white.withOpacity(0.6),
                            )
                          ],
                        ),
                        spaceH20,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Xin chào, chào mừng đến với vay now',
                                style: Styles.n14w7.copyWith(color: context.colors.text),
                              ),
                              spaceH20,
                              Text(
                                'Số điện thoại ( ví dụ: xxxxxxxxxxx)',
                                style: Styles.n15w4.copyWith(color: context.colors.main),
                              ),
                              SearchWidget(
                                searchController: _searchController,
                                onSearchChanged: (value) {
                                  setState(() {
                                    phone = value;
                                  });
                                  validate();
                                },
                                hinText: 'Vui lòng nhập số điện thoại',
                                keyboardType: TextInputType.phone,
                              ),
                              spaceH10,
                              Text(
                                'Nhập mật khẩu (Độ dài tối thiểu 8 ký tự)',
                                style: Styles.n15w4.copyWith(color: context.colors.main),
                              ),
                              FieldWidget(
                                isIconPass: true,
                                obscureText: true,
                                hintText: 'Vui lòng nhập số mật khẩu',
                                textEditingController: _passController,
                                onPressed: (String text) {
                                  pass = text;

                                  validate();
                                },
                                label: '',
                                color: null,
                                errorText: null,
                              ),
                              spaceH10,
                              Text(
                                'Nhập lại mật khẩu (Độ dài tối thiểu 8 ký tự)',
                                style: Styles.n15w4.copyWith(color: context.colors.main),
                              ),
                              FieldWidget(
                                isIconPass: true,
                                obscureText: true,
                                hintText: 'Vui lòng nhập lại số mật khẩu',
                                textEditingController: _passOldController,
                                onPressed: (String text) {
                                  passOld = text;

                                  validate();
                                },
                                label: '',
                                color: null,
                                errorText: null,
                              ),
                              spaceH10,
                              GestureDetector(
                                onTap: () {
                                  if (!isValidate) return;
                                  BlocProvider.of<HomeBloc>(context).add(PostAccountEvent(
                                      phone: phone,
                                      pass: pass,
                                      money: state.money,
                                      func: (message, status) {
                                        if (status) {
                                          BlocProvider.of<UserBloc>(context).add(GetCurrentUserInfo());
                                          showModalBottomSheet<void>(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            isScrollControlled: true,
                                            useSafeArea: true,
                                            builder: (BuildContext context) {
                                              return const RegisterSuccess();
                                            },
                                          );
                                        } else {
                                          PopupComfirm.showPopModelDialog(
                                              context, () async {}, 'Thông báo', 'Số điện thoại này đã tồn tại.\nVui lòng thử lại số điện thoại khác!!', 'Hủy');
                                        }
                                      }));
                                },
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                                    gradient: LinearGradient(
                                        colors: isValidate
                                            ? [
                                                const Color(0xFFFE5F06).withOpacity(1.0),
                                                const Color(0xFFFE5F06).withOpacity(1.0),
                                              ]
                                            : [context.colors.main.withOpacity(0.5), context.colors.main.withOpacity(0.5)],
                                        begin: const FractionalOffset(0.0, 0.0),
                                        end: const FractionalOffset(1.0, 0.0),
                                        stops: const [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Bước tiếp theo',
                                    style: Styles.n16b.copyWith(color: context.colors.white.withOpacity(0.7)),
                                  ),
                                ),
                              ),
                              spaceH8,
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => const LoginScreen()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Đã có tài khoản, ',
                                        style: Styles.n12v2.copyWith(
                                          color: const Color(0xFF625231),
                                        ),
                                        children: [TextSpan(text: 'đăng nhập ngay.', style: Styles.n12v7.copyWith(color: context.colors.text))]),
                                  ),
                                ),
                              ),
                              spaceH4,
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => const WebViewScreen(
                                              initialUrl: 'https://www.freeprivacypolicy.com/live/90bb152c-be66-4797-84f3-0fb9a3e1d8f5',
                                              titlePage: 'Vay New88',
                                            )),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 0.5),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFF625231),
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Đăng nhập có nghĩa là bạn đã đồng ý với chính sách bảo mật',
                                      style: Styles.n12v7.copyWith(
                                        color: const Color(0xFF625231),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   height: 100,
                              //   width: double.infinity,
                              //   decoration: const BoxDecoration(
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(8)),
                              //       image: DecorationImage(
                              //         image: AssetImage(
                              //             "assets/images/banner_1.jpg"),
                              //         fit: BoxFit.fill,
                              //       )),
                              // ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(6).add(const EdgeInsets.symmetric(horizontal: 2)),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(6)),
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFE7D384).withOpacity(0.0),
                                  const Color(0xFFEFE2AF).withOpacity(0.0),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.lock_clock_outlined,
                                color: context.colors.hF05D0E,
                                size: 12,
                              ),
                              spaceW6,
                              Text(
                                'Nền tảng này hứa hẹn bảo vệ tính bảo mật dữ liệu của\nbản và sẽ không phổ biến thông tin cá nhân của bạn',
                                style: Styles.n12v2.copyWith(color: const Color(0xFF625231)),
                              )
                            ],
                          ),
                        ),
                        spaceH10
                      ],
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}
