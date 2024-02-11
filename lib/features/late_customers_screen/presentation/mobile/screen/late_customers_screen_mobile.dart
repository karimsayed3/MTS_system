import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/late_customers_screen/presentation/mobile/widgets/late_customers_header_widget_mobile.dart';
import 'package:system/features/late_customers_screen/presentation/mobile/widgets/late_customers_info_widget.dart';
import '../widgets/late_customers_card_for_mobile.dart';

class LateCustomersScreenMobile extends StatelessWidget {
  const LateCustomersScreenMobile({super.key});

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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleForScreenWithWidget(
                      title: "المتأخرين",
                    ),
                    LateCustomersInfoWidget(),
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
                    const LateCustomersHeaderWidgetMobile(),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return const LateCustomersCardWidgetMobile();
                          // return const SizedBox.shrink();
                        },
                        itemCount: 20,
                      ),
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