import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_response.dart';

import '../../../../../core/routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/custom_navigation_bar_widget.dart';
import '../../../../../core/widgets/default_text.dart';
import '../../../../../create_pdf.dart';

class HistoryOperationsCardWidgetMobile extends StatelessWidget {
  const HistoryOperationsCardWidgetMobile(
      {super.key, required this.loggedOperation});

  final LoggedOperation loggedOperation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      // height: 70.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(
            color: ColorsManager.lightGray,
          ))),
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: DefaultText(
              text: loggedOperation.subscriberName ?? '',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 110.w,
            child: DefaultText(
              text: loggedOperation.phoneNo ?? '',
              color: ColorsManager.secondaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 130.w,
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                DefaultText(
                  text: loggedOperation.operationType ?? '',
                  color: ColorsManager.orangeColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    navigateToPage(Routes.printerScreen, arguments: {
                      'imgPath': await createPdfReceiptForMobile(
                        context: context,
                        phoneNumber: loggedOperation.phoneNo ?? "",
                        date: convertDateToString(
                            loggedOperation.operationDate ?? ""),
                        planType: loggedOperation.planName ?? "",
                        balance:
                            loggedOperation.balanceBeforeOperation.toString(),
                        paidMoney: loggedOperation.addedAmount.toString(),
                        collectType: loggedOperation.collectType ?? "",
                      ),
                    });
                  },
                  child: Container(
                    width: 40.w,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset('assets/icons/printer.svg'),
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
