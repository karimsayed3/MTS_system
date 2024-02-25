import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/custom_search_widget.dart';
import '../../../../../core/widgets/title_of_screen_with_logo_widget.dart';
import '../widgets/resellers_request_card_widget.dart';

class ResellersRequestsScreen extends StatelessWidget {
  const ResellersRequestsScreen({super.key});

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
                child:   const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleForScreenWithWidget(
                      title: "طلبات المحصلون",
                    ),
                    // LateCustomersInfoWidget(),
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
                    // const HistoryOperationsHeaderMobile(),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return const ResellersRequestCardWidget();
                          // return const SizedBox.shrink();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
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
