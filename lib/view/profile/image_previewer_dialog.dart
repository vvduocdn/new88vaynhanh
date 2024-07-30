import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new88_vaynow/utils/spaces.dart';

class ImagePreviewerDialog extends StatefulWidget {
  final String? url;
  final String? name;

  const ImagePreviewerDialog({
    super.key,
    required this.url,
    required this.name,
  });

  @override
  State<ImagePreviewerDialog> createState() => _ImagePreviewerDialogState();
}

class _ImagePreviewerDialogState extends State<ImagePreviewerDialog> {
  bool isHeaderVisible = true;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isHeaderVisible = !isHeaderVisible;
              });
            },
            child: Hero(
              tag: widget.url!,
              child: InteractiveViewer(
                  minScale: 0.1,
                  maxScale: 4.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: widget.url!,
                    ),
                  )),
            ),
          ),
          if (isHeaderVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  children: [
                    spaceW10,
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
