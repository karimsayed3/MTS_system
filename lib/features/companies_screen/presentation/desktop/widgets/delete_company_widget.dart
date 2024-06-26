import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/check_platform.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class DeleteCompanyWidget extends StatelessWidget {
  const DeleteCompanyWidget(
      {super.key, required this.onPressed, required this.companyName, required this.companyId});

  final Function() onPressed;
  final String companyName;
  final int companyId;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      // width: dimension.width300,
      child: Padding(
        padding:isMobile()?EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.w,
        ) :  EdgeInsets.symmetric(
            horizontal: dimension.width20, vertical: dimension.height20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(
                text: 'حذف الشركة',
                color: ColorsManager.primaryColor,
                fontSize:isMobile()? 20.sp: dimension.reduce20,
                fontWeight: FontWeight.w700,
              ),
              isMobile()? verticalSpace(10.h): verticalSpace(dimension.height10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'هل أنت متاكد من عملية حذف شركة "${companyName}" ؟',
                    fontSize:isMobile()? 20.sp: dimension.reduce20,
                    fontWeight: FontWeight.w400,
                  ),
                  isMobile()? verticalSpace(10.h): verticalSpace(dimension.height10),
                  Row(
                    children: [
                      DefaultButton(
                        padding:isMobile()?EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ) :  EdgeInsets.symmetric(
                          horizontal: dimension.width20,
                          vertical: dimension.height15,
                        ),
                        color: ColorsManager.primaryColor,
                        onPressed: onPressed,
                        child: DefaultText(
                          text: 'حذف',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      horizontalSpace(dimension.width10),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: DefaultText(
                          text: 'الغاء',
                          color: ColorsManager.lightGray,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
