import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/check_platform.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/data/models/add_company_request_body.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/bloc_listener_for_companies_cubit.dart';

class AddCompanyWidget extends StatelessWidget {
  AddCompanyWidget({
    super.key,
    this.fontSize,
    this.headerPadding,
    this.width,
    this.padding,
  });

  double? fontSize;
  EdgeInsetsGeometry? headerPadding;
  double? width;
  EdgeInsetsGeometry? padding;
  TextEditingController companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: ColorsManager.alertDialogHeaderColor,
              width: double.infinity,
              padding: isMobile()
                  ? EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 10.h,
                      bottom: 10.h,
                    )
                  : EdgeInsets.only(
                      left: dimension.width10,
                      right: dimension.width10,
                      top: dimension.height10,
                      bottom: dimension.height10,
                    ),
              child: DefaultText(
                text: 'اضافة شركة',
                color: ColorsManager.secondaryColor,
                fontSize: isMobile() ? 20.sp : dimension.reduce20,
                fontWeight: FontWeight.w700,
              ),
            ),
            isMobile()
                ?  SizedBox.shrink():     const Divider(
              color: ColorsManager.secondaryColor,
              thickness: 2,
              height: 0,
            ),
            isMobile()
                ? verticalSpace(10.h) : verticalSpace(dimension.height10),
            Padding(
              padding: isMobile()
                  ? EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h)
                  : EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'اسم الشركة',
                    fontSize: isMobile() ? 20.sp : dimension.reduce20,
                    fontWeight: FontWeight.w400,
                  ),
                  isMobile()
                      ? verticalSpace(5.h)
                      : verticalSpace(dimension.height5),
                  DefaultTextFormField(
                    controller: companyNameController,
                    color: Colors.white,
                    hintText: "اسم الشركة",
                  ),
                  isMobile()
                      ? verticalSpace(10.h) :    verticalSpace(dimension.height10),
                  Row(
                    children: [
                      DefaultButton(
                        padding: isMobile()
                            ? EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 15.h,
                              )
                            : EdgeInsets.symmetric(
                                horizontal: dimension.width15,
                                vertical: dimension.height15,
                              ),
                        onPressed: () {
                          CompaniesCubit.get(context).addCompany(
                            addCompanyRequestBody: AddCompanyRequestBody(
                              companyName: companyNameController.text,
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
            const BlocListenerForCompaniesCubit()
          ],
        ),
      ),
    );
  }
}
