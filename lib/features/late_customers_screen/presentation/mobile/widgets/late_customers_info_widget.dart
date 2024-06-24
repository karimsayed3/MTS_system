import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/info_widget.dart';

class LateCustomersInfoWidget extends StatelessWidget {
  const LateCustomersInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoWidget(
          color: const Color(0xFFCC232A),
          text: 'اكتر من سعر باقتة',
          textColor: const Color(0xFF969AB0),
          fontSize: 10.sp,
          containerHeight: 12.h,
          containerWidth: 12.w,
          horizontalWidth: 5.w,
        ),
        verticalSpace(5.h),
        Row(
          children: [
            InfoWidget(
              color: const Color(0xFF007C92),
              text: 'علية اكتر من شهر',
              textColor: const Color(0xFF969AB0),
              fontSize: 10.sp,
              containerHeight: 12.h,
              containerWidth: 12.w,
              horizontalWidth: 5.w,
            ),
            horizontalSpace(10.w),
            InfoWidget(
              color: const Color(0xFFFFA800),
              text: 'علية اكتر من شهرين',
              textColor: const Color(0xFF969AB0),
              fontSize: 10.sp,
              containerHeight: 12.h,
              containerWidth: 12.w,
              horizontalWidth: 5.w,
            ),
          ],
        ),
      ],
    );
  }
}
