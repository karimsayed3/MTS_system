import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/core/widgets/drop_down_button.dart';

class AddBunchWidget extends StatefulWidget {
  const AddBunchWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  State<AddBunchWidget> createState() => _AddBunchWidgetState();
}

class _AddBunchWidgetState extends State<AddBunchWidget> {
  List<String> companies = [
    "فودافون",
    "موبينيل",
    "اتصالات",
    "وي",
  ];
  String selectedValue = "فودافون";

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      width: dimension.width350 + dimension.width100,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: ColorsManager.alertDialogHeaderColor,
              padding: EdgeInsets.only(
                left: dimension.width10,
                right: dimension.width10,
                top: dimension.height10,
                bottom: dimension.height10,
              ),
              child: DefaultText(
                text: 'اضافة باقة',
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'اسم الباقة',
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.lightBlack,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              controller: TextEditingController(),
                              color: Colors.white,
                              hintText: 'اسم الباقة',
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(dimension.width10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'سعر الباقة',
                              color: ColorsManager.lightBlack,
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              controller: TextEditingController(),
                              color: Colors.white,
                              hintText: 'سعر الباقة',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  buildDropdown(
                    labelText: 'الشركة',
                    itemList: companies,
                    selectedValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    context: context,
                  ),
                  verticalSpace(dimension.height10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  verticalSpace(dimension.height10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
