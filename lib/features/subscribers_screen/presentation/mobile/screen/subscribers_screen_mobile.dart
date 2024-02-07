import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/info_widget.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/subscribers_screen/presentation/mobile/widgets/subscribers_header_widget_mobile.dart';

import '../widgets/subscribers_card_for_mobile.dart';

class SubscribersScreenMobile extends StatelessWidget {
  const SubscribersScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.lighterGray,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                color: Colors.transparent,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleForScreenWithWidget(
                      title: "المشتركين",
                    ),
                    InfoWidget(
                      color:  const Color(0xffA92087),
                      text: 'خط محول',
                      textColor: const Color(0xFF969AB0),
                      fontSize: 16.sp,
                      containerHeight: 12.h,
                      containerWidth: 12.w,
                      horizontalWidth: 5.w,
                    ),
                  ],
                ),
              ),
              Container(
                // height: 80.h,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                // color: Colors.blueAccent,
                child: CustomSearchWidget(
                  width: double.infinity,
                  searchController: TextEditingController(),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SubscribersHeaderWidgetMobile(),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return const SubscribersCardWidgetMobile();
                            // return const SizedBox.shrink();
                          },
                          itemCount: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
