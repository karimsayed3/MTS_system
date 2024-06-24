import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/features/review_data_screen/presentation/desktop/widgets/review_data_details_screen.dart';

import '../../../business_logic/review_data_cubit.dart';

class ReviewDataScreenDesktop extends StatelessWidget {
  const ReviewDataScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: BlocProvider.value(
            value: getIt<ReviewDataCubit>(),
            child: ReviewDataScreenDetails(),
          ),
        ),
      ],
    );
  }
}
