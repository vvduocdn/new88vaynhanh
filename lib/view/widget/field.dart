import 'package:flutter/material.dart';
import 'package:new88_vaynow/utils/app_colors.dart';

// ignore: must_be_immutable
class FieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? label;
  final Color? color;
  String? errorText;
  bool obscureText;
  bool isIconPass;
  final Function(String text) onPressed;

  FieldWidget(
      {super.key,
      required this.textEditingController,
      required this.onPressed,
      required this.label,
      required this.color,
      this.errorText = '',
      this.obscureText = false,
      this.isIconPass = false});

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  late Color currentColor;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _passwordVisible,
      cursorColor: AppColors.h838383,
      onChanged: widget.onPressed,
      decoration: InputDecoration(
        errorText: widget.errorText,
        labelText: widget.label!,
        labelStyle: TextStyle(color: widget.color ?? AppColors.h434343, fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: "SF Pro Display"),
        focusedBorder:
            OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: widget.color ?? AppColors.h838383, width: 1.0)),
        border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: widget.color ?? AppColors.h838383, width: 1.0)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            width: 1,
            color: widget.color ?? AppColors.h838383,
          ), //<-- SEE HERE
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            width: 1,
            color: widget.color ?? AppColors.h838383,
          ), //<-- SEE HERE
        ),
        suffixIcon: widget.isIconPass == true
            ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.h838383,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
      ),
      style: TextStyle(color: widget.color ?? AppColors.h838383, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: "SF Pro Display"),
      controller: widget.textEditingController,
    );
  }
}
