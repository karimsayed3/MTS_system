import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/info_widget.dart';

class LateCustomersInformationWidget extends StatelessWidget {
  const LateCustomersInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: dimension.width10,
          vertical: dimension.height5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InfoWidget(
            color: Color(0xFFCC232A),
            text: 'اكتر من سعر باقتة',
            textColor: Color(0xFF969AB0),
          ),
          horizontalSpace(dimension.width5),
          const InfoWidget(
            color: Color(0xFF007C92),
            text: 'علية اكتر من شهر',
            textColor: Color(0xFF969AB0),
          ),
          horizontalSpace(dimension.width5),
          const InfoWidget(
            color: Color(0xFFFFA800),
            text: 'علية اكتر من شهرين',
            textColor: Color(0xFF969AB0),
          ),
        ],
      ),
    );
  }
}
