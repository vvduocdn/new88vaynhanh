// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new88_vaynow/utils/app_colors.dart';
import 'package:new88_vaynow/utils/styles.dart';

import '../../utils/spaces.dart';

enum EFlushbarStatus { Success, Danger, Warning, Info, Failure }

class CommonFlushBar {
  static void show(BuildContext context, String message, EFlushbarStatus status, [Key? key]) {
    Color getColor() {
      if (status == EFlushbarStatus.Success) {
        return AppColors.warningGreen;
      }

      if (status == EFlushbarStatus.Danger) {
        return AppColors.baseYellow;
      }

      if (status == EFlushbarStatus.Failure) {
        return AppColors.warningRed;
      }

      if (status == EFlushbarStatus.Info) {
        return AppColors.primaryBlue;
      }

      return AppColors.baseYellow;
    }

    Widget getIcon() {
      if (status == EFlushbarStatus.Success) {
        return Icon(
          Icons.check_circle_outline,
          size: 24,
          color: getColor(),
        );
      }

      if (status == EFlushbarStatus.Danger) {
        return Icon(
          Iconsax.warning_2,
          size: 24,
          color: getColor(),
        );
      }

      if (status == EFlushbarStatus.Failure) {
        return Icon(
          Iconsax.close_circle,
          size: 24,
          color: getColor(),
        );
      }

      if (status == EFlushbarStatus.Info) {
        return Icon(
          Icons.info_rounded,
          size: 24,
          color: getColor(),
        );
      }

      return Icon(
        Icons.info_outline_rounded,
        size: 24,
        color: getColor(),
      );
    }

    Flushbar(
      key: key,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      backgroundColor: Colors.transparent,
      messageText: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(color: AppColors.textColor),
            child: Row(
              children: [getIcon(), spaceW16, Expanded(child: Text(message, style: Styles.n16.copyWith(color: AppColors.textLightColor)))],
            ),
          )),
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
