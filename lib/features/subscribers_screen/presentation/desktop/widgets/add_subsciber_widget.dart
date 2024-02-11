import 'package:flutter/material.dart';
import 'package:system/core/helpers/app_regex.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/core/widgets/drop_down_button.dart';

class AddSubscriberWidget extends StatefulWidget {
  const AddSubscriberWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  State<AddSubscriberWidget> createState() => _AddSubscriberWidgetState();
}

class _AddSubscriberWidgetState extends State<AddSubscriberWidget> {
  TextEditingController subscriberNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController NIDController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
      width: dimension.width350 + dimension.width250,
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
                text: 'اضافة مشترك',
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'اسم المشترك',
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.lightBlack,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              controller: subscriberNameController,
                              color: Colors.white,
                              hintText: "اسم المشترك",
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
                              text: 'رقم الهاتف',
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.lightBlack,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              inputFormatters: [NumberInputFormatter()],
                              controller: phoneNumberController,
                              color: Colors.white,
                              hintText: 'رقم الهاتف',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'الرقم القومى',
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.lightBlack,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              inputFormatters: [NumberInputFormatter()],
                              controller: NIDController,
                              color: Colors.white,
                              hintText: 'الرقم القومى',
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
                              text: 'العنوان',
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.lightBlack,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              controller: addressController,
                              color: Colors.white,
                              hintText: "العنوان",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: buildDropdown(
                          labelText: 'التبعية',
                          itemList: companies,
                          selectedValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          context: context,
                        ),
                      ),
                      horizontalSpace(dimension.width10),
                      Expanded(
                        child: buildDropdown(
                          labelText: 'المحصل',
                          itemList: companies,
                          selectedValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          context: context,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: buildDropdown(
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
                      ),
                      horizontalSpace(dimension.width10),
                      Expanded(
                        child: buildDropdown(
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
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: buildDropdown(
                          labelText: 'نوع الخط',
                          itemList: companies,
                          selectedValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          context: context,
                        ),
                      ),
                      horizontalSpace(dimension.width10),
                      const Expanded(
                        flex: 1,
                        child: SizedBox.shrink(),
                      ),
                    ],
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
                          text: 'حفظ',
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
