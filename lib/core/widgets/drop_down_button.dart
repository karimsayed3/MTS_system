import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/theming/colors.dart';
import 'default_text.dart';
Widget buildDropdown({
  required String labelText,
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
        DefaultText(
          text: labelText,
          color: titleColor ?? ColorsManager.lightBlack,
          fontSize: 16,
          // fontFamily: "Almarai",
        ),
        SizedBox(
          height: dimension.height5,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .055,
          width: dimension.width300,
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
            value: selectedValue,
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
