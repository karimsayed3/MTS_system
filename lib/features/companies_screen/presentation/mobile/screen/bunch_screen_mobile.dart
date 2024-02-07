import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';

import '../widgets/bunch_card_for_mobile.dart';
import '../widgets/bunch_header_widget_mobile.dart';

class BunchScreenMobile extends StatelessWidget {
  const BunchScreenMobile({super.key});

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleForScreenWithWidget(
                      title: "الباقات",
                    ),
                    ButtonWithTextAndImageWidget(
                      onPressed: () {},
                      color: const Color(0xffebf5f6),
                      text: "+ اضافة باقة",
                      fontSize: 16.sp,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      // image: "assets/images/plus.png",
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
                    const BunchHeaderWidgetMobile(),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return const BunchCardWidgetMobile();
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
