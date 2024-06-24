import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_cubit.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_state.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_request_body.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/custom_search_widget.dart';
import '../../../../../core/widgets/title_of_screen_with_logo_widget.dart';
import '../../desktop/widgets/bloc_listener_for_collectors_requests_cubit.dart';
import '../widgets/resellers_request_card_widget.dart';

class ResellersRequestsScreen extends StatefulWidget {
  const ResellersRequestsScreen({super.key});

  @override
  State<ResellersRequestsScreen> createState() =>
      _ResellersRequestsScreenState();
}

class _ResellersRequestsScreenState extends State<ResellersRequestsScreen> {


  @override
  void initState() {
    // TODO: implement initState
    CollectorsRequestsCubit.get(context).getCollectorRequests(
      getCollectorRequestsRequestBody: GetCollectorRequestsRequestBody(),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleForScreenWithWidget(
                      title: "طلبات المحصلون",
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
                    // const HistoryOperationsHeaderMobile(),
                    BlocBuilder<CollectorsRequestsCubit, CollectorsRequestsState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ResellersRequestCardWidget(
                                requestData: CollectorsRequestsCubit.get(context).requestsData[index],
                              );
                              // return const SizedBox.shrink();
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: CollectorsRequestsCubit.get(context).requestsData.length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const BlocListenerForCollectorsRequestsCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
