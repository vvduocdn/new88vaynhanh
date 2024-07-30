import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/app_flush_bar.dart';
import 'package:new88_vaynow/component/base_widget_spinkit_auth.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/component/widgets/field.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/utils/regex.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view/popup_auth/popup_login.dart';
import 'package:new88_vaynow/view_model/auth_bloc/authen_bloc.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class PopupRegister extends StatefulWidget {
  const PopupRegister({super.key});

  @override
  State<PopupRegister> createState() => _PopupRegisterState();
}

class _PopupRegisterState extends State<PopupRegister> {
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerRepPassword = TextEditingController();
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();

  String email = '';
  String password = '';
  String fullName = '';
  String phone = '';
  String repPassword = '';

  String? errEmail;
  String? errPassword;
  String? errFullName;
  String? errPhone;
  String? errRepPassword;

  bool isPassword = true;
  bool isRepPassword = true;

  void _register(BuildContext contextWithBloc) {
    BlocProvider.of<AuthBloc>(contextWithBloc).add(RegisterEvent(
        password: password,
        email: email,
        fullName: fullName,
        phoneNumber: phone,
        func: () async {
          BlocProvider.of<UserBloc>(contextWithBloc).add(GetCurrentUserInfo());
          Navigator.of(context).pop();
        }));
  }

  bool validate() {
    if (email.trim().isEmpty ||
        password.trim().isEmpty ||
        phone.trim().isEmpty ||
        fullName.trim().isEmpty ||
        repPassword.trim().isEmpty) {
      return false;
    }
    if (errPassword != null ||
        errEmail != null ||
        errPhone != null ||
        errFullName != null ||
        errRepPassword != null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (contextWithBloc) {
        return BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthLoading) {}
            if (state is RegisterSuccess) {
              if (mounted) {
                CommonFlushBar.show(
                    context, "Register success.", EFlushbarStatus.Success);
              }
            } else if (state is AuthFailure) {
              CommonFlushBar.show(
                  context, state.message, EFlushbarStatus.Failure);
            }
          },
          builder: (BuildContext context, AuthState state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: context.colors.background,
              body: BaseWidgetSpinkitAuth(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: context.colors.background,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Text(
                                  AppLocalizations.of(context)!.r103,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: context.colors.text,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Text(
                                  AppLocalizations.of(context)!.r104,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: context.colors.text,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              spaceH20,
                              Text(
                                AppLocalizations.of(context)!.r97,
                                style: Styles.n16w5
                                    .copyWith(color: context.colors.text),
                              ),
                              spaceH4,
                              FieldWidget(
                                errorText: errEmail,
                                color: context.colors.text,
                                textEditingController: controllerUserName,
                                label: AppLocalizations.of(context)!.r97,
                                hintText: AppLocalizations.of(context)!.r96,
                                onPressed: (String text) {
                                  email = text;
                                  if (!Regex.email.hasMatch(text)) {
                                    setState(() {
                                      errEmail =
                                          AppLocalizations.of(context)!.r105;
                                    });
                                    return;
                                  } else {
                                    errEmail = null;
                                  }
                                  setState(() {});
                                },
                              ),
                              spaceH16,
                              Text(
                                AppLocalizations.of(context)!.r106,
                                style: Styles.n16w5
                                    .copyWith(color: context.colors.text),
                              ),
                              spaceH4,
                              FieldWidget(
                                errorText: errFullName,
                                color: context.colors.text,
                                textEditingController: controllerFullName,
                                label: AppLocalizations.of(context)!.r106,
                                hintText: AppLocalizations.of(context)!.r107,
                                onPressed: (String text) {
                                  fullName = text;
                                  if (text.length < 6) {
                                    errFullName =
                                        AppLocalizations.of(context)!.r108;
                                  } else {
                                    errFullName = null;
                                  }
                                  setState(() {});
                                },
                              ),
                              spaceH16,
                              Text(
                                AppLocalizations.of(context)!.r109,
                                style: Styles.n16w5
                                    .copyWith(color: context.colors.text),
                              ),
                              spaceH4,
                              FieldWidget(
                                errorText: errPhone,
                                color: context.colors.text,
                                textEditingController: controllerPhone,
                                label: AppLocalizations.of(context)!.r109,
                                hintText: AppLocalizations.of(context)!.r110,
                                textInputType: TextInputType.phone,
                                onPressed: (String text) {
                                  phone = text;
                                  if (text.length < 10) {
                                    errPhone =
                                        AppLocalizations.of(context)!.r111;
                                  } else {
                                    errPhone = null;
                                  }
                                  setState(() {});
                                },
                              ),
                              spaceH16,
                              Text(
                                AppLocalizations.of(context)!.r99,
                                style: Styles.n16w5
                                    .copyWith(color: context.colors.text),
                              ),
                              spaceH4,
                              FieldWidget(
                                isIconPass: true,
                                obscureText: true,
                                errorText: errPassword,
                                color: context.colors.text,
                                textEditingController: controllerPassword,
                                label: AppLocalizations.of(context)!.r99,
                                hintText: AppLocalizations.of(context)!.r98,
                                onPressed: (String text) {
                                  password = text;
                                  if (text.contains(" ")) {
                                    errPassword =
                                        AppLocalizations.of(context)!.r54;
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
                                  setState(() {});
                                },
                              ),
                              spaceH16,
                              Text(
                                AppLocalizations.of(context)!.r112,
                                style: Styles.n16w5
                                    .copyWith(color: context.colors.text),
                              ),
                              spaceH4,
                              FieldWidget(
                                isIconPass: true,
                                errorText: errRepPassword,
                                obscureText: true,
                                color: context.colors.text,
                                textEditingController: controllerRepPassword,
                                label: AppLocalizations.of(context)!.r112,
                                hintText: AppLocalizations.of(context)!.r57,
                                onPressed: (String text) {
                                  repPassword = text;
                                  if (text.contains(" ")) {
                                    repPassword =
                                        AppLocalizations.of(context)!.r54;
                                  } else {
                                    errPassword = null;
                                  }
                                  if (password != repPassword) {
                                    errRepPassword =
                                        AppLocalizations.of(context)!.r59;
                                  } else {
                                    errRepPassword = null;
                                  }
                                  setState(() {});
                                },
                              ),
                              spaceH20,
                              GestureDetector(
                                onTap: () {
                                  if (validate()) {
                                    _register(context);
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: !validate()
                                        ? context.colors.h598FF9
                                            .withOpacity(0.5)
                                        : context.colors.h598FF9,
                                    border: Border.all(
                                        color: !validate()
                                            ? context.colors.h598FF9
                                                .withOpacity(0.5)
                                            : context.colors.h598FF9,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        10), // Bo viền container
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.r103,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: context.colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              spaceH10,
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  showModalBottomSheet<void>(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    useSafeArea: true,
                                    builder: (BuildContext context) {
                                      return const PopupLogin();
                                    },
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                      text: AppLocalizations.of(context)!.r114,
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: AppLocalizations.of(context)!
                                                .r113,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
