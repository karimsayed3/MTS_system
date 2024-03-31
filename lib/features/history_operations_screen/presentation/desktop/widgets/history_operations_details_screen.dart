import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/search_with_filter_widget.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_cubit.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_state.dart';
import 'package:system/features/history_operations_screen/data/models/get_logged_operations_request_body.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/history_operation_card.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/history_operations_header_widget.dart';

import 'bloc_listener_for_history_operations_cubit.dart';
import 'filter_widget_for_historical_operations.dart';

class HistoryOperationDetailsScreen extends StatefulWidget {
  const HistoryOperationDetailsScreen({super.key});

  @override
  State<HistoryOperationDetailsScreen> createState() =>
      _HistoryOperationDetailsScreenState();
}

class _HistoryOperationDetailsScreenState
    extends State<HistoryOperationDetailsScreen> {
  TextEditingController searchController = TextEditingController();

  bool visible = false;
  @override
  void initState() {
    // TODO: implement initState
    HistoryOperationsCubit.get(context).loggedOperations = [];

    HistoryOperationsCubit.get(context).getLoggedOperations(
        getLoggedOperationsRequestBody: GetLoggedOperationsRequestBody());
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: 'سجل العمليات',
                fontSize: dimension.reduce20,
                fontWeight: FontWeight.w400,
              ),
              verticalSpace(dimension.height5),
              HomeWidget(
                horizontal: dimension.width10,
                vertical: dimension.height10,
                height: MediaQuery.of(context).size.height * .8,
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
                            // CollectorsSearchWidgeget(),
                            SearchWithFilterButtonWidget(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              onChange: (value) {
                                HistoryOperationsCubit.get(context).getLoggedOperations(
                                    getLoggedOperationsRequestBody: GetLoggedOperationsRequestBody(
                                      phone: value,
                                    )
                                );
                              },
                              searchController: searchController,
                            ),
                            ButtonWithTextAndImageWidget(
                              onPressed: () {},
                              color: const Color(0xffebf5f6),
                              image: 'assets/icons/excel.svg',
                              text: "تنزيل اكسيل",
                            ),
                          ],
                        ),
                        verticalSpace(dimension.height10),
                        const HistoryOperationsHeaderWidget(),
                        BlocBuilder<HistoryOperationsCubit, HistoryOperationsState>(
                          builder: (context, state) {
                            return Expanded(
                                child: ListView.builder(
                              itemBuilder: (context, index) {
                                return HistoryOperationCard
                                  (
                                  loggedOperation: HistoryOperationsCubit.get(context).loggedOperations[index],
                                );
                                // return SizedBox.shrink();
                              },
                              itemCount: HistoryOperationsCubit.get(context).loggedOperations.length,
                            ));
                          },
                        ),
                        const BlocListenerForHistoryOperationsCubit()
                      ],
                    ),
                    FilterWidgetForHistoricalOperations(
                      visible: visible,
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
