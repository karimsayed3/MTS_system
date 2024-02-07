import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class WithdrawnCustomersCardWidgetMobile extends StatefulWidget {
  const WithdrawnCustomersCardWidgetMobile({super.key});

  @override
  State<WithdrawnCustomersCardWidgetMobile> createState() => _WithdrawnCustomersCardWidgetMobileState();
}

class _WithdrawnCustomersCardWidgetMobileState extends State<WithdrawnCustomersCardWidgetMobile> {
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
              text: 'Super Flix 30',
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 140.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: '01156788394',
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                verticalSpace(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'تاريخ السحب: ',
                      color: ColorsManager.lightGray,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    DefaultText(
                      text: '04/06/2021',
                      color: ColorsManager.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
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
                  text: '35-',
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
