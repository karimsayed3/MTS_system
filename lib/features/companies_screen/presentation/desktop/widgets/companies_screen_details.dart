import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/header_label_with_image_desktop.dart';
import 'package:system/core/widgets/header_widget.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/add_company_button.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/add_company_widget.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/companies_card.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/companies_search_widget.dart';

import 'companies_header_widget.dart';

class CompaniesScreenDetails extends StatefulWidget {
  const CompaniesScreenDetails({super.key});

  @override
  State<CompaniesScreenDetails> createState() => _CompaniesScreenDetailsState();
}

class _CompaniesScreenDetailsState extends State<CompaniesScreenDetails> {
  TextEditingController searchController = TextEditingController();

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
                        searchController: searchController,
                      ),
                      AddCompanyButton(
                        onPressed: () {},
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const CompaniesHeaderWidget(),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return const CompaniesCard();
                    },
                    itemCount: 10,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
