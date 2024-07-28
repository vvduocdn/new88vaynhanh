import 'package:flutter/material.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/utils/styles.dart';

// ignore: must_be_immutable
class FieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? label;
  final Color? color;
  String? errorText;
  String? hintText;
  bool obscureText;
  bool isIconPass;
  TextInputType textInputType;
  final Function(String text) onPressed;

  FieldWidget(
      {super.key,
      required this.textEditingController,
      required this.onPressed,
      required this.label,
      required this.color,
      this.errorText = '',
      this.hintText = '',
      this.obscureText = false,
      this.isIconPass = false,
      this.textInputType = TextInputType.text});

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
      keyboardType: widget.textInputType,
      obscureText: _passwordVisible,
      cursorColor: widget.color,
      onChanged: widget.onPressed,
      decoration: InputDecoration(
        errorText: widget.errorText,
        hintText: widget.hintText,
        labelStyle: Styles.n16w4.copyWith(
          color: context.colors.main,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: context.colors.hEFEFEF, width: 1.0)),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: context.colors.hEFEFEF, width: 1.0)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            width: 1,
            color: context.colors.hEFEFEF,
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
            color: context.colors.hEFEFEF,
          ), //<-- SEE HERE
        ),
        suffixIcon: widget.isIconPass == true
            ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: context.colors.main,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
      ),
      style: Styles.n14w4.copyWith(color: widget.color ?? context.colors.main),
      controller: widget.textEditingController,
    );
  }
}
