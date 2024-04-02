import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/default_text.dart';

class TitleForScreenWithWidget extends StatelessWidget {
  const TitleForScreenWithWidget({super.key, required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          // decoration: ShapeDecoration(
          //   image: const DecorationImage(
          //     image:
          //     AssetImage('assets/images/vodafone-logo.png'),
          //     fit: BoxFit.contain,
          //   ),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          // ),
        ),
        horizontalSpace(10.w),
        DefaultText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
