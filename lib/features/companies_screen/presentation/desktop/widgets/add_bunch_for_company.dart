import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/drop_down_button.dart';

class AddBunchForCompany extends StatefulWidget {
  const AddBunchForCompany({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  State<AddBunchForCompany> createState() => _AddBunchForCompanyState();
}

class _AddBunchForCompanyState extends State<AddBunchForCompany> {
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
      width: dimension.width300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: ColorsManager.alertDialogHeaderColor,
              // color: Colors.red,
              padding: EdgeInsets.only(
                left: dimension.width10,
                right: dimension.width10,
                top: dimension.height15,
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
                horizontal: dimension.width10,
                vertical: dimension.height15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDropdown(
                    labelText: 'الباقة',
                    itemList: companies,
                    selectedValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    context: context,
                  ),
                  verticalSpace(dimension.height15),
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
