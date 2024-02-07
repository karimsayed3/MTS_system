import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class CollectorsCardWidgetMobile extends StatefulWidget {
  const CollectorsCardWidgetMobile({super.key});

  @override
  State<CollectorsCardWidgetMobile> createState() => _CollectorsCardWidgetMobileState();
}

class _CollectorsCardWidgetMobileState extends State<CollectorsCardWidgetMobile> {
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
              text: 'ابو خديجة',
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80.w,
            child:  Row(
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
                    text: '100000',
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
            width: 120.w,
            child: Column(
              children: [
                Row(
                  children: [
                    DefaultText(
                      text: 'كاش:',
                      color: ColorsManager.lightGray,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        DefaultText(
                          text: 'L.E',
                          color: ColorsManager.orangeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        horizontalSpace(5.w),
                        DefaultText(
                          text: '35',
                          color: ColorsManager.orangeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    DefaultText(
                      text: 'الاجمالي:',
                      color: ColorsManager.lightGray,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        DefaultText(
                          text: 'L.E',
                          color: ColorsManager.secondaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        horizontalSpace(5.w),
                        DefaultText(
                          text: '150',
                          color: ColorsManager.secondaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
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
