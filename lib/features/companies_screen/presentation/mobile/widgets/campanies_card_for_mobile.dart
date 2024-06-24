import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/data/models/delete_company_request_body.dart';
import 'package:system/features/companies_screen/data/models/get_companies_response.dart';
import 'package:system/features/companies_screen/data/models/update_company_request_body.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/delete_company_widget.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/update_company_widget.dart';

import '../../../data/models/deduct_plan_from_subscribers_request_body.dart';
import '../../../data/models/undo_plan_from_subscribers_request_body.dart';
import '../../desktop/widgets/add_bunch_for_company.dart';
import '../../desktop/widgets/delete_bunch_for_company.dart';

class CompaniesCardWidgetMobile extends StatefulWidget {
  const CompaniesCardWidgetMobile({super.key, required this.companyData});
  final CompanyData companyData;

  @override
  State<CompaniesCardWidgetMobile> createState() =>
      _CompaniesCardWidgetMobileState();
}

class _CompaniesCardWidgetMobileState extends State<CompaniesCardWidgetMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      // height: 70.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(
            color: ColorsManager.lightGray,
          ))),
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 180.w,
            child: DefaultText(
              text: widget.companyData.name??"",
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 120.w,
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      color: const Color(0xffebf5f6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: DefaultText(
                      text: widget.companyData.subscribersCount.toString(),
                      color: ColorsManager.darkBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
          ),
          const Spacer(),
          PopupMenuButton(
            // icon: SvgPicture.asset('assets/icons/more.svg'),
            onSelected: (String choice) {
              // Handle menu item selection
              if (choice == 'option1')
                {
                  showDataAlert(
                      context: context,
                      child: AddBunchForCompany(
                        companyName: widget.companyData.name ?? "",
                        onPressed: () {
                          CompaniesCubit.get(context)
                              .deductPlanFromSubscribers(
                            deductPlanFromSubscribersRequestBody:
                            DeductPlanFromSubscribersRequestBody(
                                companyID: widget.companyData.companyID!),
                          );
                        },
                      ));
                // Perform action for option 1
                // showDataAlert(
                //   context: context,
                //   child: UpdateCompanyWidget(
                //     onPressed: () {
                //       CompaniesCubit.get(context).updateCompany(updateCompanyRequestBody: UpdateCompanyRequestBody(
                //         companyID: widget.companyData.companyID!,
                //       ));
                //     },
                //     companyName: widget.companyData.name ?? "",
                //     companyId: widget.companyData.companyID!,
                //   ),
                // );
              }
              else if (choice == 'option2')
                {
                  showDataAlert(
                    context: context,
                    child: DeleteBunchForCompany(
                      onPressed: () {
                        CompaniesCubit.get(context).undoPlanFromSubscribers(
                          undoPlanFromSubscribersRequestBody:
                          UndoPlanFromSubscribersRequestBody(
                              companyID: widget.companyData.companyID!),
                        );
                      },
                      companyName: "شركة فودافون كفرالشيخ",
                    ),
                  );
              }
              else if (choice == 'option3')
                {
                // Perform action for option 1
                showDataAlert(
                  context: context,
                  child: UpdateCompanyWidget(
                    onPressed: () {
                      CompaniesCubit.get(context).updateCompany(updateCompanyRequestBody: UpdateCompanyRequestBody(
                        companyID: widget.companyData.companyID!,
                      ));
                    },
                    companyName: widget.companyData.name ?? "",
                    companyId: widget.companyData.companyID!,
                  ),
                );
              }
              else if (choice == 'option4')
                {
                // Perform action for option 2
                showDataAlert(
                  context: context,
                  child: DeleteCompanyWidget(
                    onPressed: () {
                      CompaniesCubit.get(context).deleteCompany(deleteCompanyRequestBody: DeleteCompanyRequestBody(
                        companyID: widget.companyData.companyID!,
                      ));
                    },
                    companyName: widget.companyData.name ?? "",
                    companyId: widget.companyData.companyID!,
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 15.w,
                          child: SvgPicture.asset('assets/icons/add_icon.svg')),
                      horizontalSpace(10.w),
                      DefaultText(
                        text: 'اضافة باقة للشركة',
                        color: ColorsManager.darkBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15.w,
                        child: SvgPicture.asset(
                          'assets/icons/remove.svg',
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                      horizontalSpace(10.w),
                      DefaultText(
                        text: 'حذف قيمة باقة للشركة',
                        color: ColorsManager.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'option3',
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 15.w,
                          child: SvgPicture.asset('assets/icons/edit.svg')),
                      horizontalSpace(10.w),
                      DefaultText(
                        text: 'تعديل بيانات الشركة',
                        color: ColorsManager.darkBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'option4',
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15.w,
                        child: SvgPicture.asset(
                          'assets/icons/remove.svg',
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                      horizontalSpace(10.w),
                      DefaultText(
                        text: 'حذف الشركة',
                        color: ColorsManager.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ),
              // Add more PopupMenuItem widgets for additional options
            ],
            child: SvgPicture.asset('assets/icons/more.svg'),
          ),
        ],
      ),
    );
  }
}
