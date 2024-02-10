import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';

class UpdateCompanyWidget extends StatefulWidget {
  const UpdateCompanyWidget({super.key, required this.onPressed, required this.companyName});
  final Function() onPressed;
  final String companyName ;

  @override
  State<UpdateCompanyWidget> createState() => _UpdateCompanyWidgetState();
}

class _UpdateCompanyWidgetState extends State<UpdateCompanyWidget> {

  TextEditingController companyNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    companyNameController.text = widget.companyName;
    super.initState();
  }
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
            Padding(
              padding: EdgeInsets.only(
                left: dimension.width10,
                right: dimension.width10,
                top: dimension.height10,
              ),
              child: DefaultText(
                text: 'تعديل شركة',
                color: ColorsManager.secondaryColor,
                fontSize: dimension.reduce20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(
              color: ColorsManager.secondaryColor,
              thickness: 2,
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
                    controller: companyNameController,
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
                        onPressed: widget.onPressed,
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
