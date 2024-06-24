import 'package:flutter/material.dart';

import '../widgets/check_box_outline.dart';

List<DropdownMenuItem<String>>  itemsForDropDownButton (
{
  required List<String> mainList,
  required List<String> selectedList,
  required bool flag,
}
    ){
 return mainList.map((item) {
    return DropdownMenuItem(
      value: item,
//disable default onTap to avoid closing menu when selecting an item
      enabled: false,
      child: StatefulBuilder(
        builder:
            (context, menuSetState) {
          var isSelected = selectedList
              .contains(item);
          return InkWell(
            onTap: () {
              if (item == "اختر الكل") {
                flag =
                !flag;
                if (flag) {
                  selectedList =
                      mainList
                          .sublist(1);
                } else {
                  selectedList = [];
                }
              }
              isSelected
                  ? selectedList
                  .remove(item)
                  : selectedList
                  .add(item);
//This rebuilds the StatefulWidget to update the button's text
//               setState(() {});
//This rebuilds the dropdownMenu Widget to update the check mark
              menuSetState(() {});
            },
            child: CheckBoxOutLine(
              isSelected: isSelected,
              item: item,
            ),
          );
        },
      ),
    );
  }).toList();
}