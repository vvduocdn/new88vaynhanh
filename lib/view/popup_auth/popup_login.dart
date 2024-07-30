import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/app_flush_bar.dart';
import 'package:new88_vaynow/component/base_widget_spinkit_auth.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/component/widgets/field.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/services/api/api_client.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view/popup_auth/popup_register.dart';
import 'package:new88_vaynow/view_model/auth_bloc/authen_bloc.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class PopupLogin extends StatefulWidget {
  const PopupLogin({super.key});

  @override
  State<PopupLogin> createState() => _PopupLoginState();
}

class _PopupLoginState extends State<PopupLogin> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();
  String email = '';
  String pass = '';

  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(OpenScreenEvent(status: true));
    super.initState();
  }

  void _login(BuildContext contextWithBloc) {
    BlocProvider.of<AuthBloc>(contextWithBloc).add(LoginEvent(
      email: email,
      password: pass,
      func: () {
        BlocProvider.of<UserBloc>(contextWithBloc).add(GetCurrentUserInfo());
        Navigator.of(context).pop();
      },
    ));
  }

  bool validate() {
    if (email.trim().isEmpty || pass.trim().isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    streamOpenLogin.sink.add(false);
    BlocProvider.of<AuthBloc>(navigationService.getCurrentContext)
        .add(OpenScreenEvent(status: false));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (contextWithBloc) {
        return BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthLoading) {}
            if (state is LoginSuccess) {
              if (mounted) {
                CommonFlushBar.show(
                    context, "Login success", EFlushbarStatus.Success);
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
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: context.colors.background,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.center,
                                      child: Text(
                                        AppLocalizations.of(context)!.r94,
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
                                        AppLocalizations.of(context)!.r95,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: context.colors.text,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    spaceH30,
                                    Text(
                                      AppLocalizations.of(context)!.r97,
                                      style: Styles.n16w5,
                                    ),
                                    spaceH4,
                                    FieldWidget(
                                      hintText:
                                          AppLocalizations.of(context)!.r96,
                                      errorText: null,
                                      onPressed: (text) {
                                        setState(() {
                                          email = text;
                                        });
                                      },
                                      color: context.colors.text,
                                      textEditingController: controllerEmail,
                                      label: AppLocalizations.of(context)!.r97,
                                    ),
                                    spaceH20,
                                    Text(
                                      AppLocalizations.of(context)!.r99,
                                      style: Styles.n16w5,
                                    ),
                                    spaceH4,
                                    FieldWidget(
                                      hintText:
                                          AppLocalizations.of(context)!.r98,
                                      errorText: null,
                                      obscureText: true,
                                      isIconPass: true,
                                      onPressed: (text) {
                                        setState(() {
                                          pass = text;
                                        });
                                      },
                                      color: context.colors.text,
                                      textEditingController: controllerPassword,
                                      label: AppLocalizations.of(context)!.r99,
                                    ),
                                    spaceH20,
                                    GestureDetector(
                                      onTap: () {
                                        if (validate()) {
                                          _login(context);
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                            AppLocalizations.of(context)!.r100,
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
                                        Navigator.pop(context);
                                        showModalBottomSheet<void>(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled: true,
                                          useSafeArea: true,
                                          builder: (BuildContext context) {
                                            return const PopupRegister();
                                          },
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                            text: AppLocalizations.of(context)!
                                                .r101,
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: AppLocalizations.of(
                                                          context)!
                                                      .r102,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                        ],
                      )),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
