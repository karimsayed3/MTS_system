import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/check_platform.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/core/widgets/drop_down_button.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_state.dart';
import 'package:system/features/bunches_screen/data/models/add_plan_request_body.dart';

class AddBunchWidget extends StatefulWidget {
  const AddBunchWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  State<AddBunchWidget> createState() => _AddBunchWidgetState();
}

class _AddBunchWidgetState extends State<AddBunchWidget> {
  List<String> companies = [
  ];
  String selectedValue = "";

  TextEditingController planNameController = TextEditingController();
  TextEditingController planPriceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    BunchCubit.get(context).getCompaniesList();
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
                  ? EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 12.h,
                bottom: 12.h,
              )
                  : EdgeInsets.only(
                left: dimension.width10,
                right: dimension.width10,
                top: dimension.height10,
                bottom: dimension.height10,
              ),
              child: DefaultText(
                text: 'اضافة باقة',
                color: ColorsManager.secondaryColor,
                fontSize: isMobile() ? 20.sp : dimension.reduce20,
                fontWeight: FontWeight.w700,
              ),
            ),
            isMobile()
                ? const SizedBox.shrink()
                : const Divider(
              color: ColorsManager.secondaryColor,
              thickness: 2,
              height: 0,
            ),
            Padding(
              padding: isMobile()
                  ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h)
                  : EdgeInsets.symmetric(
                  horizontal: dimension.width10,
                  vertical: dimension.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isMobile()
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'اسم الباقة',
                            fontSize:
                            isMobile() ? 20.sp : dimension.reduce20,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.lightBlack,
                          ),
                          verticalSpace(5.h),
                          DefaultTextFormField(
                            controller: planNameController,
                            color: Colors.white,
                            hintText: 'اسم الباقة',
                          ),
                        ],
                      ),
                      verticalSpace(10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'سعر الباقة',
                            color: ColorsManager.lightBlack,
                            fontSize:
                            isMobile() ? 20.sp : dimension.reduce20,
                            fontWeight: FontWeight.w400,
                          ),
                          verticalSpace(5.h),
                          DefaultTextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: planPriceController,
                            color: Colors.white,
                            hintText: 'سعر الباقة',
                          ),
                        ],
                      ),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'اسم الباقة',
                              fontSize:
                              isMobile() ? 20.sp : dimension.reduce20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.lightBlack,
                            ),
                            isMobile()
                                ? verticalSpace(5.h)
                                : verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              controller: planNameController,
                              color: Colors.white,
                              hintText: 'اسم الباقة',
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(dimension.width20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'سعر الباقة',
                              color: ColorsManager.lightBlack,
                              fontSize:
                              isMobile() ? 20.sp : dimension.reduce20,
                              fontWeight: FontWeight.w400,
                            ),
                            isMobile()
                                ? verticalSpace(5.h)
                                : verticalSpace(dimension.height5),
                            DefaultTextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: planPriceController,
                              color: Colors.white,
                              hintText: 'سعر الباقة',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  isMobile()
                      ? verticalSpace(10.h)
                      : verticalSpace(dimension.height10),
                  BlocConsumer<BunchCubit, BunchState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if(state is GetCompaniesListSuccessState){
                        companies = state.getListsResponse.result!;
                        selectedValue = companies[0];
                      }
                    },
                    builder: (context, state) {
                      return buildDropdown(
                        labelText: 'الشركة',
                        itemList: companies,
                        selectedValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        context: context,
                      );
                    },
                  ),
                  isMobile()
                      ? verticalSpace(10.h)
                      : verticalSpace(dimension.height10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultButton(
                        padding: isMobile()
                            ? EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 10.h)
                            : EdgeInsets.symmetric(
                          horizontal: dimension.width15,
                          vertical: dimension.height15,
                        ),
                        onPressed: () {
                          BunchCubit.get(context).addPlan(
                            addPlanRequestBody: AddPlanRequestBody(
                              planName: planNameController.text,
                              companyName: selectedValue,
                              planPrice: int.parse(planPriceController.text),
                            ),
                          );
                        },
                        child: DefaultText(
                          text: 'اضافة',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      isMobile()
                          ? horizontalSpace(10.w)
                          : horizontalSpace(dimension.width10),
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
