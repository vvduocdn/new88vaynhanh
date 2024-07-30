import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaynow_flutter/component/base_widget_spinkit.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/gen/assets.gen.dart';
import 'package:vaynow_flutter/services/di/locator.dart';
import 'package:vaynow_flutter/utils/navigator_global_context_helper.dart';
import 'package:vaynow_flutter/utils/regex.dart';
import 'package:vaynow_flutter/utils/spaces.dart';
import 'package:vaynow_flutter/utils/styles.dart';
import 'package:vaynow_flutter/view/home/widget/search_widget.dart';
import 'package:vaynow_flutter/view/profile/popup_logout.dart';
import 'package:vaynow_flutter/view/profile/popup_success.dart';
import 'package:vaynow_flutter/view/widget/popup_comfirm.dart';
import 'package:vaynow_flutter/view_model/app_mode_bloc/app_mode_bloc.dart';
import 'package:vaynow_flutter/view_model/app_mode_bloc/app_mode_state.dart';
import 'package:vaynow_flutter/view_model/home_bloc/home_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vaynow_flutter/view_model/user_bloc/user_bloc.dart';

class AddVayNow extends StatefulWidget {
  const AddVayNow({super.key});

  @override
  State<AddVayNow> createState() => _AddVayNowState();
}

class _AddVayNowState extends State<AddVayNow> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();
  bool isValidate = false;
  String phone = '';
  @override
  void initState() {
    super.initState();
  }

  void validate() {
    if (phone != '') {
      if (!Regex.phone.hasMatch(phone) || phone.contains(' ')) {
        isValidate = false;
        setState(() {});
        return;
      }

      isValidate = true;
      setState(() {});
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
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: context.colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFF05D0E).withOpacity(0.7),
                                  const Color(0xFFF05D0E).withOpacity(1.0),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RotatedBox(
                                  quarterTurns: 2,
                                  child: Assets.icons.arrowLeft.svg(
                                      width: 30,
                                      height: 30,
                                      color: context.colors.white)),
                              Text(
                                'VayNow',
                                style: Styles.n18w7
                                    .copyWith(color: context.colors.white),
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
                                style: Styles.n14w7
                                    .copyWith(color: context.colors.text),
                              ),
                              spaceH20,
                              SearchWidget(
                                searchController: _searchController,
                                focusNode: _focusNode,
                                onSearchChanged: (value) {
                                  setState(() {
                                    phone = value;
                                  });
                                  validate();
                                },
                              ),
                              spaceH10,
                              Text(
                                'Số điện thoại ( ví dụ: xxxxxxxxxxx)',
                                style: Styles.n15w4
                                    .copyWith(color: context.colors.main),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (!isValidate) return;
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(PostAccountEvent(
                                          phone: phone,
                                          func: (message, status) {
                                            if (status) {
                                              BlocProvider.of<UserBloc>(context)
                                                  .add(GetCurrentUserInfo());
                                              showModalBottomSheet<void>(
                                                context: context,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isScrollControlled: true,
                                                useSafeArea: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return const RegisterSuccess();
                                                },
                                              );
                                            } else {
                                              PopupComfirm.showPopModelDialog(
                                                  context,
                                                  () async {},
                                                  'Thông báo',
                                                  'Số điện thoại này đã tồn tại.\nVui lòng thử lại số điện thoại khác!!',
                                                  'Hủy');
                                            }
                                          }));
                                },
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
                                    gradient: LinearGradient(
                                        colors: isValidate
                                            ? [
                                                const Color(0xFFF05D0E)
                                                    .withOpacity(0.7),
                                                const Color(0xFFF05D0E)
                                                    .withOpacity(1.0),
                                              ]
                                            : [
                                                context.colors.main
                                                    .withOpacity(0.5),
                                                context.colors.main
                                                    .withOpacity(0.5)
                                              ],
                                        begin: const FractionalOffset(0.0, 0.0),
                                        end: const FractionalOffset(1.0, 0.0),
                                        stops: const [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Bước tiếp theo',
                                    style: Styles.n16b.copyWith(
                                        color: context.colors.white
                                            .withOpacity(0.7)),
                                  ),
                                ),
                              ),
                              spaceH8,
                              Text(
                                'Đăng nhập có nghĩa là bạn đã đồng ý với chính\nsách bảo mật',
                                style: Styles.n12v2
                                    .copyWith(color: const Color(0xFF625231)),
                              ),
                              spaceH80,
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
                          padding: const EdgeInsets.all(6)
                              .add(const EdgeInsets.symmetric(horizontal: 2)),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
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
                                style: Styles.n12v2
                                    .copyWith(color: const Color(0xFF625231)),
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
