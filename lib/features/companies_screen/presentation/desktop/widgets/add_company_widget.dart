import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';

class AddCompanyWidget extends StatelessWidget {
  const AddCompanyWidget({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      width: dimension.width300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: ColorsManager.alertDialogHeaderColor,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: dimension.width10,
                right: dimension.width10,
                top: dimension.height10,
                bottom: dimension.height10,
              ),
              child: DefaultText(
                text: 'اضافة شركة',
                color: ColorsManager.secondaryColor,
                fontSize: dimension.reduce20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(
              color: ColorsManager.secondaryColor,
              thickness: 2,
              height: 0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: dimension.width10, vertical: dimension.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'اسم الشركة',
                    fontSize: dimension.reduce20,
                    fontWeight: FontWeight.w400,
                  ),
                  verticalSpace(dimension.height5),
                  DefaultTextFormField(
                    controller: TextEditingController(),
                    color: Colors.white,
                    hintText: "اسم الشركة",
                  ),
                  verticalSpace(dimension.height10),
                  Row(
                    children: [
                      DefaultButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: dimension.width15,
                          vertical: dimension.height15,
                        ),
                        onPressed: onPressed,
                        child: DefaultText(
                          text: 'اضافة',
                          color: Colors.white,
                          fontSize: 14,
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
            ),
          ],
        ),
      ),
    );
  }
}
