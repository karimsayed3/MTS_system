import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

import '../../../../subscribers_screen/data/models/update_subscriber_request_body.dart';
import '../../../business_logic/review_data_cubit.dart';
import '../../../data/models/get_review_subscribers_plans.dart';

class ReviewDataCardMobile extends StatelessWidget {
  ReviewDataCardMobile({super.key, required this.reviewSubscriberData,required this.onPressed});

  final ReviewSubscriberData reviewSubscriberData;
  dynamic Function() onPressed;

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
                  text: reviewSubscriberData.name ?? "",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                DefaultText(
                  text: reviewSubscriberData.phoneNo ?? "",
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
                  reviewSubscriberData.notes ?? "",
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
                        onPressed: onPressed,
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
                        onPressed: () {
                          ReviewDataCubit.get(context).updateSubscriber(
                            updateSubscriberRequestBody:
                            UpdateSubscriberRequestBody(
                              oldPhone: reviewSubscriberData.phoneNo,
                              planName: reviewSubscriberData.companyPlanName,
                            ),
                          );
                        },
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
                    // horizontalSpace(5.w),
                    // Expanded(
                    //   child: DefaultButton(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 5.w,
                    //         vertical: 5.h),
                    //     color:
                    //     ColorsManager.lightRedColor,
                    //     onPressed: () {},
                    //     child: DefaultText(
                    //       text: 'حذف',
                    //       color:
                    //       ColorsManager.primaryColor,
                    //       // color: Color(0xFFCC232A),
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
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
                        text: reviewSubscriberData.systemPlanName ?? "",
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
                        text: reviewSubscriberData.companyPlanName ?? "",
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
