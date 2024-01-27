import 'package:flutter/material.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';
import 'package:system/features/companies_screen/presentation/screen/companies_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    Container(
      color: ColorsManager.lightGray,
    ),
    Container(
      color: ColorsManager.lighterGray,
    ),
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
