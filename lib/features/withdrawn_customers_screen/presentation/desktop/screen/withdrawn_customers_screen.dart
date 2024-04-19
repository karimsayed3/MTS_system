import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/screen_title_widget.dart';
import 'package:system/core/widgets/search_with_filter_widget.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/bloc_listener.dart';
import 'package:system/features/withdrawn_customers_screen/presentation/desktop/widgets/create_excel.dart';
import 'package:system/features/withdrawn_customers_screen/presentation/desktop/widgets/withdrawn_customers_card.dart';
import 'package:system/features/withdrawn_customers_screen/presentation/desktop/widgets/withdrawn_customers_header_widget.dart';

import '../../../../../core/utils/utils.dart';
import '../widgets/filter_widget_fot_withdrawn_subscribers.dart';

class WithdrawnCustomersScreen extends StatefulWidget {
  WithdrawnCustomersScreen({super.key});

  @override
  State<WithdrawnCustomersScreen> createState() =>
      _WithdrawnCustomersScreenState();
}

class _WithdrawnCustomersScreenState extends State<WithdrawnCustomersScreen> {
  TextEditingController searchController = TextEditingController();

  bool visible = false;

  List<String> companiesList = [];
  String filePath = "";

  @override
  void initState() {
    // TODO: implement initState
    SubscribersCubit.get(context).withdrawSubscribers = [];
    SubscribersCubit.get(context).getCompaniesList();
    SubscribersCubit.get(context).getWithdrawnSubscribers(
        getWithdrawnSubscribersRequestBody:
            GetWithdrawnSubscribersRequestBody());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
        child:  SingleChildScrollView(
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
                title: 'المسحوبين',
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
                                SubscribersCubit.get(context).getWithdrawnSubscribers(
                                  getWithdrawnSubscribersRequestBody:
                                      GetWithdrawnSubscribersRequestBody(name: value),
                                );
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
                                          .withdrawSubscribersByExcel(
                                        excel: File(filePath),
                                      );
                                    } else {}
                                    // ReviewDataCubit.get(context).reviewSubscribersPlans(files: files);
                                  },
                                  color: const Color(0xffebf5f6),
                                  image: 'assets/icons/excel.svg',
                                  text: "سحب مشتركين",
                                ),
                                horizontalSpace(dimension.width10,),
                                ButtonWithTextAndImageWidget(
                                  onPressed: () {
                                    createExcelForWithdrawnSubscribers(
                                      data: SubscribersCubit.get(context)
                                          .withdrawSubscribers,
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
                        const WithdrawnCustomersHeaderWidget(),
                        BlocBuilder<SubscribersCubit, SubscribersState>(
                          builder: (context, state) {
                            return Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return WithdrawnCustomersCard(
                                    subscriberData: SubscribersCubit.get(context)
                                        .withdrawSubscribers[index],
                                  );
                                },
                                itemCount: SubscribersCubit.get(context)
                                    .withdrawSubscribers
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
                    FilterWidgetForWithdrawnSubscribers(
                      visible:  visible,
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
