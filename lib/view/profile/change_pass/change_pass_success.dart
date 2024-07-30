import 'package:flutter/material.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/l10n/localization/app_localizations.dart';
import 'package:new88_vaynow/utils/device_util.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';

class ChangePassSuccess extends StatelessWidget {
  const ChangePassSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true;
      },
      child: Scaffold(
        backgroundColor: context.colors.white,
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              color: context.colors.background,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  spaceH80,
                  Assets.images.passwordSecure.image(),
                  Text(
                    AppLocalizations.of(context)!.r60,
                    textAlign: TextAlign.center,
                    style: Styles.n28w7.copyWith(color: context.colors.text),
                  ),
                  spaceH20,
                  Text(
                    AppLocalizations.of(context)!.r61,
                    style: Styles.n14w4.copyWith(color: context.colors.text),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                            .add(const EdgeInsets.only(bottom: 30)),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: context.colors.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, -1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          child: Container(
                            height: 43 * DeviceUtils.getScreenHeight(context),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: context.colors.h598FF9,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.r62,
                              style: Styles.n16b
                                  .copyWith(color: context.colors.white),
                            ),
                          ),
                        ),
                      ],
                    )))
          ],
        )),
      ),
    );
  }
}
