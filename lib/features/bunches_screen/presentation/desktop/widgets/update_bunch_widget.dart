import 'package:flutter/material.dart';
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

import '../../../data/models/update_plan_request_body.dart';

class UpdateBunchWidget extends StatefulWidget {
  const UpdateBunchWidget({super.key,
    required this.bunchName,
    required this.bunchPrice,
    required this.companyName,
    required this.planId,
    required this.onPressed});

  final String bunchName;

  final int bunchPrice;
  final int planId;

  final String companyName;

  final Function() onPressed;

  @override
  State<UpdateBunchWidget> createState() => _UpdateBunchWidgetState();
}

class _UpdateBunchWidgetState extends State<UpdateBunchWidget> {
  TextEditingController bunchNameController = TextEditingController();
  TextEditingController bunchPriceController = TextEditingController();

  List<String> companies = [];
  String selectedValue = "";



  @override
  void initState() {
    // TODO: implement initState
    // selectedValue = widget.companyName;
    BunchCubit.get(context).getCompaniesList();
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
              padding: isMobile()
                  ? EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 20.h,
                bottom: 20.h,
              )
                  : EdgeInsets.only(
                left: dimension.width10,
                right: dimension.width10,
                top: dimension.height10,
                bottom: dimension.height10,
              ),
              child: DefaultText(
                text: 'تعديل باقة',
                color: ColorsManager.secondaryColor,
                fontSize: isMobile()
                    ? 20.sp
                    : dimension.reduce20,
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
                  horizontal: dimension.width10, vertical: dimension.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isMobile() ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'اسم الباقة',
                            fontSize: 20.sp,
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
                      verticalSpace(10.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'سعر الباقة',
                            color: ColorsManager.lightBlack,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          verticalSpace(5.h),
                          DefaultTextFormField(
                            controller: bunchPriceController,
                            color: Colors.white,
                            hintText: 'سعر الباقة',
                          ),
                        ],
                      ),
                    ],
                  ) :
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
                  isMobile()
                      ? verticalSpace(10.h)
                      : verticalSpace(dimension.height10),
                  BlocConsumer<BunchCubit, BunchState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if(state is GetCompaniesListSuccessState){
                        companies = state.getListsResponse.result!;
                        selectedValue = companies.contains(widget.companyName) ? widget.companyName : companies[0];
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
                          BunchCubit.get(context).updatePlan(
                              updatePlanRequestBody: UpdatePlanRequestBody(
                                companyName: selectedValue,
                                planName: bunchNameController.text,
                                planPrice: int.parse(bunchPriceController.text),
                                planID: widget.planId,
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
