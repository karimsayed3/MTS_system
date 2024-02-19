import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_state.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_request_body.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/add_bunch_widget.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/bloc_listener_for_bunch_cubit.dart';

import '../widgets/bunch_card_for_mobile.dart';
import '../widgets/bunch_header_widget_mobile.dart';

class BunchScreenMobile extends StatefulWidget {
  const BunchScreenMobile({super.key});

  @override
  State<BunchScreenMobile> createState() => _BunchScreenMobileState();
}

class _BunchScreenMobileState extends State<BunchScreenMobile> {
  @override
  void initState() {
    // TODO: implement initState
    BunchCubit.get(context).getPlans(
      getPlansRequestBody: GetPlansRequestBody(
        companyName: "",
        planName: "",
      ),
    );
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
                      title: "الباقات",
                    ),
                    ButtonWithTextAndImageWidget(
                      onPressed: () {
                        showDataAlert(
                          context: context,
                          child: BlocProvider.value(
                            value: getIt<BunchCubit>(),
                            child: AddBunchWidget(
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
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
                  searchController: BunchCubit.get(context).searchController,
                ),
              ),
              const BlocListenerForBunchCubit(),
              Expanded(
                child: Column(
                  children: [
                    const BunchHeaderWidgetMobile(),
                    BlocBuilder<BunchCubit, BunchState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return BunchCardWidgetMobile(
                                  planData:
                                      BunchCubit.get(context).plansData[index],
                                );
                                // return const SizedBox.shrink();
                              },
                              itemCount:
                                  BunchCubit.get(context).plansData.length),
                        );
                      },
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
