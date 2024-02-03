import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dimension.width10,vertical: dimension.height10),
        decoration: ShapeDecoration(
          color: ColorsManager.lighterGray,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: SvgPicture.asset("assets/icons/filter.svg"),
      ),
    );
  }
}
