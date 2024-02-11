import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class DeleteBunchForCompany extends StatelessWidget {
  const DeleteBunchForCompany({super.key, required this.onPressed, required this.companyName});

  final Function() onPressed;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      width: dimension.width300,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width20, vertical: dimension.height20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(
                text: 'حذف قيمة باقة',
                color: ColorsManager.primaryColor,
                fontSize: dimension.reduce20,
                fontWeight: FontWeight.w700,
              ),
              verticalSpace(dimension.height10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'هل أنت متاكد من عملية حذف قيمة الباقة للشركة "${companyName}" ؟',
                    fontSize: dimension.reduce20,
                    fontWeight: FontWeight.w400,
                  ),
                  verticalSpace(dimension.height10),
                  Row(
                    children: [
                      DefaultButton(
                        padding: EdgeInsets.symmetric(
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