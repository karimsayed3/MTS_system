import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/info_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/add_subsciber_widget.dart';
import 'package:system/features/subscribers_screen/presentation/mobile/widgets/subscribers_header_widget_mobile.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../desktop/widgets/bloc_listener.dart';
import '../widgets/subscribers_card_for_mobile.dart';

class SubscribersScreenMobile extends StatefulWidget {
  const SubscribersScreenMobile({super.key});

  @override
  State<SubscribersScreenMobile> createState() =>
      _SubscribersScreenMobileState();
}

class _SubscribersScreenMobileState extends State<SubscribersScreenMobile> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SubscribersCubit.get(context).getActiveSubscribers(
      getActiveSubscribersRequestBody: GetActiveSubscribersRequestBody(),
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
                      title: "المشتركين",
                    ),
                    Row(
                      children: [
                        InfoWidget(
                          color: const Color(0xffA92087),
                          text: 'خط محول',
                          textColor: const Color(0xFF969AB0),
                          fontSize: 16.sp,
                          containerHeight: 12.h,
                          containerWidth: 12.w,
                          horizontalWidth: 5.w,
                        ),
                        horizontalSpace(5.w),
                        ButtonWithTextAndImageWidget(
                          onPressed: () {
                            showDataAlert(
                              context: context,
                              child: BlocProvider.value(
                                value: getIt<SubscribersCubit>(),
                                child: const AddSubscriberWidget(),
                              ),
                            );
                          },
                          color: const Color(0xffebf5f6),
                          text: "+ اضافة مشترك",
                          fontSize: 16.sp,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          // image: "assets/images/plus.png",
                        ),
                      ],
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
                  searchController: searchController,
                  onChange: (value) {
                    SubscribersCubit.get(context).getActiveSubscribers(
                      getActiveSubscribersRequestBody: GetActiveSubscribersRequestBody(
                        phone: value,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SubscribersHeaderWidgetMobile(),
                    BlocBuilder<SubscribersCubit, SubscribersState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return  SubscribersCardWidgetMobile(
                                  subscriber: SubscribersCubit.get(context).subscribers[index],
                                );
                                // return const SizedBox.shrink();
                              },
                              itemCount: SubscribersCubit.get(context).subscribers.length),
                        );
                      },
                    ),
                    const BlocListenerForSubscribersCubit(),
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
