import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:system/core/widgets/search_inner_widget.dart';

import '../helpers/dimensions.dart';
import '../helpers/spacing.dart';
import 'default_text.dart';

class MultiDropDownButton extends StatefulWidget {
  MultiDropDownButton({
    super.key,
    required this.mainList,
    required this.selectedList,
    required this.textEditingController,
    required this.onMenuStateChange,
    required this.items,
    this.width, required this.title,required this.hintText,this.titleColor,this.color,required this.searchText,
  });

  List<String> mainList;
  List<String> selectedList;
  TextEditingController textEditingController;
  Function(bool) onMenuStateChange;
  List<DropdownMenuItem<String>>? items;
  double? width;
  final String title;
  final String hintText;
  final String searchText;
  Color? titleColor;
  Color? color;

  @override
  State<MultiDropDownButton> createState() => _MultiDropDownButtonState();
}

class _MultiDropDownButtonState extends State<MultiDropDownButton> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      width: widget.width ?? dimension.width100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text: widget.title,
            color:widget.titleColor?? Color(0xFFF5EFE7),
          ),
          verticalSpace(
        dimension.height5,
          ),
          Container(
            width: dimension.width250,
            height: dimension.height30,
            decoration: BoxDecoration(
              color: widget.color??Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(dimension.reduce5),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  widget.hintText,
                  style: TextStyle(
                    fontSize: dimension.reduce15,
                    color: Colors.black,
                    fontFamily: 'Almarai',
                  ),
                ),
                items: widget.items,
                //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                value: widget.selectedList.isEmpty
                    ? null
                    : widget.selectedList.last,
                onChanged: (value) {},
                dropdownSearchData: DropdownSearchData(
                  searchController: widget.textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: SearchInnerWidget(
                    hintText: widget.searchText,
                    textEditingController: widget.textEditingController,
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value.toString().contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: widget.onMenuStateChange,
                selectedItemBuilder: (context) {
                  return widget.mainList.map(
                        (item) {
                      // print("N'${selectedItems.join(', ')}'");
                      return Container(
                        width: dimension.width100,
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          // "N'${selectedItems.join(', ')}'",
                          widget.selectedList.join(', '),
                          style: TextStyle(
                            fontSize: dimension.reduce15,
                            fontFamily: 'Almarai',
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
                buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 8,
                  ),
                  // height: dimension.height20,
                  width: dimension.width300,
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: dimension.height35,
                  padding: EdgeInsets.zero,
                ),
                style: TextStyle(
                  fontFamily: 'Almarai',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}