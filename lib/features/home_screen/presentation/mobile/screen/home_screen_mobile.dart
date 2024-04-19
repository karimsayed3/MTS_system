import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/presentation/mobile/screen/bunch_screen_mobile.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/presentation/mobile/screen/companies_screen_mobile.dart';
import 'package:system/features/home_screen/presentation/mobile/widgets/drawer.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/presentation/mobile/screen/subscribers_screen_mobile.dart';

import '../../../../collectors_screen/presentation/mobile/screen/collectors_screen_mobile.dart';
import '../../../../disabled_customers_screen/presentation/mobile/screen/disabled_customers_screen_mobile.dart';
import '../../../../history_operations_screen/business_logic/history_operations_cubit.dart';
import '../../../../history_operations_screen/presentation/mobile/screen/history_operations_mobile_screen.dart';
import '../../../../late_customers_screen/presentation/mobile/screen/late_customers_screen_mobile.dart';
import '../../../../login_screen/business_logic/login_cubit.dart';
import '../../../../main_screen/presentation/mobile/screen/main_screen_mobile.dart';
import '../../../../resellers_requests_screen/presentation/mobile/screen/resellers_requests_screen.dart';
import '../../../../review_data_screen/business_logic/review_data_cubit.dart';
import '../../../../review_data_screen/presentation/mobile/screen/review_data_screen_mobile.dart';
import '../../../../withdrawn_customers_screen/presentation/mobile/screen/withdrawn_customers_screen_mobile.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 1;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _onItemTapped(int index) {
    // pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    // setState(() {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: BlocProvider.value(
            value: getIt<LoginCubit>(),
            child: DrawerWidget(
              pageController: pageController,
            ),
          ),
          body: _currentIndex == 0 ? PageView(
            controller: pageController,
            onPageChanged: _onItemTapped,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox.shrink(),
              BlocProvider.value(
                value: getIt<CompaniesCubit>(),
                child: const CompaniesScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<BunchCubit>(),
                child: const BunchScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<SubscribersCubit>(),
                child: const SubscribersScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<SubscribersCubit>(),
                child: const LateCustomersScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<SubscribersCubit>(),
                child: const DisabledCustomersScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<SubscribersCubit>(),
                child: const WithdrawnCustomersScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<CollectorsCubit>(),
                child: const CollectorsScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<HistoryOperationsCubit>(),
                child: const HistoryOperationsMobileScreen(),
              ),
              BlocProvider.value(
                value: getIt<ReviewDataCubit>(),
                child: const ReviewDataScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<CollectorsRequestsCubit>(),
                child: const ResellersRequestsScreen(),
              ),
              const Center(child: Text('HomeScreen')),
            ],
          ) : const MainMobileScreen(),
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/category.svg', color: Colors.grey,),
                  label: "القائمة",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/home.svg'),
                  label: "الرئيسية",
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (value) {
                if (value == 0) {
                  _openDrawer();
                }
                if (value == 1) {
                  pageController.animateToPage(10,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
