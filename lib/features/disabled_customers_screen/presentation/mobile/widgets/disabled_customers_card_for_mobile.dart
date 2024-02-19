import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class DisabledCustomersCardWidgetMobile extends StatefulWidget {
  const DisabledCustomersCardWidgetMobile({super.key});

  @override
  State<DisabledCustomersCardWidgetMobile> createState() => _DisabledCustomersCardWidgetMobileState();
}

class _DisabledCustomersCardWidgetMobileState extends State<DisabledCustomersCardWidgetMobile> {
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
                      text: 'تاريخ التعطيل: ',
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
            child: PopupMenuButton(
              surfaceTintColor: Colors.white,
              // icon: SvgPicture.asset('assets/icons/more.svg'),
              onSelected: (String choice) {
                // Handle menu item selection
                if (choice == 'option1') {
                  // Perform action for option 1
                  // showDataAlert(
                  //   context: context,
                  //   child: UpdateSubscriberWidget(
                  //     onPressed: () {},
                  //     // companyName: "شركة فودافون كفرالشيخ",
                  //   ),
                  // );
                } else if (choice == 'option2') {
                  // Perform action for option 2
                  // showDataAlert(
                  //   context: context,
                  //   child: DeleteCompanyWidget(
                  //     onPressed: () {},
                  //     companyName: "شركة فودافون كفرالشيخ",
                  //   ),
                  // );
                } else if (choice == 'option3') {
                  // Perform action for option 3
                  // showDataAlert(
                  //   context: context,
                  //   child: MakeZeroWidget(
                  //     onPressed: () {},
                  //     subscriberName: "كريم سيد ابراهيم عبدالتواب",
                  //   ),
                  // );
                }else if (choice == 'option4') {
                  // Perform action for option 3
                  // showDataAlert(
                  //   context: context,
                  //   child: MakeZeroWidget(
                  //     onPressed: () {},
                  //     subscriberName: "كريم سيد ابراهيم عبدالتواب",
                  //   ),
                  // );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 15.w,
                            child: SvgPicture.asset('assets/icons/disabled_icon.svg')),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'تفعيل',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 15.w,
                            child: SvgPicture.asset('assets/icons/edit.svg')),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'تعديل',
                          color: ColorsManager.darkBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15.w,
                          child: SvgPicture.asset(
                            'assets/icons/add_icon.svg',
                            color: ColorsManager.darkBlack,
                          ),
                        ),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'اضافة رصيد',
                          color: ColorsManager.darkBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option4',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15.w,
                          child: SvgPicture.asset(
                            'assets/icons/zero_icon.svg',
                            color: ColorsManager.darkBlack,
                          ),
                        ),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'تصفير',
                          color: ColorsManager.darkBlack,
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
          ),
        ],
      ),
    );
  }
}
