import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';

class UpdateCollectorWidget extends StatefulWidget {
  const UpdateCollectorWidget({super.key, required this.onPressed, required this.name, required this.email});
  final Function() onPressed;
  final String name;
  final String email;

  @override
  State<UpdateCollectorWidget> createState() => _UpdateCollectorWidgetState();
}

class _UpdateCollectorWidgetState extends State<UpdateCollectorWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.name;
    emailController.text = widget.email;
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
                text: 'تعديل محصل',
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
                              text: 'اسم المحصل',
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.lightBlack,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              controller: nameController,
                              color: Colors.white,
                              hintText: 'اسم المحصل',
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
                              text: 'البريد الالكترونى',
                              color: ColorsManager.lightBlack,
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                            ),
                            verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              controller: emailController,
                              color: Colors.white,
                              hintText: 'البريد الالكترونى',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'كلمة السر',
                        color: ColorsManager.lightBlack,
                        fontSize: dimension.reduce20,
                        fontWeight: FontWeight.w400,
                      ),
                      verticalSpace(dimension.height5),
                      DefaultTextFormField(
                        controller: passwordController,
                        color: Colors.white,
                        hintText: 'كلمة السر',
                      ),
                    ],
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
