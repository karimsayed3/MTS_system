import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/default_text.dart';

class HistoryOperationsCardWidgetMobile extends StatelessWidget {
  const HistoryOperationsCardWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
      // height: 70.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(
                color: ColorsManager.lightGray,
              )
          )
      ),
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: DefaultText(
              text: 'ابو خديجة',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 110.w,
            child:  DefaultText(
              text: '01156788394',
              color: ColorsManager.secondaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 130.w,
            child: DefaultText(
              text: 'اضافة رصيد',
              color: ColorsManager.orangeColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
