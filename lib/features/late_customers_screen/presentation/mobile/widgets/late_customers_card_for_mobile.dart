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
            child: DefaultText(
              text: widget.subscriber.name ?? "",
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 110.w,
            child: DefaultText(
              text: widget.subscriber.phoneNo ?? "",
              color: ColorsManager.secondaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
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
                DefaultText(
                  text: widget.subscriber.balance.toString(),
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
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
