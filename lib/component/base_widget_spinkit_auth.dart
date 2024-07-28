import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/view_model/auth_bloc/authen_bloc.dart';

class BaseWidgetSpinkitAuth extends StatefulWidget {
  const BaseWidgetSpinkitAuth({super.key, required this.child});
  final Widget child;

  @override
  State<BaseWidgetSpinkitAuth> createState() => _BaseWidgetSpinkitAuthState();
}

class _BaseWidgetSpinkitAuthState extends State<BaseWidgetSpinkitAuth> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is LoginSuccess) {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        } else if (state is AuthFailure) {
          setState(() {
            isLoading = false;
          });
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                widget.child,
                Visibility(
                  visible: isLoading,
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SpinKitDualRing(
                        size: 50,
                        color: context.colors.h598FF9,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
