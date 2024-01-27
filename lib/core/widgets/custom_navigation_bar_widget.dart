import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/home_screen/presentation/widgets/logo_widget.dart';

class CustomNavigationBarWidget extends StatefulWidget {
  CustomNavigationBarWidget({super.key, required this.titles,required this.index, required this.body, required this.changePage});
  final List<String> titles;
  final List<Widget> body;
  final Function(dynamic i) changePage;
  int index;

  @override
  State<CustomNavigationBarWidget> createState() =>
      _CustomNavigationBarWidgetState();
}

class _CustomNavigationBarWidgetState extends State<CustomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    var dimension =Dimensions(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dimension.width30),
      decoration: const BoxDecoration(
        // color: Color(0xFF213555),
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LogoWidget(),
          Row(
            children: List.generate(widget.body.length, (idx) {
              return InkWell(
                onTap: () {
                  widget.changePage(idx);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: dimension.width10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: widget.index == idx
                              ? ColorsManager.primaryColor
                              : Colors.transparent,
                          width: 3),
                    ),
                  ),
                  child: Center(
                    child: DefaultText(
                      text: widget.titles[idx],
                      color: widget.index == idx ? ColorsManager.darkBlack : ColorsManager.lightGray,
                      fontSize: dimension.reduce20,
                      // fontFamily: 'Almarai',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/vodafone-logo.png"),
          ),
        ],
      ),
    );
  }
}
