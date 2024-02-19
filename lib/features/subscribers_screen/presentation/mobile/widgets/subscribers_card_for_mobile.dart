import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/make_zero_widget.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';

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
            width: 110.w,
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
            width: 125.w,
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
            width: 30.w,
            child: PopupMenuButton(
              surfaceTintColor: Colors.white,
              // icon: SvgPicture.asset('assets/icons/more.svg'),
              onSelected: (String choice) {
                // Handle menu item selection
                if (choice == 'option1') {
                  // Perform action for option 1
                  showDataAlert(
                    context: context,
                    child: UpdateSubscriberWidget(
                      onPressed: () {},
                      // companyName: "شركة فودافون كفرالشيخ",
                    ),
                  );
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
                  showDataAlert(
                    context: context,
                    child: MakeZeroWidget(
                      onPressed: () {},
                      subscriberName: "كريم سيد ابراهيم عبدالتواب",
                    ),
                  );
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
                          text: 'تعديل مشترك',
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
                  value: 'option3',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
