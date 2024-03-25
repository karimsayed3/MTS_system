import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_cubit.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_state.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';

import '../../../../../core/theming/colors.dart';

class BlocListenerForHistoryOperationsCubit extends StatefulWidget {
  const BlocListenerForHistoryOperationsCubit({super.key});

  @override
  State<BlocListenerForHistoryOperationsCubit> createState() =>
      _BlocListenerForHistoryOperationsCubitState();
}

class _BlocListenerForHistoryOperationsCubitState
    extends State<BlocListenerForHistoryOperationsCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HistoryOperationsCubit, HistoryOperationsState>(
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        state.whenOrNull(
            getLoggedOperationsLoadingState: () {},
            getLoggedOperationsSuccessState: (getLoggedOperationsResponse) {
              HistoryOperationsCubit.get(context).changeListData(
                  loggedOperations: getLoggedOperationsResponse.result!);
            },
            getLoggedOperationsErrorState: (error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(error),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
            });
      },
      child: const SizedBox.shrink(),
    );
  }
}
