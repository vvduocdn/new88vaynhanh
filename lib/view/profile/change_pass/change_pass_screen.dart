import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/app_flush_bar.dart';
import 'package:new88_vaynow/component/base_widget_spinkit_user.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/component/widgets/field.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/utils/device_util.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view/profile/change_pass/change_pass_success.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  TextEditingController controllerPasswordOld = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRepPassword = TextEditingController();
  final ValueNotifier<bool> buttonConfirm = ValueNotifier<bool>(false);

  String passwordOld = '';
  String password = '';
  String repPassword = '';

  String? errPasswordOld;
  String? errPassword;
  String? errRepPassword;

  bool isPasswordOld = true;
  bool isPassword = true;
  bool isRepPassword = true;

  Future<void> _handChangePassword() async {
    if (!buttonConfirm.value) return;
    context.read<UserBloc>().add(ChangePasswordEvent(
        passwordOld: passwordOld,
        passwordNew: password,
        func: (String message, int status) {
          if (status == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePassSuccess()));
            return;
          }
          CommonFlushBar.show(context, message, EFlushbarStatus.Failure);
        }));
  }

  void validate() {
    if (passwordOld.trim().isEmpty ||
        password.trim().isEmpty ||
        repPassword.trim().isEmpty) {
      buttonConfirm.value = false;
      return;
    }
    if (errPassword != null ||
        errPasswordOld != null ||
        errRepPassword != null) {
      buttonConfirm.value = false;
      return;
    }
    buttonConfirm.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colors.white,
          body: BaseWidgetSpinkitUser(
            child: SafeArea(
                child: Stack(
              children: [
                Container(
                  color: context.colors.background,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: context.colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const RotatedBox(
                                  quarterTurns: 2,
                                  child: Icon(Icons.chevron_right_rounded,
                                      size: 30),
                                ),
                              ),
                              spaceW6,
                              Text(
                                AppLocalizations.of(context)!.r51,
                                style: Styles.n18w4
                                    .copyWith(color: context.colors.text),
                              ),
                            ],
                          )),
                      spaceH16,
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!.r52,
                          style:
                              Styles.n16b.copyWith(color: context.colors.text),
                        ),
                      ),
                      spaceH6,
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        color: context.colors.white,
                        child: FieldWidget(
                          isIconPass: true,
                          obscureText: true,
                          errorText: errPasswordOld,
                          color: context.colors.text,
                          textEditingController: controllerPasswordOld,
                          label: '',
                          hintText: '',
                          onPressed: (String text) {
                            passwordOld = text;
                            if (text.contains(" ")) {
                              errPasswordOld =
                                  AppLocalizations.of(context)!.r54;
                            } else {
                              errPasswordOld = null;
                            }
                            validate();
                            setState(() {});
                          },
                        ),
                      ),
                      spaceH16,
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!.r55,
                          style:
                              Styles.n16b.copyWith(color: context.colors.text),
                        ),
                      ),
                      spaceH6,
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        color: context.colors.white,
                        child: FieldWidget(
                          isIconPass: true,
                          obscureText: true,
                          errorText: errPassword,
                          color: context.colors.text,
                          textEditingController: controllerPassword,
                          label: AppLocalizations.of(context)!.r55,
                          hintText: AppLocalizations.of(context)!.r56,
                          onPressed: (String text) {
                            password = text;
                            if (text.contains(" ")) {
                              errPassword = AppLocalizations.of(context)!.r54;
                            } else {
                              errPassword = null;
                            }
                            if (repPassword.isNotEmpty) {
                              if (password != repPassword) {
                                errRepPassword =
                                    AppLocalizations.of(context)!.r59;
                              } else {
                                errRepPassword = null;
                              }
                            }
                            validate();
                            setState(() {});
                          },
                        ),
                      ),
                      spaceH16,
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!.r58,
                          style:
                              Styles.n16b.copyWith(color: context.colors.text),
                        ),
                      ),
                      spaceH6,
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        color: context.colors.white,
                        child: FieldWidget(
                          isIconPass: true,
                          errorText: errRepPassword,
                          obscureText: true,
                          color: context.colors.text,
                          textEditingController: controllerRepPassword,
                          label: '',
                          hintText: AppLocalizations.of(context)!.r56,
                          onPressed: (String text) {
                            repPassword = text;
                            if (text.contains(" ")) {
                              repPassword = AppLocalizations.of(context)!.r54;
                            } else {
                              errPassword = null;
                            }
                            if (password != repPassword) {
                              errRepPassword =
                                  AppLocalizations.of(context)!.r59;
                            } else {
                              errRepPassword = null;
                            }
                            validate();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ValueListenableBuilder<bool>(
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10)
                                .add(const EdgeInsets.only(bottom: 0)),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: context.colors.background,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, -1),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (state.isChangePassword! || !value) {
                                      return;
                                    }
                                    _handChangePassword();
                                  },
                                  child: Container(
                                    height: 43 *
                                        DeviceUtils.getScreenHeight(context),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: buttonConfirm.value
                                          ? context.colors.h598FF9
                                          : context.colors.hEFEFEF,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    child:
                                        Text(AppLocalizations.of(context)!.r51,
                                            style: Styles.n16b.copyWith(
                                              color: buttonConfirm.value
                                                  ? context.colors.white
                                                  : context.colors.main,
                                            )),
                                  ),
                                ),
                              ],
                            ));
                      },
                      valueListenable: buttonConfirm,
                    ))
              ],
            )),
          ),
        );
      },
    );
  }
}
