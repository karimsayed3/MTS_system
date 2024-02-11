import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class ReviewDataCardMobile extends StatelessWidget {
  const ReviewDataCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: "عبدالرحمن العبدالله",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                DefaultText(
                  text: "01156788394",
                  fontSize: 16.sp,
                  color: ColorsManager.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
                verticalSpace(10.h),
                DefaultText(
                  text: 'ملاحظات:',
                  color: ColorsManager.lightGray,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                DefaultText(
                  text:
                  "لوريم ابسيوم دولر لوريم ابسيوم دولر لوريم ابسيوم دولر",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                verticalSpace(10.h),
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DefaultButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 5.h),
                        color: ColorsManager.lightYellowColor,
                        onPressed: () {},
                        child: DefaultText(
                          text: 'تغاضى',
                          color: const Color(0xFFFFA800),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    horizontalSpace(5.w),
                    Expanded(
                      child: DefaultButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 5.h),
                        color:
                        ColorsManager.lightBlueColor,
                        onPressed: () {},
                        child: DefaultText(
                          text: 'تنفيذ التعديل',
                          color: ColorsManager
                              .secondaryColor,
                          // color: Color(0xFFCC232A),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    horizontalSpace(5.w),
                    Expanded(
                      child: DefaultButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 5.h),
                        color:
                        ColorsManager.lightRedColor,
                        onPressed: () {},
                        child: DefaultText(
                          text: 'حذف',
                          color:
                          ColorsManager.primaryColor,
                          // color: Color(0xFFCC232A),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          horizontalSpace(5.w),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 5.w,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightBlueColor,
                    borderRadius:
                    BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        text: "الباقة فالمنظومة",
                        color: ColorsManager.lightGray,
                        fontSize: 10.sp,
                      ),
                      DefaultText(
                        text: 'Super Flix 30',
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ),
                verticalSpace(10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 5.w,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightBlueColor,
                    borderRadius:
                    BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        text: "الباقة فالشركة",
                        color: ColorsManager.lightGray,
                        fontSize: 10.sp,
                      ),
                      DefaultText(
                        text: 'Super Flix 30',
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
