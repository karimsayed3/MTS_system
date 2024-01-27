import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';

class NavBarCardWidget extends StatefulWidget {
   const NavBarCardWidget({super.key,required this.index, required this.title, required this.onTap, required this.selectedIndex});
   final int index ;
   final int selectedIndex ;
   final String title;
   final Function() onTap;

  @override
  State<NavBarCardWidget> createState() => _NavBarCardWidgetState();
}

class _NavBarCardWidgetState extends State<NavBarCardWidget> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return InkWell(
      onTap: widget.onTap,
      highlightColor:Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dimension.width15 ,vertical: dimension.height10),
        margin: EdgeInsets.symmetric(vertical: dimension.height5),
        decoration: ShapeDecoration(
          color: widget.index==widget.selectedIndex? ColorsManager.lighterGray: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: DefaultText(
          text: widget.title,
          color: widget.index==widget.selectedIndex? ColorsManager.secondaryColor: ColorsManager.lightGray,
          fontSize: dimension.width10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
