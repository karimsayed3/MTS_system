import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../companies_screen/presentation/desktop/widgets/nav_card_widget.dart';

class CustomersNavBarWidget extends StatefulWidget {
   CustomersNavBarWidget({super.key,required this.index, required this.onTapSubscribers, required this.onTapLatecomers, required this.onTapDisabled, required this.onTapWithdrawn});
  int index;
  final Function() onTapSubscribers;
  final Function() onTapLatecomers;
  final Function() onTapDisabled;
  final Function() onTapWithdrawn;

  @override
  State<CustomersNavBarWidget> createState() => _CustomersNavBarWidgetState();
}

class _CustomersNavBarWidgetState extends State<CustomersNavBarWidget> {
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
              onTap: widget.onTapSubscribers,
                title: "المشتركين",
            ),
            horizontalSpace(dimension.width20),
            NavBarCardWidget(
              selectedIndex: 1,
              index: widget.index,
              onTap:widget.onTapLatecomers,
              title: "المتأخرين",
            ), horizontalSpace(dimension.width20),
            NavBarCardWidget(
              selectedIndex: 2,
              index: widget.index,
              onTap:widget.onTapDisabled,
              title: "المعطلين",
            ), horizontalSpace(dimension.width20),
            NavBarCardWidget(
              selectedIndex: 3,
              index: widget.index,
              onTap:widget.onTapWithdrawn,
              title: "المسحوبين",
            ),
          ],
        ),
      ),
    );
  }
}
