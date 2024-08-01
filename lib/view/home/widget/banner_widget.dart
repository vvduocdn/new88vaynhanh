import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'package:new88_vaynow/utils/device_util.dart';
import 'package:new88_vaynow/utils/spaces.dart';
import 'package:new88_vaynow/view/loan/widget/image_cache.dart';
import 'package:new88_vaynow/view_model/home_bloc/home_bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

//inoge
class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final adsEvent = <String>[
    'https://cdn.xtmobile.vn/vnt_upload/news/01_2024/24/app-vay-tien-online-xtmobile.jpg',
    'https://unaids.org.vn/wp-content/uploads/2023/03/app-vay-tien-1.jpg',
    'https://www.tcqtkd.edu.vn/wp-content/uploads/2023/03/App-vay-tien-uy-tin-4.png'
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Không thể mở URL $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 100 * DeviceUtils.getScreenHeight(context),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 10,
                decoration: BoxDecoration(
                    color: context.colors.hF05D0E,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              spaceW10,
              Expanded(
                  child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            child: ImageCached(
                              height: double.infinity,
                              width: double.infinity,
                              imageUrl: adsEvent[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  autoplay: true,
                  loop: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  pagination: SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperCustomPagination(
                      builder:
                          (BuildContext context, SwiperPluginConfig config) {
                        return Stack(
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: const DotSwiperPaginationBuilder(
                                      color: Colors.transparent,
                                      activeColor: Colors.transparent,
                                      size: 6.0,
                                      activeSize: 6.0,
                                    ).build(context, config),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              )),
              spaceW10,
              Container(
                height: double.infinity,
                width: 10,
                decoration: BoxDecoration(
                    color: context.colors.hF05D0E,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
              )
            ],
          ),
        );
      },
    );
  }
}
