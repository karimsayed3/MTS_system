import 'package:flutter/material.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/history_operations_details_screen.dart';

class HistoryOperationsDesktopScreen extends StatelessWidget {
  const HistoryOperationsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: HistoryOperationDetailsScreen(),
        ),
      ],
    );
  }
}
