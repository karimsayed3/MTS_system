import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/review_data_screen/presentation/mobile/widgets/review_data_card.dart';

import '../../../business_logic/review_data_cubit.dart';

class ReviewDataScreenMobile extends StatefulWidget {
  const ReviewDataScreenMobile({super.key});

  @override
  State<ReviewDataScreenMobile> createState() => _ReviewDataScreenMobileState();
}

class _ReviewDataScreenMobileState extends State<ReviewDataScreenMobile> {


  @override
  void initState() {
    // TODO: implement initState
    ReviewDataCubit.get(context).reviewSubscriberData = [];
    super.initState();
  }


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
                      title: "مراجعة البيانات",
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
                    // const DisabledCustomersHeaderWidgetMobile(),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          // return const DisabledCustomersCardWidgetMobile();
                          return const ReviewDataCardMobile();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: 10,
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
