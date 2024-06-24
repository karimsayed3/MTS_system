import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_cubit.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_state.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_request_body.dart';

class BlocListenerForCollectorsRequestsCubit extends StatelessWidget {
  const BlocListenerForCollectorsRequestsCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CollectorsRequestsCubit, CollectorsRequestsState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
            getCollectorRequestsLoadingState: () {
              return const SizedBox.shrink();
            },
            getCollectorRequestsErrorState: (error) {},
            getCollectorRequestsSuccessState: (collectorRequests) {
              CollectorsRequestsCubit.get(context)
                  .changeListData(requestsData: collectorRequests.result!);
            },
            approveRequestLoadingState: () {
              return const SizedBox.shrink();
            },
            approveRequestErrorState: (error) {
              return const SizedBox.shrink();
            },
            approveRequestSuccessState: (approveOrDecline) {
              CollectorsRequestsCubit.get(context).getCollectorRequests(
                  getCollectorRequestsRequestBody:
                      GetCollectorRequestsRequestBody());
            },
            declineRequestLoadingState: () {
              return const SizedBox.shrink();
            }
            ,
            declineRequestErrorState: (error) {
              return const SizedBox.shrink();
            } ,
            declineRequestSuccessState: (approveOrDecline) {
              CollectorsRequestsCubit.get(context).getCollectorRequests(
                  getCollectorRequestsRequestBody:  GetCollectorRequestsRequestBody()
              );
            }
        );

      },
      child: const SizedBox.shrink(),
    );
  }
}
