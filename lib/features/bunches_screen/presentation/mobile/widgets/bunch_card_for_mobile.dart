import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/data/models/delete_plan_request_body.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/delete_bunch_widget.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/update_bunch_widget.dart';

import '../../../data/models/get_plans_response.dart';

class BunchCardWidgetMobile extends StatefulWidget {
  const BunchCardWidgetMobile({super.key, required this.planData});


  final PlanData planData;
  @override
  State<BunchCardWidgetMobile> createState() => _BunchCardWidgetMobileState();
}

class _BunchCardWidgetMobileState extends State<BunchCardWidgetMobile> {
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
            width: 130.w,
            child: DefaultText(
              text: widget.planData.name ?? '',
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                DefaultText(
                  text: 'L.E',
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                horizontalSpace(5.w),
                DefaultText(
                  text: widget.planData.price.toString(),
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 100.w,
            child: DefaultText(
              text: widget.planData.subscribersCount.toString(),
              color: ColorsManager.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          PopupMenuButton(
            // icon: SvgPicture.asset('assets/icons/more.svg'),
            onSelected: (String choice) {
              // Handle menu item selection
              if (choice == 'option1') {
                // Perform action for option 1
                showDataAlert(
                  context: context,
                  child: UpdateBunchWidget(
                    onPressed: () {},
                    companyName: widget.planData.companyName ?? '',
                    bunchName: widget.planData.name ?? '',
                    bunchPrice: widget.planData.price!,
                    planId: widget.planData.planID!,
                  ),
                );
              } else if (choice == 'option2') {
                // Perform action for option 2
                showDataAlert(
                    context: context,
                    child: DeleteBunchWidget(
                      onPressed: () {
                        BunchCubit.get(context).deletePlan(deletePlanRequestBody: DeletePlanRequestBody(
                          planID: widget.planData.planID!,
                        ));
                      },
                      bunchName: widget.planData.name ?? '',
                    ));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 15.w,
                          child: SvgPicture.asset('assets/icons/edit.svg')),
                      horizontalSpace(10.w),
                      DefaultText(
                        text: 'تعديل الباقة',
                        color: ColorsManager.darkBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15.w,
                        child: SvgPicture.asset(
                          'assets/icons/remove.svg',
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                      horizontalSpace(10.w),
                      DefaultText(
                        text: 'حذف الباقة',
                        color: ColorsManager.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ),
              // Add more PopupMenuItem widgets for additional options
            ],
            child: SvgPicture.asset('assets/icons/more.svg'),
          ),
        ],
      ),
    );
  }
}
