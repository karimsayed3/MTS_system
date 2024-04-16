import '';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/history_operations_details_screen.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../business_logic/history_operations_cubit.dart';

class HistoryOperationsDesktopScreen extends StatelessWidget {
  const HistoryOperationsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: BlocProvider.value(
            value: getIt<HistoryOperationsCubit>(),
            child: const HistoryOperationDetailsScreen(),
          ),
        ),
      ],
    );
  }
}
