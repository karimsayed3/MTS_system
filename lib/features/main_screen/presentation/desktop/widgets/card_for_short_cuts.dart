import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system/core/helpers/dimensions.dart';

import '../../../../../core/helpers/check_platform.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/default_text.dart';

class CardForShortCuts extends StatefulWidget {
  const CardForShortCuts({super.key, required this.iconPath, required this.title, required this.onTap});
  final String iconPath;
  final String title;
  final Function() onTap;


  @override
  State<CardForShortCuts> createState() => _CardForShortCutsState();
}

class _CardForShortCutsState extends State<CardForShortCuts> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          // width: isMobile()? 180.w: dimension.width230,
          padding: EdgeInsets.symmetric(
            horizontal:isMobile()? 10.w: dimension.width10,
            vertical:isMobile()? 10.h: dimension.height10,
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(dimension.reduce15),
                )),
            child: Padding(
              padding: EdgeInsets.only(
                // left: dimension.width50,
                right:isMobile()? 10.w: dimension.width10,
                top:isMobile()? 10.h: dimension.height10,
                bottom:isMobile()? 10.h: dimension.height10,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width:isMobile()? 40.w: dimension.width40,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal:isMobile()? 10.w: dimension.width10,
                        vertical:isMobile()? 10.h: dimension.height10,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.lightBlueColor,
                      ),
                      child: SvgPicture.asset(
                        widget.iconPath,
                      ),
                    ),
                  ),
                  isMobile()? horizontalSpace(10.w):
                  horizontalSpace(dimension.width10),
                  Expanded(
                    child: DefaultText(
                      text: widget.title,
                      color: ColorsManager.darkBlack,
                      fontSize: isMobile()? 16.sp: dimension.width15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
