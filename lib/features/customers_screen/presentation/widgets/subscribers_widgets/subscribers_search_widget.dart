import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/dimensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
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
