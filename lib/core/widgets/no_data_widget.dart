import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';

import '../theming/colors.dart';
import 'default_text.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/no_data.svg',
              fit: BoxFit.contain,
            ),
            verticalSpace(dimension.height10),
            DefaultText(
              text: 'لا توجد بيانات متاحة للعرض حتي الان',
              fontSize: dimension.reduce20,
              fontWeight: FontWeight.w400,
              color: ColorsManager.darkBlack,
            ),
            verticalSpace(dimension.height10),
            SizedBox(width: dimension.width125, child: child),
          ],
        ),
      ),
    );
  }
}
