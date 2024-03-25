import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/bloc_listener_for_history_operations_cubit.dart';

import '../../../../../core/theming/colors.dart';
import '../../../business_logic/history_operations_cubit.dart';
import '../../../data/models/get_logged_operations_request_body.dart';
import '../widgets/history_operations_card_widget_mobile.dart';
import '../widgets/history_operations_header_mobile.dart';

class HistoryOperationsMobileScreen extends StatefulWidget {
  const HistoryOperationsMobileScreen({super.key});

  @override
  State<HistoryOperationsMobileScreen> createState() => _HistoryOperationsMobileScreenState();
}

class _HistoryOperationsMobileScreenState extends State<HistoryOperationsMobileScreen> {


  @override
  void initState() {
    // TODO: implement initState
    HistoryOperationsCubit.get(context).loggedOperations = [];
    HistoryOperationsCubit.get(context).getLoggedOperations(
        getLoggedOperationsRequestBody: GetLoggedOperationsRequestBody()
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
                child:   const Row(
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
                  width: double.infinity,
                  searchController: TextEditingController(),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const HistoryOperationsHeaderMobile(),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return HistoryOperationsCardWidgetMobile(
                            loggedOperation: HistoryOperationsCubit.get(context).loggedOperations[index],
                          );
                          // return const SizedBox.shrink();
                        },
                        itemCount: HistoryOperationsCubit.get(context).loggedOperations.length,
                      ),
                    ),
                    const BlocListenerForHistoryOperationsCubit(),
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
