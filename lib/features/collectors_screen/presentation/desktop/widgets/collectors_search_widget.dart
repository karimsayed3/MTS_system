import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';

class CollectorsSearchWidget extends StatelessWidget {
  const CollectorsSearchWidget({super.key, this.onChange, required this.searchController});
  final Function(String)? onChange;
  final TextEditingController searchController ;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchWidget(
          width: dimension.width200,
          searchController: searchController,
          onChange: onChange,
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
