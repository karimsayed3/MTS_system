import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_request_body.dart';
import 'package:system/features/bunches_screen/presentation/desktop/screen/bunch_screen_details.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/nav_card_widget.dart';

import '../../../data/models/get_companies_request_body.dart';
import '../widgets/companies_nav_bar_widget.dart';
import '../widgets/companies_screen_details.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  List<Widget> body = [
    BlocProvider.value(
      value: getIt<CompaniesCubit>(),
      child: const CompaniesScreenDetails(),
    ),
    BlocProvider.value(
      value: getIt<BunchCubit>(),
      child: const BunchScreenDetails(),
    ),
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
