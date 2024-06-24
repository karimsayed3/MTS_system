import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/filter_widget.dart';

class SearchWithFilterButtonWidget extends StatelessWidget {
   SearchWithFilterButtonWidget(
      {super.key, required this.onTap, required this.searchController ,this.onChange});

  final TextEditingController searchController;
  final Function() onTap;
   Function(String)? onChange;

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
        FilterWidget(
          onTap: onTap,
        ),
      ],
    );
  }
}
