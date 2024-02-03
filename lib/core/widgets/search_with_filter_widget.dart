import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/filter_widget.dart';

class SearchWithFilterButtonWidget extends StatelessWidget {
  const SearchWithFilterButtonWidget(
      {super.key, required this.onTap, required this.searchController});

  final TextEditingController searchController;
  final Function() onTap;

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
        FilterWidget(
          onTap: onTap,
        ),
      ],
    );
  }
}
