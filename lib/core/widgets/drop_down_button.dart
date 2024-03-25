import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/check_platform.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'default_text.dart';
Widget buildDropdown({
  required String labelText,
  String? hintText,
  required List<String> itemList,
  required String selectedValue,
  required Function(String?) onChanged,
  required BuildContext context,
  Color? titleColor,
  Color? color,
  dynamic width,
}) {
  var dimension = Dimensions(context);
  return SizedBox(
    width: width ?? dimension.width200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText ==""?   const SizedBox.shrink():  DefaultText(
          text: labelText,
          color: titleColor ?? ColorsManager.lightBlack,
          fontSize: 16,
          // fontFamily: "Almarai",
        ),
      isMobile()? verticalSpace(5.h) :  labelText ==""?   const SizedBox.shrink(): SizedBox(
          height: dimension.height5,
        ),
        Container(
          // height: MediaQuery.of(context).size.height * .055,
          // width: dimension.width300,
          decoration: BoxDecoration(
              color: color ?? Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: const Border(
                left: BorderSide(
                  color:  ColorsManager.lightGray,
                ),
                right: BorderSide(
                  color:  ColorsManager.lightGray,
                ),
                top: BorderSide(
                  color: ColorsManager.lightGray,
                ),
                bottom: BorderSide(
                  color:  ColorsManager.lightGray,
                ),
              )),
          child: DropdownButton<String>(
            hint: DefaultText(
              text: hintText??"",
            ),
            value: selectedValue ,
            onChanged: onChanged,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            isExpanded: true,
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            autofocus: false,
            underline: Container(
              height: 0,
              color: Colors.deepPurpleAccent,
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: ColorsManager.lightGray,
            ),
            items: itemList.map((itemValue) {
              return DropdownMenuItem(
                child: Text(itemValue),
                value: itemValue,
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
