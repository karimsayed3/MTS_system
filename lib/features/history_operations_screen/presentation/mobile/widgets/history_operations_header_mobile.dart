import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/header_label_with_image_mobile.dart';
import '../../../../../core/widgets/header_widget.dart';

class HistoryOperationsHeaderMobile extends StatelessWidget {
  const HistoryOperationsHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      color: Colors.white,
      child: Row(
        children: [
          HeaderLabelWithImageMobile(
            width: 120.w,
            image: "assets/images/header_image.png",
            title: 'اسم المستخدم',
          ),
          const Spacer(),
          HeaderLabelWithImageMobile(
            width: 110.w,
            image: "assets/images/header_image.png",
            title: 'الرقم',
          ),
          const Spacer(),
          HeaderLabelWithImageMobile(
            width: 135.w,
            image: "assets/images/header_image.png",
            title: 'العملية/الملاحظة',
          ),

        ],
      ),
    );
  }
}
