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
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
              assetName,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
