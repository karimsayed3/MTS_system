import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/header_label_with_image.dart';
import 'package:system/core/widgets/header_widget.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/features/companies_screen/presentation/widgets/companies_card.dart';
import 'package:system/features/companies_screen/presentation/widgets/companies_search_widget.dart';

import 'companies_header_widget.dart';

class CompaniesScreenDetails extends StatefulWidget {
  const CompaniesScreenDetails({super.key});

  @override
  State<CompaniesScreenDetails> createState() => _CompaniesScreenDetailsState();
}

class _CompaniesScreenDetailsState extends State<CompaniesScreenDetails> {
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
              horizontal: dimension.width10,
              vertical: dimension.height10,
              height: MediaQuery.of(context).size.height * .72,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CompaniesSearchWidget(),
                      DefaultButton(
                          color: const Color(0xffebf5f6),
                          padding: EdgeInsets.symmetric(
                            horizontal: dimension.width15,
                            vertical: dimension.height10,
                          ),
                          onPressed: () {},
                          child: DefaultText(
                            text: "+ اضافة شركة",
                            color: const Color(0xFF007C92),
                            fontSize: dimension.reduce20,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const CompaniesHeaderWidget(),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CompaniesCard();
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
