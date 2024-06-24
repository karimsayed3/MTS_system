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
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/filter_widget_for_late_subscribers.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/late_customers_header_widget.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/late_customrers_card.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/bloc_listener.dart';

import '../../../../../core/widgets/number_of_totals.dart';
import '../../../../subscribers_screen/presentation/desktop/widgets/filter_widget_details_for_subscribers.dart';

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
  List<String> companiesList = [];
  int totalBalance = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SubscribersCubit.get(context).subscribers = [];
    // SubscribersCubit.get(context).changeListData(subscribers: []);
    SubscribersCubit.get(context).lateSubscribers = [];
    SubscribersCubit.get(context).totalBalanceForLateSubscribers = 0;
    SubscribersCubit.get(context).getLateSubscribers(
      getLateSubscribersRequestBody: GetLateSubscribersRequestBody(),
    );
    SubscribersCubit.get(context).getCompaniesList();
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
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < SubscribersCubit.get(context).lateSubscribers.length; i++) {
      setState(() {
        totalBalance += SubscribersCubit.get(context).lateSubscribers[i].balance!;
      });
    }
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
              BlocListener<SubscribersCubit, SubscribersState>(
                listener: (context, state) {
                  if (state is GetCompaniesListSuccessState) {
                    companiesList =
                        ['اختر الكل'] + state.getListsResponse.result!;
                    SubscribersCubit.get(context).getPlansList(companyName: {
                      'companyName': state.getListsResponse.result!.join(',')
                    });
                    // setState(() {});
                  }
                },
                child: const SizedBox.shrink(),
              ),
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
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // const SubscribersSearchWidget(),
                            SearchWithFilterButtonWidget(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<SubscribersCubit, SubscribersState>(
                              builder: (context, state) {
                                return NumberOfSoliderStatus(
                                  containerColor: const Color(0xFFEBFBF1),
                                  containerBorderColor: const Color(0xFF3ABB66),
                                  textColor: const Color(0xFF3E3F43),
                                  numberColor: const Color(0xFF3ABB66),
                                  title: "اجمالى المتأخرين: ",
                                  fontSize: dimension.reduce20,
                                  number: SubscribersCubit.get(context)
                                      .lateSubscribers
                                      .length
                                      .toString(),
                                );
                              },
                            ),
                            horizontalSpace(dimension.width10),
                            BlocBuilder<SubscribersCubit, SubscribersState>(
                              builder: (context, state) {
                                return NumberOfSoliderStatus(
                                  containerColor: const Color(0xFFE5F7FF),
                                  containerBorderColor: const Color(0xFF1C9BD1),
                                  textColor: const Color(0xFF3E3F43),
                                  numberColor: const Color(0xFF1C9BD1),
                                  title: "اجمالى الحساب: ",
                                  fontSize: dimension.reduce20,
                                  number: SubscribersCubit.get(context).totalBalanceForLateSubscribers.toString(),
                                );
                              },
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
                    FilterWidgetForLateSubscribers(
                      visible: visible,
                      companiesList: companiesList,
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
