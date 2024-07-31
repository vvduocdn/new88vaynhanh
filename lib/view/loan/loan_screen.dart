import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/gen/assets.gen.dart';
import 'package:new88_vaynow/services/di/locator.dart';
import 'package:new88_vaynow/utils/navigator_global_context_helper.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/utils/styles.dart';
import 'package:new88_vaynow/utils/time_helper.dart';
import 'package:new88_vaynow/view/add_vay_now.dart';
import 'package:new88_vaynow/view_model/app_mode_bloc/app_mode_bloc.dart';
import 'package:new88_vaynow/view_model/app_mode_bloc/app_mode_state.dart';
import 'package:new88_vaynow/view_model/user_bloc/user_bloc.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => _AddVayNowState();
}

class _AddVayNowState extends State<LoanScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.canRequestFocus;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppModeBloc, AppModeState>(
      builder: (context, appModeState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: context.colors.hF05D0E,
                body: Container(
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: context.colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        decoration: BoxDecoration(color: Color(0xFFFE5F06)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 30,
                            ),
                            Text(
                              'Vay Uy Tín',
                              style: Styles.n18w7
                                  .copyWith(color: context.colors.white),
                            ),
                            Container(
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: (state.userInfo?.phone ?? '').isEmpty,
                        child: Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              spaceH100,
                              spaceH10,
                              Assets.images.resultSearch
                                  .image(width: 120, height: 120),
                              spaceH10,
                              Text(
                                'Điên thông tin để đăng ký, có thể vây thêm thì đ\n30,000,000',
                                style: Styles.n14w4
                                    .copyWith(color: context.colors.text),
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => const AddVayNow()));
                                },
                                child: Container(
                                  height: 48,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 20).add(
                                      const EdgeInsets.symmetric(
                                          horizontal: 30)),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Color(0xFFFE5F06)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Nộp đơn ngay',
                                    style: Styles.n16b
                                        .copyWith(color: context.colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (state.userInfo?.phone ?? '').isNotEmpty,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            spaceH20,
                            Row(
                              children: [
                                spaceW10,
                                Text(
                                  'Vay now của bạn',
                                  style: Styles.n16b
                                      .copyWith(color: context.colors.text),
                                )
                              ],
                            ),
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: context.colors.hF05D0E)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '#${state.userInfo?.id ?? ""}',
                                          style: Styles.n16w5.copyWith(
                                              color: context.colors.text),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      spaceW12,
                                      Text(
                                        DateTime.parse(
                                                state.userInfo?.createdAt ??
                                                    DateTime.now().toString())
                                            .dmy,
                                        style: Styles.n16w5.copyWith(
                                            color: context.colors.text),
                                      ),
                                    ],
                                  ),
                                  spaceH12,
                                  Text(
                                    "Name: ${state.userInfo?.fullName ?? ''}",
                                    style: Styles.n14w4
                                        .copyWith(color: context.colors.text),
                                  ),
                                  spaceH10,
                                  Text(
                                    "Phone: ${state.userInfo?.phone ?? ''}",
                                    style: Styles.n14w4
                                        .copyWith(color: context.colors.text),
                                  ),
                                  spaceH10,
                                  Text(
                                    'Khoản vay : đ 30,000,000',
                                    style: Styles.n14w7
                                        .copyWith(color: context.colors.text),
                                  ),
                                  spaceH10,
                                  Text(
                                    'Đang xét duyệt',
                                    style: Styles.n14w7.copyWith(
                                        color: context.colors.hF05D0E),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
