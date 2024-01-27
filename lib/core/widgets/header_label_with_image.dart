import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/widgets/default_text.dart';

class HeaderLabelWithImage extends StatelessWidget {
  const HeaderLabelWithImage(
      {super.key,
        required this.width,
        required this.image,
        required this.title,
      });

  final double width;
  final String image;

  final String title;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: dimension.width10,
            height: dimension.height10,
            child: Image(
              image: AssetImage(image),
              color: Colors.black,
              width: dimension.reduce10,
            ),
          ),
          DefaultText(
            text: title,
            fontSize: dimension.reduce15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
