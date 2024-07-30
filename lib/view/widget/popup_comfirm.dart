import 'package:flutter/material.dart';
import 'package:vaynow_flutter/component/custom_button.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/resources/app_color.dart';
import 'package:vaynow_flutter/utils/styles.dart';

class PopupComfirm extends StatefulWidget {
  final Function onApprove;
  final String title;
  final String content;
  final String cancel;

  const PopupComfirm({
    super.key,
    required this.onApprove,
    required this.title,
    required this.content,
    required this.cancel,
  });

  static Future<void> showPopModelDialog(parentContext, Function onApprove,
      String title, String content, String cancel) {
    return showDialog(
      barrierDismissible: false,
      context: parentContext,
      builder: (context) {
        return PopupComfirm(
          onApprove: onApprove,
          title: title,
          cancel: cancel,
          content: content,
        );
      },
    );
  }

  @override
  State<PopupComfirm> createState() => _PopupComfirmState();
}

class _PopupComfirmState extends State<PopupComfirm> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          height: 150,
          child: Stack(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.0, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.title,
                            style: Styles.n16.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.h444444,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.content,
                            style: Styles.n14.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.h444444,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          CustomButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: widget.cancel,
                            colorText: context.colors.white,
                            backgroundColors: context.colors.hF05D0E,
                            colorBorder: context.colors.hF05D0E,
                          )
                        ]),
                  )),
            ],
          ),
        ));
  }
}
