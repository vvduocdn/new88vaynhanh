import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/bottom_navigation.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/services/hive/hive_data_manager.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view/profile/popup_logout.dart';
import 'package:new88_vaynow/view/profile/image_previewer_dialog.dart';
import 'package:new88_vaynow/view/web_view/web_view_screen.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class InfoUserScreen extends StatefulWidget {
  const InfoUserScreen({super.key});

  @override
  State<InfoUserScreen> createState() => _InfoUserScreenState();
}

class _InfoUserScreenState extends State<InfoUserScreen> {
  TextEditingController controllerName = TextEditingController();
  late FocusNode focusNode;
  final BuildContext _context =
      locator.get<NavigatorGlobalContextHelper>().getCurrentContext;
  Future<void> onLogout() async {
    PopupLogout.showPopModelDialog(context, () async {
      BlocProvider.of<UserBloc>(context).add(GetCurrentUserInfo());
    }, AppLocalizations.of(context)!.r63, AppLocalizations.of(context)!.r64,
        AppLocalizations.of(context)!.r65);
  }

  @override
  void initState() {
    final user = _context.watch<UserBloc>().state.userInfo?.fullName ?? '';
    controllerName.text = user;
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _context.read<UserBloc>().add(const UpdateStateEdit(isEdit: false));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listenWhen: (pr, cr) {
        return pr.isLoggedIn != cr.isLoggedIn;
      },
      listener: (context, state) {
        if (!state.isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigation(),
            ),
          );
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: context.colors.white,
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colors.hF05D0E,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    color: context.colors.main.withOpacity(0.1),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: RotatedBox(
                                    quarterTurns: 2,
                                    child: Assets.icons.arrowLeft.svg(
                                        width: 30,
                                        height: 30,
                                        color: context.colors.white)),
                              ),
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
                        Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: context.colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ImagePreviewerDialog(
                                                  url: state.userInfo?.avatar ??
                                                      '',
                                                  name: state
                                                          .userInfo?.fullName ??
                                                      '',
                                                )));
                                  },
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: CircleAvatar(
                                        backgroundColor: context.colors.hF05D0E
                                            .withOpacity(0.7),
                                        child: Icon(
                                          Icons.perm_identity_sharp,
                                          size: 50,
                                          color: context.colors.white,
                                        )),
                                  )),
                              spaceW16,
                              Expanded(
                                child: Column(
                                  children: [
                                    !state.isLoggedIn
                                        ? GestureDetector(
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Đăng nhập',
                                                        style: Styles.n24w7
                                                            .copyWith(
                                                                color: context
                                                                    .colors
                                                                    .text),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      spaceH10,
                                                      Text(
                                                        'Bấm để đăng nhập',
                                                        style: Styles.n16w4
                                                            .copyWith(
                                                                color: context
                                                                    .colors
                                                                    .text),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        state.userInfo?.phone ??
                                                            '',
                                                        style: Styles.n24w7
                                                            .copyWith(
                                                                color: context
                                                                    .colors
                                                                    .text),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      spaceH10,
                                                      Text(
                                                        'user${state.userInfo?.phone ?? ''}',
                                                        style: Styles.n16w4
                                                            .copyWith(
                                                                color: context
                                                                    .colors
                                                                    .text),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: context.colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(vertical: 10)
                                .add(const EdgeInsets.only(left: 10, right: 6)),
                            child: Column(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: context.colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10)
                                            .add(const EdgeInsets.only(
                                                left: 10, right: 6)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit_calendar,
                                            size: 24,
                                            color: context.colors.hF05D0E
                                                .withOpacity(0.7)),
                                        spaceW10,
                                        Text(
                                          'Chỉnh sữa thông tin mới',
                                          style: Styles.n16.copyWith(
                                              color: context.colors.text),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          size: 30,
                                          color: context.colors.main
                                              .withOpacity(0.7),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: context.colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10)
                                            .add(const EdgeInsets.only(
                                                left: 5, right: 5)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.downloading_rounded,
                                            size: 24,
                                            color: context.colors.hF05D0E
                                                .withOpacity(0.7)),
                                        spaceW10,
                                        Text(
                                          'Tải xuống của tôi',
                                          style: Styles.n16.copyWith(
                                              color: context.colors.text),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          size: 30,
                                          color: context.colors.main
                                              .withOpacity(0.7),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: context.colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10)
                                            .add(const EdgeInsets.only(
                                                left: 5, right: 5)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.contact_support,
                                            size: 24,
                                            color: context.colors.hF05D0E
                                                .withOpacity(0.7)),
                                        spaceW10,
                                        Text(
                                          'Liên hệ chúng tôi',
                                          style: Styles.n16.copyWith(
                                              color: context.colors.text),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          size: 30,
                                          color: context.colors.main
                                              .withOpacity(0.7),
                                        ),
                                      ],
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => const WebViewScreen(
                                                initialUrl:
                                                    'https://www.freeprivacypolicy.com/live/90bb152c-be66-4797-84f3-0fb9a3e1d8f5',
                                                titlePage: 'New88 VayNhanh',
                                              )),
                                    );
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: context.colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.symmetric(
                                              vertical: 10)
                                          .add(const EdgeInsets.only(
                                              left: 5, right: 5)),
                                      child: Row(
                                        children: [
                                          Icon(Icons.security_sharp,
                                              size: 24,
                                              color: context.colors.hF05D0E
                                                  .withOpacity(0.7)),
                                          spaceW10,
                                          Text(
                                            'Chính sách bảo mật',
                                            style: Styles.n16.copyWith(
                                                color: context.colors.text),
                                          ),
                                          const Spacer(),
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            size: 30,
                                            color: context.colors.main
                                                .withOpacity(0.7),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: context.colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10)
                                            .add(const EdgeInsets.only(
                                                left: 5, right: 5)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.settings,
                                            size: 24,
                                            color: context.colors.hF05D0E
                                                .withOpacity(0.7)),
                                        spaceW10,
                                        Text(
                                          'Cài đặt',
                                          style: Styles.n16.copyWith(
                                              color: context.colors.text),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          size: 30,
                                          color: context.colors.main
                                              .withOpacity(0.7),
                                        ),
                                      ],
                                    )),
                                GestureDetector(
                                  onTap: onLogout,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: context.colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.symmetric(
                                              vertical: 10)
                                          .add(const EdgeInsets.only(
                                              left: 5, right: 5)),
                                      child: Row(
                                        children: [
                                          Icon(Icons.restore_from_trash_rounded,
                                              size: 24,
                                              color: context.colors.hF05D0E
                                                  .withOpacity(0.7)),
                                          spaceW10,
                                          Text(
                                            'Xóa dữ liệu',
                                            style: Styles.n16.copyWith(
                                                color: context.colors.text),
                                          ),
                                          const Spacer(),
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            size: 30,
                                            color: context.colors.main
                                                .withOpacity(0.7),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
