import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaynow_flutter/component/theme.dart';
import 'package:vaynow_flutter/services/api/api_client.dart';
import 'package:vaynow_flutter/services/di/locator.dart';
import 'package:vaynow_flutter/services/supa_base/supa_base_service.dart';
import 'package:vaynow_flutter/utils/navigator_global_context_helper.dart';
import 'package:vaynow_flutter/utils/spaces.dart';
import 'package:vaynow_flutter/utils/styles.dart';
import 'package:vaynow_flutter/view/add_vay_now.dart';
import 'package:vaynow_flutter/view/profile/info_user_screen.dart';
import 'package:vaynow_flutter/view_model/app_mode_bloc/app_mode_bloc.dart';
import 'package:vaynow_flutter/view_model/app_mode_bloc/app_mode_state.dart';
import 'package:vaynow_flutter/view_model/home_bloc/home_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final NavigatorGlobalContextHelper navigationService =
      locator.get<NavigatorGlobalContextHelper>();
  final api = locator<ApiClient>();

  int current = PAGE;
  int pageSize = LIMIT;
  bool isConnectInternet = true;
  @override
  void initState() {
    SupaBaseService.instance;
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    api.closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppModeBloc, AppModeState>(
      builder: (context, appModeState) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
                backgroundColor: context.colors.white,
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: context.colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      spaceH18,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                          ),
                          Text(
                            'VayNow',
                            style: Styles.n18w7
                                .copyWith(color: context.colors.text),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => InfoUserScreen()));
                            },
                            child: const Icon(
                              Icons.perm_identity_sharp,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      spaceH30,
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(70),
                              topLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFFF05D0E).withOpacity(0.7),
                                const Color(0xFFF05D0E).withOpacity(0.8),
                                const Color(0xFFF05D0E).withOpacity(1.0),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 0.5, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            spaceH26,
                            Text(
                              'Số tiền có sẵn',
                              style: Styles.n14
                                  .copyWith(color: context.colors.white),
                            ),
                            spaceH12,
                            Text(
                              'đ 30,000,000',
                              style: Styles.n38b
                                  .copyWith(color: context.colors.white),
                            ),
                            spaceH16,
                            Container(
                              height: 0.5,
                              width: double.infinity,
                              color: context.colors.white,
                            ),
                            spaceH28,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tổn cộng',
                                      style: Styles.n14.copyWith(
                                          color: context.colors.white),
                                    ),
                                    spaceH10,
                                    Text(
                                      'đ 30,000,000',
                                      style: Styles.n18w7.copyWith(
                                          color: context.colors.white),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 24,
                                  width: 0.5,
                                  color: context.colors.white,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Số tiền đã sử dụng',
                                      style: Styles.n14.copyWith(
                                          color: context.colors.white),
                                    ),
                                    spaceH10,
                                    Text(
                                      'đ',
                                      style: Styles.n18w7.copyWith(
                                          color: context.colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            spaceH30,
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => const AddVayNow()));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(top: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      gradient: LinearGradient(
                                          colors: [
                                            context.colors.white,
                                            context.colors.white
                                          ],
                                          begin:
                                              const FractionalOffset(0.0, 0.0),
                                          end: const FractionalOffset(1.0, 0.0),
                                          stops: const [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Lấy nó ngay',
                                      style: Styles.n16b.copyWith(
                                          color: context.colors.hF05D0E
                                              .withOpacity(0.7)),
                                    ),
                                  ),
                                  Positioned(
                                      top: 4,
                                      right: 0,
                                      child: Container(
                                        height: 20,
                                        padding: const EdgeInsets.all(6).add(
                                            const EdgeInsets.symmetric(
                                                horizontal: 2)),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFE7D384),
                                                Color(0xFFEFE2AF)
                                              ],
                                              begin: FractionalOffset(0.0, 0.0),
                                              end: FractionalOffset(1.0, 0.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Vay thành công 85%',
                                          style: Styles.n10.copyWith(
                                              color: const Color(0xFF625231)),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      spaceH12,
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(6)
                            .add(const EdgeInsets.symmetric(horizontal: 2)),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFFE7D384).withOpacity(0.1),
                                const Color(0xFFEFE2AF).withOpacity(0.2),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: const [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'VayNow không trực tiếp tham gia cho vay mà giới thiệu các sản\nphẩm tài chính an toàn và đáng tin cậy cho người dùng',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(6)
                            .add(const EdgeInsets.symmetric(horizontal: 2)),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFFE7D384).withOpacity(0.0),
                                const Color(0xFFEFE2AF).withOpacity(0.0),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: const [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.lock_clock_outlined,
                              color: context.colors.hF05D0E,
                              size: 12,
                            ),
                            spaceW6,
                            Text(
                              'Nền tảng này hứa hẹn bảo vệ tính bảo mật dữ liệu của\nbản và sẽ không phổ biến thông tin cá nhân của bạn',
                              style: Styles.n12v2
                                  .copyWith(color: const Color(0xFF625231)),
                            )
                          ],
                        ),
                      ),
                      spaceH10
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
