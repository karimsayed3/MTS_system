import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class SubscribersCardWidgetMobile extends StatefulWidget {
  const SubscribersCardWidgetMobile({super.key});

  @override
  State<SubscribersCardWidgetMobile> createState() =>
      _SubscribersCardWidgetMobileState();
}

class _SubscribersCardWidgetMobileState
    extends State<SubscribersCardWidgetMobile> {
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
              text: 'كريم سيد ابراهيم',
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 100.w,
            child: DefaultText(
              text: '01156788394',
              color: ColorsManager.secondaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 130.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DefaultText(
                      text: ' L.E',
                      color: Color(0xFFCC232A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    DefaultText(
                      text: ' 15-',
                      color: Color(0xFFCC232A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: "اخر رصيد موجب:",
                      color: ColorsManager.lightGray,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          text: ' L.E',
                          color: ColorsManager.lightGray,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        DefaultText(
                          text: ' 33',
                          color: ColorsManager.lightGray,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 10.w,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                  height: 30.h,
                  width: 10.w,
                  child: SvgPicture.asset('assets/icons/more.svg',fit: BoxFit.fill,)),
            ),
          ),
        ],
      ),
    );
  }
}
