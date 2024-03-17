import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/bloc_listener.dart';
import '../../../../subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import '../widgets/disabled_customers_card_for_mobile.dart';
import '../widgets/disabled_customers_header_widget_mobile.dart';

class DisabledCustomersScreenMobile extends StatefulWidget {
  const DisabledCustomersScreenMobile({super.key});

  @override
  State<DisabledCustomersScreenMobile> createState() =>
      _DisabledCustomersScreenMobileState();
}

class _DisabledCustomersScreenMobileState
    extends State<DisabledCustomersScreenMobile> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SubscribersCubit.get(context).getDisabledSubscribers(
        getDisabledSubscribersRequestBody: GetDisabledSubscribersRequestBody());
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
                      title: "المعطلين",
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
                  searchController: searchController,
                  onChange: (value) {
                    SubscribersCubit.get(context).getDisabledSubscribers(
                      getDisabledSubscribersRequestBody:
                          GetDisabledSubscribersRequestBody(phone: value),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const DisabledCustomersHeaderWidgetMobile(),
                    BlocBuilder<SubscribersCubit, SubscribersState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return DisabledCustomersCardWidgetMobile(
                                subscriber: SubscribersCubit.get(context)
                                    .disableSubscribers[index],
                              );
                              // return const SizedBox.shrink();
                            },
                            itemCount: SubscribersCubit.get(context)
                                .disableSubscribers
                                .length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const BlocListenerForSubscribersCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
