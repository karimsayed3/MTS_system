import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/header_label_with_image_desktop.dart';
import 'package:system/core/widgets/header_widget.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/business_logic/companies_state.dart';
import 'package:system/features/companies_screen/data/models/get_companies_request_body.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/add_company_button.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/add_company_widget.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/bloc_listener_for_companies_cubit.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/companies_card.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/companies_search_widget.dart';
import '../../../../../core/widgets/no_data_widget.dart';
import '../../../data/models/get_companies_response.dart';
import 'companies_header_widget.dart';

class CompaniesScreenDetails extends StatefulWidget {
  const CompaniesScreenDetails({super.key});

  @override
  State<CompaniesScreenDetails> createState() => _CompaniesScreenDetailsState();
}

class _CompaniesScreenDetailsState extends State<CompaniesScreenDetails>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    CompaniesCubit.get(context).getCompanies(
      getCompaniesRequestBody: GetCompaniesRequestBody(
        companyName: "",
      ),
    );
    super.initState();
  }

  CompaniesCubit? _companiesCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _companiesCubit ??= BlocProvider.of<CompaniesCubit>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    // Clear the companiesData list
    _companiesCubit!.changeListData(companiesData: []);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var dimension = Dimensions(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: 'الشركات',
                fontSize: dimension.reduce20,
                fontWeight: FontWeight.w400,
              ),
              verticalSpace(dimension.height5),
              HomeWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CompaniesSearchWidget(
                          searchController:
                              CompaniesCubit.get(context).searchController,
                          onChange: (value) {
                            CompaniesCubit.get(context).getCompanies(
                              getCompaniesRequestBody: GetCompaniesRequestBody(
                                companyName: value,
                              )
                            );
                          }
                        ),
                        const AddCompanyButton(),
                      ],
                    ),
                    BlocBuilder<CompaniesCubit, CompaniesState>(
                      builder: (context, state) {
                        if (CompaniesCubit.get(context).companiesData.isEmpty) {
                          return const Expanded(
                            child: NoDataWidget(
                              child: AddCompanyButton(),
                            )
                            // child: Center(
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       SvgPicture.asset(
                            //         'assets/icons/no_data.svg',
                            //         fit: BoxFit.contain,
                            //       ),
                            //       verticalSpace(dimension.height10),
                            //       DefaultText(
                            //         text: 'لا توجد بيانات متاحة للعرض حتي الان',
                            //         fontSize: dimension.reduce20,
                            //         fontWeight: FontWeight.w400,
                            //         color: ColorsManager.darkBlack,
                            //       ),
                            //       verticalSpace(dimension.height10),
                            //       SizedBox(width: dimension.width125,child: const AddCompanyButton()),
                            //     ],
                            //   ),
                            // ),
                          );
                        }
                        else
                        {
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(dimension.height10),
                                const CompaniesHeaderWidget(),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return CompaniesCard(
                                        companyData: CompaniesCubit.get(context)
                                            .companiesData[index],
                                      );
                                    },
                                    itemCount: CompaniesCubit.get(context)
                                        .companiesData
                                        .length,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
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
