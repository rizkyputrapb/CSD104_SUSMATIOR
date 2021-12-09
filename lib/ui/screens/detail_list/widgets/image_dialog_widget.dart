import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  ImageDialog({
    Key? key,
    required this.assetName,
  }) : super(key: key);
  String assetName;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Hero(
        tag: assetName,
        child: CachedNetworkImage(
          imageUrl: assetName,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
