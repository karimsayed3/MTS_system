import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/screen/collectors_screen.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/presentation/desktop/screen/companies_screen_desktop.dart';
import 'package:system/features/customers_screen/presentation/screen/customers_screen.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/screen/history_operations_screen_desktop.dart';
import 'package:system/features/review_data_screen/presentation/desktop/screen/review_data_screen.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({super.key});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  List<String> titles = CacheHelper.getdata(key: "accountType") == "ادمن" ||
          CacheHelper.getdata(key: "accountType") == "موزع"
      ? [
          'الرئيسية',
          'الشركات',
          'المحصلون',
          'المستخدمون',
          'سجل العمليات',
          'مراجعة البيانات',
        ]
      : [
          'الرئيسية',
          'الشركات',
          'المستخدمون',
          'سجل العمليات',
          'مراجعة البيانات',
        ];

  List<Widget> body = CacheHelper.getdata(key: "accountType") == "ادمن" ||
      CacheHelper.getdata(key: "accountType") == "موزع"
      ?  [
          Container(
            color: ColorsManager.secondaryColor,
          ),
          const CompaniesScreen(),
          const CollectorsScreen(),
          const CustomersScreen(),
          const HistoryOperationsDesktopScreen(),
          const ReviewDataScreenDesktop(),
        ]
      : [
          Container(
            color: ColorsManager.secondaryColor,
          ),
          const CompaniesScreen(),
          const CustomersScreen(),
          const HistoryOperationsDesktopScreen(),
          const ReviewDataScreenDesktop(),
        ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CustomNavigationBarWidget(
                body: body,
                changePage: (idx) {
                  setState(() {
                    index = idx;
                  });
                },
                index: index,
                titles: titles,
              ),
            ),
            Expanded(
              flex: 12,
              child: body[index],
            ),
          ],
        ),
      ),
    );
  }
}
