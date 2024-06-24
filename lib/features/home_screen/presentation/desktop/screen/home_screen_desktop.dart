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
import 'package:system/features/history_operations_screen/business_logic/history_operations_cubit.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/screen/history_operations_screen_desktop.dart';
import 'package:system/features/main_screen/presentation/desktop/screen/main_screen_desktop.dart';
import 'package:system/features/review_data_screen/presentation/desktop/screen/review_data_screen.dart';

import '../../../../../core/routing/routers.dart';
import '../../../../login_screen/business_logic/login_cubit.dart';
import '../../../../login_screen/business_logic/login_state.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({super.key});

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {

  List<String> titles = CacheHelper.getdata(key: "accountType") == "ادمن" ? [
    'الرئيسية',
    'الشركات',
    'المحصلون',
    'العملاء',
    'سجل العمليات',
    'مراجعة البيانات',
  ] : CacheHelper.getdata(key: "accountType") == "موزع" ? [
    'الرئيسية',
    'المحصلون',
    'العملاء',
    'سجل العمليات',
  ] : CacheHelper.getdata(key: "accountType") == "محصل" ? [
    'الرئيسية',
    'العملاء',
    'سجل العمليات',
  ] : [];

  List<Widget> body = CacheHelper.getdata(key: "accountType") == "ادمن" ? [
    BlocProvider.value(
      value: getIt<HistoryOperationsCubit>(),
      child: const MainScreenDesktop(),
    ),
    const CompaniesScreen(),
    CollectorsScreen(),
    const CustomersScreen(),
    const HistoryOperationsDesktopScreen(),
    const ReviewDataScreenDesktop(),
  ] : CacheHelper.getdata(key: "accountType") == "موزع" ? [
    BlocProvider.value(
      value: getIt<HistoryOperationsCubit>(),
      child: const MainScreenDesktop(),
    ),
    CollectorsScreen(),
    const CustomersScreen(),
    const HistoryOperationsDesktopScreen(),
  ] : CacheHelper.getdata(key: "accountType") == "محصل" ? [
    BlocProvider.value(
      value: getIt<HistoryOperationsCubit>(),
      child: const MainScreenDesktop(),
    ),
    const CustomersScreen(),
    /// TODO
    /// remove this from here
    const HistoryOperationsDesktopScreen(),
  ] : [];

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
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                state.whenOrNull(
                    logoutSuccess: (data) {
                      navigateToPage(Routes.loginScreenDesktop,);
                      print("object");
                    }
                );
              },
              builder: (context, state) {
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
