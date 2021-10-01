import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CustomFullScreenImageWidget extends StatefulWidget {
  final String ulr;

  CustomFullScreenImageWidget({
    required this.ulr,
  });

  @override
  _CustomFullScreenImageWidgetState createState() =>
      _CustomFullScreenImageWidgetState();
}

class _CustomFullScreenImageWidgetState
    extends State<CustomFullScreenImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Hero(
          tag: widget.ulr,
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(
              widget.ulr,
            ),
          ),
        ),
      ),
    );
  }
}
