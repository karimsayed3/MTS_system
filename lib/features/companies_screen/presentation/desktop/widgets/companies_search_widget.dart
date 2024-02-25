import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_search_widget.dart';

class CompaniesSearchWidget extends StatelessWidget {
  const CompaniesSearchWidget({super.key, required this.searchController, this.onChange});
  final TextEditingController searchController;
  final Function(String)? onChange;

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
