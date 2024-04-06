import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/review_data_screen/presentation/mobile/widgets/review_data_card.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/button_with_text_and_image.dart';
import '../../../business_logic/review_data_cubit.dart';
import '../../../business_logic/review_data_state.dart';
import '../../desktop/widgets/bloc_listener_for_review_data_cubit.dart';

class ReviewDataScreenMobile extends StatefulWidget {
  const ReviewDataScreenMobile({super.key});

  @override
  State<ReviewDataScreenMobile> createState() => _ReviewDataScreenMobileState();
}

class _ReviewDataScreenMobileState extends State<ReviewDataScreenMobile> {

  dynamic result;

  String filePath = "";

  @override
  void initState() {
    // TODO: implement initState
    ReviewDataCubit
        .get(context)
        .reviewSubscriberData = [];
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleForScreenWithWidget(
                      title: "مراجعة البيانات",
                    ),
                    ButtonWithTextAndImageWidget(
                      onPressed: () async {
                        // createExcelForActiveSubscribers(
                        //     data: SubscribersCubit.get(context).subscribers
                        // );
                        filePath = await selectFileFromDesktop();
                        print(filePath);

                        setState(() {});
                        // print(filePath);
                        // result = await pickFileFromWindows();
                        if (filePath.isNotEmpty) {
                          ReviewDataCubit.get(context)
                              .reviewSubscribersPlans(
                            excel: File(filePath),
                          );
                        } else {}
                        // ReviewDataCubit.get(context).reviewSubscribersPlans(files: files);
                      },
                      color: const Color(0xffebf5f6),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      image: 'assets/icons/excel.svg',
                      fontSize: 16.sp,
                      text: "رفع اكسيل",
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
                    BlocBuilder<ReviewDataCubit, ReviewDataState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              // return const DisabledCustomersCardWidgetMobile();
                              return ReviewDataCardMobile(
                                onPressed: () {
                                  ReviewDataCubit.get(context).deleteItem("phoneNo", ReviewDataCubit.get(context)
                                      .reviewSubscriberData[index].phoneNo);
                                  setState(() {

                                  });
                                },
                                reviewSubscriberData: ReviewDataCubit
                                    .get(context)
                                    .reviewSubscriberData[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: ReviewDataCubit
                                .get(context)
                                .reviewSubscriberData.length,
                          ),
                        );
                      },
                    ),
                    const BlocListenerForReviewSubscribersCubit(),
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
