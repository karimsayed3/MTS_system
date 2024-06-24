import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';

import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../companies_screen/presentation/desktop/widgets/nav_card_widget.dart';

class CustomersNavBarWidget extends StatefulWidget {
  CustomersNavBarWidget(
      {super.key,
      required this.index,
      required this.onTapSubscribers,
      required this.onTapLatecomers,
      required this.onTapDisabled,
      required this.onTapWithdrawn});

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
            CacheHelper.getdata(key: "accountType") == "محصل" || CacheHelper.getdata(key: "accountType") == "موزع"
                ? const SizedBox.shrink()
                : horizontalSpace(dimension.width20),
            CacheHelper.getdata(key: "accountType") == "محصل" || CacheHelper.getdata(key: "accountType") == "موزع"
                ? const SizedBox.shrink()
                    : NavBarCardWidget(
                        selectedIndex: 1,
                        index: widget.index,
                        onTap: widget.onTapLatecomers,
                        title: "المتأخرين",
                      ),
            CacheHelper.getdata(key: "accountType") == "محصل"
                ? const SizedBox.shrink()
                : horizontalSpace(dimension.width20),
            CacheHelper.getdata(key: "accountType") == "محصل"
                ? const SizedBox.shrink()
                : NavBarCardWidget(
                    selectedIndex:CacheHelper.getdata(key: "accountType") == "موزع"? 1: 2,
                    index: widget.index,
                    onTap: widget.onTapDisabled,
                    title: "المعطلين",
                  ),
            CacheHelper.getdata(key: "accountType") == "محصل"
                ? const SizedBox.shrink()
                : horizontalSpace(dimension.width20),
            CacheHelper.getdata(key: "accountType") == "محصل"
                ? const SizedBox.shrink()
                : NavBarCardWidget(
                    selectedIndex: CacheHelper.getdata(key: "accountType") == "موزع"? 2 :3,
                    index: widget.index,
                    onTap: widget.onTapWithdrawn,
                    title: "المسحوبين",
                  ),
          ],
        ),
      ),
    );
  }
}
