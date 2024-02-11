import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';

import '../../../../../core/helpers/dimensions.dart';

class ReviewDataSearchWidget extends StatelessWidget {
  const ReviewDataSearchWidget({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchWidget(
          width: dimension.width200,
          searchController: searchController,
        ),
        horizontalSpace(dimension.width10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: dimension.width10,vertical: dimension.height10),
          decoration: ShapeDecoration(
            color: ColorsManager.lighterGray,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: SvgPicture.asset("assets/icons/filter.svg"),
        ),
      ],
    );
  }
}
