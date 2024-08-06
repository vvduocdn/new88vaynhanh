import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new88_vaynow/component/theme.dart';

class AvatarUtils {
  static dynamic buildAvatar(String? avatarUrl, String? name, double? size,
      double? fonts, Color color) {
    return avatarUrl!.isEmpty
        ? ImagePlaceHolder(
            heightWeight: size ?? 32,
            name: name!.isEmpty ? 'n' : name,
            fontSize: fonts,
            color: color,
          )
        : _sizedContainer(
            Hero(
              tag: avatarUrl,
              child: CachedNetworkImage(
                imageUrl: avatarUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: size ?? 32,
                  height: size ?? 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                          width: 1.4,
                          color: const Color.fromRGBO(241, 126, 126, 1)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100.0))),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => ImagePlaceHolder(
                  heightWeight: size ?? 32,
                  name: name ?? 'n',
                  fontSize: fonts,
                  color: color,
                ),
              ),
            ),
            size,
            size);
  }

  static Widget _sizedContainer(Widget child, double? w, double? h) {
    return SizedBox(
      width: h ?? 32,
      height: h ?? 32,
      child: Center(child: child),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? name;
  final double? heightWeight;
  final double? fontSize;
  final Color? color;
  const ImagePlaceHolder(
      {super.key,
      this.name,
      this.heightWeight = 32,
      this.fontSize,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightWeight,
      width: heightWeight,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        name!.substring(0, 1).toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize ?? 22,
            color: Colors.black), // Set text color to dark tone
      ),
    );
  }

  Color randomLightColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(128) + 128,
      random.nextInt(128) + 128,
      random.nextInt(128) + 128,
      1.0,
    );
  }
}
