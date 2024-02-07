import 'package:flutter/material.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';
import 'package:system/features/collectors_screen/presentation/screen/collectors_screen.dart';
import 'package:system/features/companies_screen/presentation/desktop/screen/companies_screen_desktop.dart';
import 'package:system/features/customers_screen/presentation/screen/customers_screen.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({super.key});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  List<String> titles = [
    'الرئيسية',
    'الشركات',
    'المحصلون',
    'المستخدمون',
    'سجل العمليات',
  ];

  List<Widget> body = [
    Container(
      color: ColorsManager.secondaryColor,
    ),
    CompaniesScreen(),
    CollectorsScreen(),
    CustomersScreen(),
    Container(
      color: ColorsManager.lightBlack,
    ),
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
