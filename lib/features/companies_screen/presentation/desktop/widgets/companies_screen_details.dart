import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'companies_header_widget.dart';

class CompaniesScreenDetails extends StatefulWidget {
  const CompaniesScreenDetails({super.key});

  @override
  State<CompaniesScreenDetails> createState() => _CompaniesScreenDetailsState();
}

class _CompaniesScreenDetailsState extends State<CompaniesScreenDetails> {
  @override
  void initState() {
    CompaniesCubit.get(context).getCompanies(
      getCompaniesRequestBody: GetCompaniesRequestBody(
        companyName: "",
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
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
                      ),
                      const AddCompanyButton(),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const CompaniesHeaderWidget(),
                  BlocBuilder<CompaniesCubit, CompaniesState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CompaniesCard(
                              companyData: CompaniesCubit.get(context)
                                  .companiesData[index],
                            );
                          },
                          itemCount:
                              CompaniesCubit.get(context).companiesData.length,
                        ),
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
    );
  }
}
