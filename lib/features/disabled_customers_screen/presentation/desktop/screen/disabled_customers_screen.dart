import 'dart:io';

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
import 'package:system/features/disabled_customers_screen/presentation/desktop/widgets/create_excel.dart';
import 'package:system/features/disabled_customers_screen/presentation/desktop/widgets/disabled_customers_card.dart';
import 'package:system/features/disabled_customers_screen/presentation/desktop/widgets/disabled_customers_header_widget.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/Information_widget.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/late_customers_header_widget.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/widgets/late_customrers_card.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/bloc_listener.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/number_of_totals.dart';
import '../widgets/filter_widget_for_disabled_subscribers.dart';

class DisabledCustomersScreen extends StatefulWidget {
  const DisabledCustomersScreen({super.key});

  @override
  State<DisabledCustomersScreen> createState() =>
      _DisabledCustomersScreenState();
}

class _DisabledCustomersScreenState extends State<DisabledCustomersScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int totalBalance = 0;
  TextEditingController searchController = TextEditingController();
  String filePath = "";

  @override
  void initState() {
    // TODO: implement initState
    SubscribersCubit.get(context).disableSubscribers = [];
    SubscribersCubit.get(context).totalBalanceForDisabledSubscribers = 0;
    SubscribersCubit.get(context).getDisabledSubscribers(
        getDisabledSubscribersRequestBody: GetDisabledSubscribersRequestBody());
    SubscribersCubit.get(context).getCompaniesList();
    super.initState();
  }

  bool visible = false;
  List<String> companiesList = [];

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
                title: 'المعطلين',
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
                                SubscribersCubit.get(context)
                                    .getDisabledSubscribers(
                                        getDisabledSubscribersRequestBody:
                                            GetDisabledSubscribersRequestBody(
                                  name: value,
                                ));
                              },
                            ),

                            Row(
                              children: [
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
                                      SubscribersCubit.get(context)
                                          .disableSubscribersByExcel(
                                        excel: File(filePath),
                                      );
                                    } else {}
                                    // ReviewDataCubit.get(context).reviewSubscribersPlans(files: files);
                                  },
                                  color: const Color(0xffebf5f6),
                                  image: 'assets/icons/excel.svg',
                                  text: "تعطيل مشتركين",
                                ),
                                horizontalSpace(
                                  dimension.width10,
                                ),
                                ButtonWithTextAndImageWidget(
                                  onPressed: () {
                                    createExcelForDisabledSubscribers(
                                      data: SubscribersCubit.get(context)
                                          .disableSubscribers,
                                    );
                                  },
                                  color: const Color(0xffebf5f6),
                                  image: 'assets/icons/excel.svg',
                                  text: "تنزيل اكسيل",
                                ),
                              ],
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
                                  title: "اجمالى المعطلين: ",
                                  fontSize: dimension.reduce20,
                                  number: SubscribersCubit.get(context)
                                      .disableSubscribers
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
                                  number: SubscribersCubit.get(context).totalBalanceForDisabledSubscribers.toString(),
                                );
                              },
                            ),
                          ],
                        ),
                        verticalSpace(dimension.height10),
                        const DisabledCustomersHeaderWidget(),
                        BlocBuilder<SubscribersCubit, SubscribersState>(
                          builder: (context, state) {
                            return Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return DisabledCustomersCard(
                                    disabledSubscriber:
                                        SubscribersCubit.get(context)
                                            .disableSubscribers[index],
                                  );
                                },
                                itemCount: SubscribersCubit.get(context)
                                    .disableSubscribers
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
                              // LateCustomersInformationWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FilterWidgetForDisabledSubscribers(
                      visible: visible,
                      companiesList: companiesList,
                    )
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
