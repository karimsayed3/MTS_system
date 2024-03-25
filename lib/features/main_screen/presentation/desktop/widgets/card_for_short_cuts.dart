import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system/core/helpers/dimensions.dart';

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
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        width: dimension.width230,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(dimension.reduce15),
              )),
          child: Padding(
            padding: EdgeInsets.only(
              // left: dimension.width50,
              right: dimension.width10,
              top: dimension.height10,
              bottom: dimension.height10,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: dimension.width40,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height10,
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
                horizontalSpace(dimension.width10),
                Expanded(
                  child: DefaultText(
                    text: widget.title,
                    color: ColorsManager.darkBlack,
                    fontSize: dimension.width15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
