import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/business_logic/companies_state.dart';
import 'package:system/features/companies_screen/data/models/get_companies_request_body.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/add_company_widget.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/bloc_listener_for_companies_cubit.dart';
import 'package:system/features/companies_screen/presentation/mobile/widgets/campanies_card_for_mobile.dart';
import 'package:system/features/companies_screen/presentation/mobile/widgets/companies_header_widget_mobile.dart';

class CompaniesScreenMobile extends StatefulWidget {
  const CompaniesScreenMobile({super.key});

  @override
  State<CompaniesScreenMobile> createState() => _CompaniesScreenMobileState();
}

class _CompaniesScreenMobileState extends State<CompaniesScreenMobile> {
  @override
  void initState() {
    // TODO: implement initState
    CompaniesCubit.get(context).getCompanies(
        getCompaniesRequestBody: GetCompaniesRequestBody(companyName: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.lighterGray,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleForScreenWithWidget(
                      title: "الشركات",
                    ),
                    ButtonWithTextAndImageWidget(
                      onPressed: () {
                        showDataAlert(
                          context: context,
                          child: BlocProvider.value(
                            value: getIt<CompaniesCubit>(),
                            child: AddCompanyWidget(),
                          ),
                        );
                      },
                      color: const Color(0xffebf5f6),
                      text: "+ اضافة شركة",
                      fontSize: 16.sp,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      // image: "assets/images/plus.png",
                    ),
                  ],
                ),
              ),
              Container(
                // height: 80.h,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                // color: Colors.blueAccent,
                child: CustomSearchWidget(
                  width: double.infinity,
                  searchController: CompaniesCubit.get(context).searchController,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const CompaniesHeaderWidgetMobile(),
                    BlocBuilder<CompaniesCubit, CompaniesState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return CompaniesCardWidgetMobile(
                                  companyData: CompaniesCubit.get(context)
                                      .companiesData[index],
                                );
                              },
                              itemCount: CompaniesCubit.get(context)
                                  .companiesData
                                  .length),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const BlocListenerForCompaniesCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
