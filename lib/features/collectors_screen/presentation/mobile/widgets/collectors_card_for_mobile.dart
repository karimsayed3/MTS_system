import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/update_collector_widget.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';

import '../../../../../core/widgets/show_alert_dialog.dart';
import '../../desktop/widgets/delete_collector_widget.dart';

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
            child: PopupMenuButton(
              surfaceTintColor: Colors.white,
              // icon: SvgPicture.asset('assets/icons/more.svg'),
              onSelected: (String choice) {
                // Handle menu item selection
                if (choice == 'option1') {
                  // Perform action for option 1
                  showDataAlert(
                    context: context,
                    child: UpdateCollectorWidget(
                      onPressed: () {},
                      name: "كريم سيد ابراهيم عبدالتواب",
                      email: "abokhadiga6@gmail.com",
                    ),
                  );
                } else if (choice == 'option2') {
                  // Perform action for option 2
                  showDataAlert(
                    context: context,
                    child: DeleteCollectorWidget(
                      onPressed: () {},
                      collectorName: "كريم سيد ابراهيم عبدالتواب",
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 15.w,
                            child: SvgPicture.asset('assets/icons/edit.svg')),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'تعديل المحصل',
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
                            child: SvgPicture.asset('assets/icons/remove.svg',color: ColorsManager.primaryColor,)),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'حذف المحصل',
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
          ),
        ],
      ),
    );
  }
}
