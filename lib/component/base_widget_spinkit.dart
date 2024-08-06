import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view_model/home_bloc/home_bloc.dart';

class BaseWidgetSpinkit extends StatefulWidget {
  const BaseWidgetSpinkit({super.key, required this.child});
  final Widget child;

  @override
  State<BaseWidgetSpinkit> createState() => _BaseWidgetSpinkitState();
}

class _BaseWidgetSpinkitState extends State<BaseWidgetSpinkit> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              widget.child,
              Visibility(
                visible: state.isLoading,
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircularProgressIndicator(
                          color: context.colors.hF05D0E,
                        ),
                        spaceW12,
                        Text(
                          'loading ...',
                          style:
                              Styles.n14.copyWith(color: context.colors.text),
                        )
                      ],
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
