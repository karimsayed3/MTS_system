import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/review_data_screen/business_logic/review_data_cubit.dart';
import 'package:system/features/review_data_screen/business_logic/review_data_state.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';

import '../../../../../core/theming/colors.dart';

class BlocListenerForReviewSubscribersCubit extends StatefulWidget {
  const BlocListenerForReviewSubscribersCubit({super.key});

  @override
  State<BlocListenerForReviewSubscribersCubit> createState() =>
      _BlocListenerForReviewSubscribersCubitState();
}

class _BlocListenerForReviewSubscribersCubitState
    extends State<BlocListenerForReviewSubscribersCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewDataCubit, ReviewDataState>(
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        state.whenOrNull(
        getReviewSubscribersPlansSuccessState: (data) {
          ReviewDataCubit.get(context).changeReviewSubscriberData(reviewSubscriberData: data.results!);
        },
    );
  },
      child: const SizedBox.shrink(),
    );
  }
}
