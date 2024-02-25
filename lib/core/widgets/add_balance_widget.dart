import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/collectors_screen/data/models/deduct_balance_collector_request_body.dart';

import '../helpers/app_regex.dart';
import '../helpers/check_platform.dart';
import '../helpers/spacing.dart';
import '../theming/colors.dart';
import 'default_button.dart';
import 'default_text.dart';
import 'default_text_form_field.dart';
import 'drop_down_button.dart';

class AddBalanceWidget extends StatefulWidget {
  const AddBalanceWidget({super.key, required this.UserID});
  final int UserID;

  @override
  State<AddBalanceWidget> createState() => _AddBalanceWidgetState();
}

class _AddBalanceWidgetState extends State<AddBalanceWidget> {
  TextEditingController balanceController = TextEditingController();

  TextEditingController notesController = TextEditingController();


  List<String> balanceTypes = [
    "نقدى",
    "كاش",
  ];

  String balanceType = "نقدى";

  final formKey = GlobalKey<FormState>();

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
                text: 'اضافة رصيد',
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
                  ? Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'الاسم',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsManager.lightBlack,
                              ),
                              verticalSpace(dimension.height5),
                              DefaultTextFormField(
                                enabled: false,
                                controller: balanceController,
                                color: Colors.white,
                                hintText: 'الاسم',
                              ),
                            ],
                          ),
                          verticalSpace(10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'اخر رصيد موجب',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsManager.lightBlack,
                              ),
                              verticalSpace(dimension.height5),
                              DefaultTextFormField(
                                enabled: false,
                                controller: balanceController,
                                color: Colors.white,
                                hintText: 'اخر رصيد موجب',
                              ),
                            ],
                          ),verticalSpace(10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'تاريخ اضافة الرصيد الاخير',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsManager.lightBlack,
                              ),
                              verticalSpace(dimension.height5),
                              DefaultTextFormField(
                                enabled: false,
                                controller: balanceController,
                                color: Colors.white,
                                hintText: 'تاريخ اضافة الرصيد الاخير',
                              ),
                            ],
                          ),verticalSpace(10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'الرصيد الحالى',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsManager.lightBlack,
                              ),
                              verticalSpace(dimension.height5),
                              DefaultTextFormField(
                                enabled: false,
                                controller: balanceController,
                                color: Colors.white,
                                hintText: 'الرصيد الحالى',
                              ),
                            ],
                          ),
                          verticalSpace(10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'الرصيد المضاف',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsManager.lightBlack,
                              ),
                              verticalSpace(dimension.height5),
                              DefaultTextFormField(
                                inputFormatters: [NumberInputFormatter()],
                                controller: balanceController,
                                color: Colors.white,
                                hintText: 'الرصيد المضاف',
                              ),
                            ],
                          ),
                          verticalSpace(10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'الرصيد المضاف',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorsManager.lightBlack,
                              ),
                              verticalSpace(dimension.height5),
                              DefaultTextFormField(
                                inputFormatters: [NumberInputFormatter()],
                                controller: balanceController,
                                color: Colors.white,
                                hintText: 'الرصيد المضاف',
                              ),
                            ],
                          ),
                          verticalSpace(10.h),
                          buildDropdown(
                            labelText: 'نوع التحصيل',
                            itemList: balanceTypes,
                            selectedValue: balanceType,
                            onChanged: (value) {
                              setState(() {
                                balanceType = value!;
                              });
                            },
                            context: context,
                          ),
                          verticalSpace(10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'ملاحظات',
                                color: ColorsManager.lightBlack,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              verticalSpace(dimension.height5),
                              DefaultTextFormField(
                                controller: notesController,
                                color: Colors.white,
                                hintText: 'ملاحظات',
                              ),
                            ],
                          ),
                          verticalSpace(10.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DefaultButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    CollectorsCubit.get(context)
                                        .deductBalanceCollector(
                                      deductBalanceCollectorRequestBody:
                                          DeductBalanceCollectorRequestBody(
                                            userID: widget.UserID,
                                            collectedAmount: int.parse(balanceController.text),
                                            collectingType: balanceType,
                                          ),
                                    );
                                  }
                                },
                                padding: isMobile()
                                    ? EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 12.h,
                                      )
                                    : EdgeInsets.symmetric(
                                        horizontal: dimension.width15,
                                        vertical: dimension.height15,
                                      ),
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
                    )
                  : Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'الاسم',
                                      fontSize: dimension.reduce20,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsManager.lightBlack,
                                    ),
                                    verticalSpace(dimension.height5),
                                    DefaultTextFormField(
                                      enabled: false,
                                      controller: balanceController,
                                      color: Colors.white,
                                      hintText: 'الاسم',
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpace(dimension.width10),
                              Expanded(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'اخر رصيد موجب',
                                      fontSize: dimension.reduce20,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsManager.lightBlack,
                                    ),
                                    verticalSpace(dimension.height5),
                                    DefaultTextFormField(
                                      enabled: false,
                                      controller: balanceController,
                                      color: Colors.white,
                                      hintText: 'اخر رصيد موجب',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(dimension.height10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'تاريخ اضافة الرصيد الاخير',
                                      fontSize: dimension.reduce20,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsManager.lightBlack,
                                    ),
                                    verticalSpace(dimension.height5),
                                    DefaultTextFormField(
                                      enabled: false,
                                      controller: balanceController,
                                      color: Colors.white,
                                      hintText:'تاريخ اضافة الرصيد الاخير',
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpace(dimension.width10),
                              Expanded(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'الرصيد الحالى',
                                      fontSize: dimension.reduce20,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsManager.lightBlack,
                                    ),
                                    verticalSpace(dimension.height5),
                                    DefaultTextFormField(
                                      enabled: false,
                                      controller: balanceController,
                                      color: Colors.white,
                                      hintText: 'الرصيد الحالى',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(dimension.height10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'الرصيد المضاف',
                                      fontSize: dimension.reduce20,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsManager.lightBlack,
                                    ),
                                    verticalSpace(dimension.height5),
                                    DefaultTextFormField(
                                      inputFormatters: [NumberInputFormatter()],
                                      controller: balanceController,
                                      color: Colors.white,
                                      hintText: 'الرصيد المضاف',
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpace(dimension.width10),
                              Expanded(
                                child: buildDropdown(
                                  labelText: 'نوع التحصيل',
                                  itemList: balanceTypes,
                                  selectedValue: balanceType,
                                  onChanged: (value) {
                                    setState(() {
                                      balanceType = value!;
                                    });
                                  },
                                  context: context,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(dimension.height10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'ملاحظات',
                                      color: ColorsManager.lightBlack,
                                      fontSize: dimension.reduce20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    verticalSpace(dimension.height5),
                                    DefaultTextFormField(
                                      controller: notesController,
                                      color: Colors.white,
                                      hintText: 'ملاحظات',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(dimension.height10),
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
                                  if (formKey.currentState!.validate()) {
                                    CollectorsCubit.get(context)
                                        .deductBalanceCollector(
                                      deductBalanceCollectorRequestBody:
                                      DeductBalanceCollectorRequestBody(
                                        userID: widget.UserID,
                                        collectedAmount: int.parse(balanceController.text),
                                        collectingType: balanceType,
                                      ),
                                    );
                                  }
                                },
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
            ),
          ],
        ),
      ),
    );
  }
}
