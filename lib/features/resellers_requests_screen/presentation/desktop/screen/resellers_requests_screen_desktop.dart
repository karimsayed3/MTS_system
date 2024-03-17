import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/features/collectors_screen/data/models/get_users_response.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_card.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_cubit.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_state.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_request_body.dart';
import 'package:system/features/resellers_requests_screen/presentation/desktop/widgets/bloc_listener_for_collectors_requests_cubit.dart';
import 'package:system/features/resellers_requests_screen/presentation/desktop/widgets/create_excel.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/button_with_text_and_image.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text.dart';
import '../../../../../core/widgets/home_widget.dart';
import '../../../../../core/widgets/show_alert_dialog.dart';
import '../../../../collectors_screen/presentation/desktop/widgets/collectors_header_widget.dart';
import '../../../../collectors_screen/presentation/desktop/widgets/collectors_search_widget.dart';
import '../widgets/resellers_requests_card_widget.dart';
import '../widgets/resellers_requests_header_widget.dart';

class ResellersRequestsScreenDesktop extends StatefulWidget {
  const ResellersRequestsScreenDesktop({super.key});

  @override
  State<ResellersRequestsScreenDesktop> createState() =>
      _ResellersRequestsScreenDesktopState();
}

class _ResellersRequestsScreenDesktopState
    extends State<ResellersRequestsScreenDesktop> {
  @override
  void initState() {
    // TODO: implement initState
    CollectorsRequestsCubit.get(context).getCollectorRequests(
        getCollectorRequestsRequestBody: GetCollectorRequestsRequestBody());
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
              text: 'طلبات المحصلون',
              fontSize: dimension.reduce20,
              fontWeight: FontWeight.w400,
            ),
            verticalSpace(dimension.height5),
            HomeWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CollectorsSearchWidget(
                        searchController: CollectorsRequestsCubit.get(context)
                            .searchController,
                        // onChange: (value) {
                        //   CollectorsRequestsCubit.get(context)
                        //       .getCollectorRequests(
                        //     getCollectorRequestsRequestBody:
                        //         GetCollectorRequestsRequestBody(
                        //
                        //         ),
                        //   );
                        // },
                      ),
                      ButtonWithTextAndImageWidget(
                        onPressed: () {
                          createExcelForCollectorsRequests(
                              data: CollectorsRequestsCubit.get(context)
                                  .requestsData);
                        },
                        text: 'تنزيل اكسيل',
                        image: 'assets/icons/excel.svg',
                        color: const Color(0xffebf5f6),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(dimension.height10),
                        const ResellersRequestsHeaderWidget(),
                        BlocBuilder<CollectorsRequestsCubit,
                            CollectorsRequestsState>(
                          builder: (context, state) {
                            return Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ResellersRequestsCardWidget(
                                      requestData:
                                          CollectorsRequestsCubit.get(context)
                                              .requestsData[index]);
                                },
                                itemCount: CollectorsRequestsCubit.get(context)
                                    .requestsData
                                    .length,
                              ),
                            );
                          },
                        ),
                        const BlocListenerForCollectorsRequestsCubit()
                      ],
                    ),
                  )
                  // BlocBuilder<CollectorsCubit, CollectorsState>(
                  //   builder: (context, state) {
                  //     if (CollectorsCubit.get(context).users.isEmpty) {
                  //       return Expanded(
                  //           child: NoDataWidget(
                  //             child: DefaultButton(
                  //               color: const Color(0xffebf5f6),
                  //               padding: EdgeInsets.symmetric(
                  //                 horizontal: dimension.width15,
                  //                 vertical: dimension.height10,
                  //               ),
                  //               onPressed: () {
                  //                 showDataAlert(
                  //                     context: context,
                  //                     child: BlocProvider.value(
                  //                       value: getIt<CollectorsCubit>(),
                  //                       child: const AddCollectorWidget(),
                  //                     ));
                  //               },
                  //               child: DefaultText(
                  //                 text: "+ اضافة محصل",
                  //                 color: const Color(0xFF007C92),
                  //                 fontSize: dimension.reduce20,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ));
                  //     } else {
                  //       return Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             verticalSpace(dimension.height10),
                  //             const CollectorsHeaderWidget(),
                  //             Expanded(
                  //               child: ListView.builder(
                  //                 itemBuilder: (context, index) {
                  //                   return CollectorsCard(
                  //                       user: CollectorsCubit.get(context)
                  //                           .users[index]);
                  //                 },
                  //                 itemCount:
                  //                 CollectorsCubit.get(context).users.length,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  // const BlocListenerCollectorsCubit()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
