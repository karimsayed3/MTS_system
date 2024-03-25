import 'package:flutter/material.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/nav_card_widget.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/helpers/dimensions.dart';

class CollectorsNavBarWidget extends StatefulWidget {
  CollectorsNavBarWidget({super.key,required this.index, required this.onTapCompanies, required this.onTapBunch});

  int index;
  final Function() onTapCompanies;
  final Function() onTapBunch;

  @override
  State<CollectorsNavBarWidget> createState() => _CollectorsNavBarWidgetState();
}

class _CollectorsNavBarWidgetState extends State<CollectorsNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimension.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavBarCardWidget(
              index: widget.index,
              selectedIndex: 0,
              onTap: widget.onTapCompanies,
              title: "المحصلون",
            ),
            CacheHelper.getdata(key: "accountType") == "موزع" ? const SizedBox.shrink(): horizontalSpace(dimension.width10),
            CacheHelper.getdata(key: "accountType") == "موزع" ? const SizedBox.shrink():     NavBarCardWidget(
              selectedIndex: 1,
              index: widget.index,
              onTap:widget.onTapBunch,
              title: "طلبات المحصلون",
            ),
          ],
        ),
      ),
    );
  }
}
