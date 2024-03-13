import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/companies_nav_bar_widget.dart';
import 'package:system/features/disabled_customers_screen/presentation/desktop/screen/disabled_customers_screen.dart';
import 'package:system/features/late_customers_screen/presentation/desktop/screen/late_customers_screen.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/screen/subscribers_screen.dart';
import 'package:system/features/withdrawn_customers_screen/presentation/desktop/screen/withdrawn_customers_screen.dart';
import '../widgets/customers_nav_bar_widget.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  List<Widget> body = [
    BlocProvider.value(
      value: getIt<SubscribersCubit>(),
      child: SubscribersScreen(),
    ),
    BlocProvider.value(
      value: getIt<SubscribersCubit>(),
      child: LateCustomersScreen(),
    ),
    BlocProvider.value(
      value: getIt<SubscribersCubit>(),
      child: DisabledCustomersScreen(),
    ),
    BlocProvider.value(
      value: getIt<SubscribersCubit>(),
      child: WithdrawnCustomersScreen(),
    ),
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
