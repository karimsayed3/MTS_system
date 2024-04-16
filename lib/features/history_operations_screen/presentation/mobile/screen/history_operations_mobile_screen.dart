import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_state.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/bloc_listener_for_history_operations_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/default_text.dart';
import '../../../business_logic/history_operations_cubit.dart';
import '../../../data/models/get_logged_operations_request_body.dart';
import '../widgets/filter_widget_for_historical_operations.dart';
import '../widgets/history_operations_card_widget_mobile.dart';
import '../widgets/history_operations_header_mobile.dart';

class HistoryOperationsMobileScreen extends StatefulWidget {
  const HistoryOperationsMobileScreen({super.key});

  @override
  State<HistoryOperationsMobileScreen> createState() =>
      _HistoryOperationsMobileScreenState();
}

class _HistoryOperationsMobileScreenState
    extends State<HistoryOperationsMobileScreen> {
  ScrollController controller = ScrollController();
  int pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    HistoryOperationsCubit.get(context).loggedOperations = [];
    fetch();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });

    super.initState();
  }

  void fetch() {
    if (HistoryOperationsCubit.get(context).isLoading) return;
    HistoryOperationsCubit.get(context).isLoading = true;
    HistoryOperationsCubit.get(context).getLoggedOperations(
        getLoggedOperationsRequestBody: GetLoggedOperationsRequestBody(
            pageNumber: HistoryOperationsCubit.get(context).pageNumber));
  }

  Future refresh() async {
    HistoryOperationsCubit.get(context).isLoading = false;
    HistoryOperationsCubit.get(context).hasMore = true;
    HistoryOperationsCubit.get(context).pageNumber = 1;
    HistoryOperationsCubit.get(context).loggedOperations = [];
    fetch();
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
                      title: "سجل العمليات",
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
                  onTap: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 350.h,
                            padding: EdgeInsets.symmetric(
                              // vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                )),
                            child: Center(
                              child: BlocProvider.value(
                                value: getIt<HistoryOperationsCubit>(),
                                child:
                                    const FilterWidgetForHistoricalOperationsMobile(),
                              ),
                            ),
                          );
                        });
                  },
                  width: double.infinity,
                  searchController: TextEditingController(),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const HistoryOperationsHeaderMobile(),
                    BlocBuilder<HistoryOperationsCubit, HistoryOperationsState>(
                      builder: (context, state) {
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: refresh,
                            child: ListView.builder(
                              controller: controller,
                              itemBuilder: (context, index) {
                                if (index <
                                    HistoryOperationsCubit.get(context)
                                        .loggedOperations
                                        .length) {
                                  return HistoryOperationsCardWidgetMobile(
                                    loggedOperation:
                                        HistoryOperationsCubit.get(context)
                                            .loggedOperations[index],
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.h,
                                    ),
                                    child: Center(
                                      child: HistoryOperationsCubit.get(context)
                                              .hasMore
                                          ? const CircularProgressIndicator()
                                          : DefaultText(
                                              text: 'لا يوجد مزيد من البيانات',
                                              fontSize: 16.sp,
                                            ),
                                    ),
                                  );
                                }

                                // return const SizedBox.shrink();
                              },
                              itemCount: HistoryOperationsCubit.get(context)
                                      .loggedOperations
                                      .length +
                                  1,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocListenerForHistoryOperationsCubit(),
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
