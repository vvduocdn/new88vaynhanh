import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/view_model/user_bloc/user_bloc.dart';

class BaseWidgetSpinkitUser extends StatefulWidget {
  const BaseWidgetSpinkitUser({super.key, required this.child});
  final Widget child;

  @override
  State<BaseWidgetSpinkitUser> createState() => _BaseWidgetSpinkitUserState();
}

class _BaseWidgetSpinkitUserState extends State<BaseWidgetSpinkitUser> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              widget.child,
              Visibility(
                visible: state.isLoading!,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
    );
  }
}
