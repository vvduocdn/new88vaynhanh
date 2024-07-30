import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/bottom_navigation.dart';
import 'package:new88_vaynow/component/custom_button.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/resources/app_color.dart';
import 'package:new88_vaynow/services/hive/hive_data_manager.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class PopupLogout extends StatefulWidget {
  final Function onApprove;
  final String title;
  final String content;
  final String cancel;

  const PopupLogout({
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
        return PopupLogout(
          onApprove: onApprove,
          title: title,
          cancel: cancel,
          content: content,
        );
      },
    );
  }

  @override
  State<PopupLogout> createState() => _PopupLogoutState();
}

class _PopupLogoutState extends State<PopupLogout> {
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
                  margin: const EdgeInsets.only(top: 20),
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
                          Row(
                            children: [
                              spaceW2,
                              Expanded(
                                  child: CustomButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'Cancel',
                                colorText: context.colors.hF05D0E,
                                backgroundColors: context.colors.white,
                                colorBorder: context.colors.hF05D0E,
                              )),
                              spaceW6,
                              Expanded(
                                  child: CustomButton(
                                onPressed: () async {
                                  await HiveDataManager()
                                      .logout()
                                      .then((value) => {
                                        widget.onApprove.call(),
                                            Navigator.pop(context)
                                          });
                                },
                                text: 'Logout',
                                colorText: context.colors.white,
                                backgroundColors: context.colors.hF05D0E,
                                colorBorder: context.colors.hF05D0E,
                              )),
                              spaceW2,
                            ],
                          ),
                          spaceH4
                        ]),
                  )),
            ],
          ),
        ));
  }
}
