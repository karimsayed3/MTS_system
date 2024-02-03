import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system/core/widgets/filter_widget.dart';

import '../../../../../core/helpers/dimensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/custom_search_widget.dart';

class SubscribersSearchWidget extends StatelessWidget {
  const SubscribersSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchWidget(
          width: dimension.width200,
          searchController: TextEditingController(),
        ),
        horizontalSpace(dimension.width10),
        FilterWidget(
          onTap: () {

          },
        ),
      ],
    );
  }
}
