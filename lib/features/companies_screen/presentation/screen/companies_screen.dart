import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/companies_screen/presentation/widgets/bunch_screen_details.dart';
import 'package:system/features/companies_screen/presentation/widgets/nav_card_widget.dart';

import '../widgets/companies_nav_bar_widget.dart';
import '../widgets/companies_screen_details.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  List<Widget> body = [
    const CompaniesScreenDetails(),
    const BunchScreenDetails(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompaniesNavBarWidget(
          index: index,
          onTapCompanies: () {
            setState(() {
              index = 0;
            });
          },
          onTapBunch: () {
            setState(() {
              index = 1;
            });
          },
        ),
        Expanded(
          flex: 10,
          child: body[index],
        ),
      ],
    );
  }
}
