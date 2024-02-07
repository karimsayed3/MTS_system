import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class HeaderLabelWithImageMobile extends StatelessWidget {
  const HeaderLabelWithImageMobile(
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
    return SizedBox(
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
            height: 15.h,
            child: Image(
              image: AssetImage(image),
              color: ColorsManager.lightGray,
              width: 15.w,
            ),
          ),
          horizontalSpace(5.w),
          DefaultText(
            text: title,
            fontSize: 14.sp,
            color: ColorsManager.lightGray,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
