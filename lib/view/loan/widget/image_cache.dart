import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageCached extends StatelessWidget {
  final String imageUrl;
  final double? width, height;
  final BoxFit? fit;
  final double circular;

  const ImageCached({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.circular = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(circular),
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          progressIndicatorBuilder:
              (BuildContext context, String url, DownloadProgress progress) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                color: Colors.white,
              ),
            );
          }),
    );
  }
}
