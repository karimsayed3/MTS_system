import 'package:flutter/material.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/companies_nav_bar_widget.dart';
import 'package:system/features/disabled_customers_screen/presentation/desktop/screen/disabled_customers_screen.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/screen/late_customers_screen.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/screen/subscribers_screen.dart';
import 'package:system/features/withdrawn_customers_screen/presentation/desktop/screen/withdrawn_customers_screen.dart';

import '../../../../core/helpers/dimensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_text.dart';
import '../../../../core/widgets/home_widget.dart';
import '../../../bunches_screen/presentation/desktop/screen/bunch_screen_details.dart';
import '../../../collectors_screen/presentation/desktop/widgets/collectors_card.dart';
import '../../../companies_screen/presentation/desktop/widgets/companies_header_widget.dart';
import '../../../companies_screen/presentation/desktop/widgets/companies_screen_details.dart';
import '../../../companies_screen/presentation/desktop/widgets/companies_search_widget.dart';
import '../widgets/customers_nav_bar_widget.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  List<Widget> body = [
    SubscribersScreen(),
    LateCustomersScreen(),
    DisabledCustomersScreen(),
    WithdrawnCustomersScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomersNavBarWidget(
          index: index,
          onTapSubscribers: () {
            setState(() {
              index = 0;
            });
          },
          onTapLatecomers: () {
            setState(() {
              index = 1;
            });
          },
          onTapDisabled: () {
            setState(() {
              index = 2;
            });
          },
          onTapWithdrawn: () {
            setState(() {
              index = 3;
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
