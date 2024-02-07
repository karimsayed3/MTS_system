import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/nav_card_widget.dart';

class CompaniesNavBarWidget extends StatefulWidget {
  CompaniesNavBarWidget({super.key,required this.index, required this.onTapCompanies, required this.onTapBunch});

  int index;
  final Function() onTapCompanies;
  final Function() onTapBunch;

  @override
  State<CompaniesNavBarWidget> createState() => _CompaniesNavBarWidgetState();
}

class _CompaniesNavBarWidgetState extends State<CompaniesNavBarWidget> {
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
              title: "الشركات",
            ),
            horizontalSpace(dimension.width20),
            NavBarCardWidget(
              selectedIndex: 1,
              index: widget.index,
              onTap:widget.onTapBunch,
              title: "الباقات",
            ),
          ],
        ),
      ),
    );
  }
}
