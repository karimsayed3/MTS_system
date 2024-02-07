import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class CompaniesCardWidgetMobile extends StatefulWidget {
  const CompaniesCardWidgetMobile({super.key});

  @override
  State<CompaniesCardWidgetMobile> createState() => _CompaniesCardWidgetMobileState();
}

class _CompaniesCardWidgetMobileState extends State<CompaniesCardWidgetMobile> {
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
            width: 180.w,
            child: DefaultText(
              text: 'شركة فودافون كفرالشيخ',
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 120.w,
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 5.h),
                  decoration: BoxDecoration(
                      color:const Color(0xffebf5f6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: DefaultText(
                      text: '20',
                      color: ColorsManager.darkBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 50.w,
            child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/more.svg')),
          ),
        ],
      ),
    );
  }
}
