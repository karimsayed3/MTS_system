import 'package:flutter/material.dart';
import 'package:system/features/review_data_screen/presentation/desktop/widgets/review_data_details_screen.dart';

class ReviewDataScreenDesktop extends StatelessWidget {
  const ReviewDataScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: ReviewDataScreenDetails(),
        ),
      ],
    );
  }
}
