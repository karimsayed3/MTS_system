import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/check_platform.dart';
import '../helpers/dimensions.dart';

class CheckBoxOutLine extends StatelessWidget {
  const CheckBoxOutLine(
      {super.key, required this.isSelected, required this.item});

  final bool isSelected;
  final String item;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      // height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: dimension.width5),
      child: Row(
        children: [
          if (isSelected)
            const Icon(
              Icons.check_box_outlined,
            )
          else
            const Icon(
              Icons.check_box_outline_blank,
            ),
          SizedBox(width: dimension.width10),
          Expanded(
            child: Text(
              item,
              style: TextStyle(
                fontSize:isMobile()? 15.sp :dimension.width10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
