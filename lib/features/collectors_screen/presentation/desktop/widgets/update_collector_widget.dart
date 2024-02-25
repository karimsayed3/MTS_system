import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/collectors_screen/data/models/update_user_request_body.dart';

import '../../../../../core/helpers/check_platform.dart';

class UpdateCollectorWidget extends StatefulWidget {
  const UpdateCollectorWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.userId});

  final String name;
  final String email;
  final int userId;

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
              padding: isMobile()
                  ? EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    )
                  : EdgeInsets.only(
                      left: dimension.width10,
                      right: dimension.width10,
                      top: dimension.height10,
                      bottom: dimension.height10,
                    ),
              child: DefaultText(
                text: 'تعديل محصل',
                color: ColorsManager.secondaryColor,
                fontSize: isMobile() ? 20.sp : dimension.reduce20,
                fontWeight: FontWeight.w700,
              ),
            ),
            isMobile()
                ? SizedBox.shrink()
                : const Divider(
                    color: ColorsManager.secondaryColor,
                    thickness: 2,
                    height: 0,
                  ),
            Padding(
              padding: isMobile()
                  ? EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    )
                  : EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height10),
              child: isMobile()
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'اسم المحصل',
                              fontSize: 20.sp,
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
                        verticalSpace(10.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'البريد الالكترونى',
                              color: ColorsManager.lightBlack,
                              fontSize: 20.sp,
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
                        verticalSpace(10.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'كلمة السر',
                              color: ColorsManager.lightBlack,
                              fontSize: 20.sp,
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
                        verticalSpace(10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DefaultButton(
                              padding: isMobile()
                                  ? EdgeInsets.symmetric(
                                      horizontal: 24.w,
                                      vertical: 12.h,
                                    )
                                  : EdgeInsets.symmetric(
                                      horizontal: dimension.width15,
                                      vertical: dimension.height15,
                                    ),
                              onPressed: () {
                                CollectorsCubit.get(context).updateUser(
                                    updateUserRequestBody:
                                        UpdateUserRequestBody(
                                  username: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  userID: widget.userId,
                                ));
                              },
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
                      ],
                    )
                  : Column(
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
                              onPressed: () {
                                CollectorsCubit.get(context).updateUser(
                                    updateUserRequestBody:
                                        UpdateUserRequestBody(
                                  username: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  userID: widget.userId,
                                ));
                              },
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
