import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/bloc_listener.dart';

import '../../../../subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';
import '../widgets/withdrawn_customers_card_for_mobile.dart';
import '../widgets/withdrawn_customers_header_widget_mobile.dart';

class WithdrawnCustomersScreenMobile extends StatefulWidget {
  const WithdrawnCustomersScreenMobile({super.key});

  @override
  State<WithdrawnCustomersScreenMobile> createState() =>
      _WithdrawnCustomersScreenMobileState();
}

class _WithdrawnCustomersScreenMobileState
    extends State<WithdrawnCustomersScreenMobile> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SubscribersCubit.get(context).getWithdrawnSubscribers(
        getWithdrawnSubscribersRequestBody:
        GetWithdrawnSubscribersRequestBody());
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
                      title: "المسحوبين",
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
                    SubscribersCubit.get(context).getWithdrawnSubscribers(
                        getWithdrawnSubscribersRequestBody:
                        GetWithdrawnSubscribersRequestBody(
                            phone: value
                        ));
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const WithdrawnCustomersHeaderWidgetMobile(),
                    BlocBuilder<SubscribersCubit, SubscribersState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return WithdrawnCustomersCardWidgetMobile(
                                withdrawnSubscriberData:  SubscribersCubit.get(context).withdrawSubscribers[index],
                              );
                              // return const SizedBox.shrink();
                            },
                            itemCount: SubscribersCubit.get(context).withdrawSubscribers.length,
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
