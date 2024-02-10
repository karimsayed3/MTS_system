import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/core/widgets/drop_down_button.dart';

class UpdateBunchWidget extends StatefulWidget {
  const UpdateBunchWidget({super.key, required this.bunchName, required this.bunchPrice, required this.companyName, required this.onPressed});
  final String bunchName ;
  final int bunchPrice ;
  final String companyName ;
  final Function() onPressed;


  @override
  State<UpdateBunchWidget> createState() => _UpdateBunchWidgetState();
}

class _UpdateBunchWidgetState extends State<UpdateBunchWidget> {
  TextEditingController bunchNameController = TextEditingController();
  TextEditingController bunchPriceController = TextEditingController();

  List<String> companies = [
    "فودافون",
    "موبينيل",
    "اتصالات",
    "وي",
  ];
  String selectedValue = "فودافون";

  @override
  void initState() {
    // TODO: implement initState
    selectedValue = widget.companyName;
    bunchNameController.text = widget.bunchName;
    bunchPriceController.text = widget.bunchPrice.toString();
    super.initState();
  }

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
                text: 'تعديل باقة',
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
                              controller: bunchNameController,
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
                              controller: bunchPriceController,
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
                          text: 'تعديل',
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
