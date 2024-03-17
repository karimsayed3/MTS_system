import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text.dart';
import '../../../data/models/approve_or_decline_request_body.dart';
import '../../../data/models/get_collector_requests_response.dart';

class ResellersRequestCardWidget extends StatelessWidget {
  const ResellersRequestCardWidget({super.key, required this.requestData});

  final RequestData requestData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: requestData.name ?? "",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: requestData.phoneNo ?? "",
                      fontSize: 16.sp,
                      color: ColorsManager.secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    DefaultText(
                      text: "التسجيل:",
                      color: ColorsManager.lightGray,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    DefaultText(
                      text: requestData.requestDate != null
                          ? convertDateToString(requestData.requestDate)
                          : "",
                      fontSize: 16.sp,
                      color: ColorsManager.secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                verticalSpace(5.h),
                Row(
                  children: [
                    DefaultText(
                      text: 'الحساب:',
                      color: ColorsManager.lightGray,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    horizontalSpace(10.w),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text: "L.E",
                          fontSize: 16.sp,
                          color: ColorsManager.secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        DefaultText(
                          text: requestData.balance.toString(),
                          fontSize: 16.sp,
                          color: ColorsManager.secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ))
                  ],
                ),
                verticalSpace(5.h),
                Row(
                  children: [
                    DefaultText(
                      text: 'التبعية:',
                      color: ColorsManager.lightGray,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    horizontalSpace(10.w),
                    DefaultText(
                      text: requestData.relatedTo ?? "",
                      fontSize: 16.sp,
                      color: ColorsManager.darkBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                verticalSpace(10.h),
                Row(
                  children: [
                    DefaultText(
                      text: 'الطلب:',
                      color: ColorsManager.lightGray,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    horizontalSpace(10.w),
                    DefaultText(
                      text: requestData.requestType ?? "",
                      fontSize: 16.sp,
                      color: ColorsManager.orangeColor,
                      fontWeight: FontWeight.w500,
                    ),
                    horizontalSpace(5.w),
                    SvgPicture.asset(
                      'assets/icons/edit.svg',
                      color: ColorsManager.lightGray,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: requestData.actionDate != null
                          ? convertDateToString(requestData.actionDate)
                          : "",
                      color: ColorsManager.secondaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    // horizontalSpace(10.w),
                    // DefaultText(
                    //   text: "09:42:00 AM",
                    //   fontSize: 14.sp,
                    //   color: ColorsManager.lightGray,
                    //   fontWeight: FontWeight.w500,
                    // ),
                  ],
                )
              ],
            ),
          ),
          horizontalSpace(5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightBlueColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: "القيمة الجديدة",
                            color: ColorsManager.lightGray,
                            fontSize: 10.sp,
                          ),
                          DefaultText(
                            text: requestData.newValue ?? "",
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightBlueColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: "القيمة القديمة",
                            color: ColorsManager.lightGray,
                            fontSize: 10.sp,
                          ),
                          DefaultText(
                            text: requestData.oldValue ?? "",
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                requestData.requestStatus == "منتظر تصديق"
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DefaultButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5.h),
                              color: ColorsManager.lightBlueColor,
                              onPressed: () {
                                CollectorsRequestsCubit.get(context)
                                    .approveRequest(
                                        approveOrDeclineRequestBody:
                                            ApproveOrDeclineRequestBody(
                                  requestID: requestData.requestID!,
                                ));
                              },
                              child: DefaultText(
                                text: 'تنفيذ',
                                color: ColorsManager.secondaryColor,
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
                                  horizontal: 5.w, vertical: 5.h),
                              color: ColorsManager.lightRedColor,
                              onPressed: () {
                                CollectorsRequestsCubit.get(context)
                                    .declineRequest(
                                        approveOrDeclineRequestBody:
                                            ApproveOrDeclineRequestBody(
                                  requestID: requestData.requestID!,
                                ));
                              },
                              child: DefaultText(
                                text: 'الغاء',
                                color: ColorsManager.primaryColor,
                                // color: Color(0xFFCC232A),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
