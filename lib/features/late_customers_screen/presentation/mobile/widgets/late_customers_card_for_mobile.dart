import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

import '../../../data/models/get_late_subscribers_response.dart';

class LateCustomersCardWidgetMobile extends StatefulWidget {
  const LateCustomersCardWidgetMobile({super.key, required this.subscriber});
  final LateSubscriberData subscriber;

  @override
  State<LateCustomersCardWidgetMobile> createState() => _LateCustomersCardWidgetMobileState();
}

class _LateCustomersCardWidgetMobileState extends State<LateCustomersCardWidgetMobile> {
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
            width: 130.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: widget.subscriber.name ?? "",
                  fontSize: 16.sp,
                  fontFamily: 'din',
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  children: [
                    DefaultText(
                      text: "التبعية:",
                      fontSize: 12.sp,
                      fontFamily: 'din',
                      color: ColorsManager.lightGray,
                      fontWeight: FontWeight.w400,
                    ),
                    Expanded(
                      child: DefaultText(
                        text: widget.subscriber.relatedTo ?? "",
                        fontSize: 12.sp,
                        fontFamily: 'din',
                        color: ColorsManager.lightGray,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 110.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: widget.subscriber.phoneNo ?? "",
                  color:widget.subscriber.monthsLate! > 1 && widget.subscriber.monthsLate! < 2? ColorsManager.secondaryColor: widget.subscriber.monthsLate! > 2? ColorsManager.orangeColor: ColorsManager.primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                DefaultText(
                  text: widget.subscriber.planName ?? "",
                  color: ColorsManager.lightGray,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 70.w,
            child: Row(
              children: [
                DefaultText(
                  text: 'L.E',
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                horizontalSpace(5.w),
                Expanded(
                  child: DefaultText(
                    text: widget.subscriber.balance.toString(),
                    color: ColorsManager.secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 20.w,
            child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/more.svg')),
          ),
        ],
      ),
    );
  }
}
