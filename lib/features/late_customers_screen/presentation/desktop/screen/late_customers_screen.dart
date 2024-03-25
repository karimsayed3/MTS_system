import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/info_widget.dart';
import 'package:system/core/widgets/screen_title_widget.dart';
import 'package:system/core/widgets/search_with_filter_widget.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/Information_widget.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/create_excel.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/late_customers_header_widget.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/late_customrers_card.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/bloc_listener.dart';

class LateCustomersScreen extends StatefulWidget {
  const LateCustomersScreen({super.key});

  @override
  State<LateCustomersScreen> createState() => _LateCustomersScreenState();
}

class _LateCustomersScreenState extends State<LateCustomersScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SubscribersCubit.get(context).subscribers = [];
    // SubscribersCubit.get(context).changeListData(subscribers: []);
    SubscribersCubit.get(context).lateSubscribers = [];
    SubscribersCubit.get(context).getLateSubscribers(
      getLateSubscribersRequestBody: GetLateSubscribersRequestBody(),
    );
  }

  SubscribersCubit? _subscribersCubit;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _subscribersCubit ??= BlocProvider.of<SubscribersCubit>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    // Clear the companiesData list
    // _subscribersCubit!.changeListData(subscribers: []);
    // _subscribersCubit!.subscribers = [];

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var dimension = Dimensions(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitleWidget(
                coloredTitle: 'العملاء',
                title: 'المتأخرين',
              ),
              verticalSpace(dimension.height5),
              HomeWidget(
                horizontal: dimension.width10,
                vertical: dimension.height10,
                height: MediaQuery.of(context).size.height * .72,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const SubscribersSearchWidget(),
                        SearchWithFilterButtonWidget(
                          onTap: () {},
                          searchController: searchController,
                          onChange: (value) {
                            SubscribersCubit.get(context).getLateSubscribers(
                              getLateSubscribersRequestBody:
                                  GetLateSubscribersRequestBody(
                                name: value,
                              ),
                            );
                          },
                        ),
                        ButtonWithTextAndImageWidget(
                          onPressed: () {
                            createExcelForLateSubscribers(
                              data: SubscribersCubit.get(context).lateSubscribers,
                            );
                          },
                          color: const Color(0xffebf5f6),
                          image: 'assets/icons/excel.svg',
                          text: "تنزيل اكسيل",
                        ),
                      ],
                    ),
                    verticalSpace(dimension.height10),
                    const LateCustomersHeaderWidget(),
                    BlocBuilder<SubscribersCubit, SubscribersState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return LateCustomersCard(
                                  subscriber: SubscribersCubit.get(context)
                                      .lateSubscribers[index]);
                            },
                            itemCount: SubscribersCubit.get(context)
                                .lateSubscribers
                                .length,
                          ),
                        );
                      },
                    ),
                    const BlocListenerForSubscribersCubit(),
                    verticalSpace(dimension.height10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: dimension.width10,
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                          LateCustomersInformationWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
