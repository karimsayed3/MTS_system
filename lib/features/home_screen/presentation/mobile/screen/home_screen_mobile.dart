import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/presentation/mobile/screen/bunch_screen_mobile.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/presentation/mobile/screen/companies_screen_mobile.dart';
import 'package:system/features/subscribers_screen/presentation/mobile/screen/subscribers_screen_mobile.dart';

import '../../../../collectors_screen/presentation/mobile/screen/collectors_screen_mobile.dart';
import '../../../../disabled_customers_screen/presentation/mobile/screen/disabled_customers_screen_mobile.dart';
import '../../../../history_operations_screen/presentation/mobile/screen/history_operations_mobile_screen.dart';
import '../../../../late_customers_screen/presentation/mobile/screen/late_customers_screen_mobile.dart';
import '../../../../resellers_requests_screen/presentation/screen/resellers_requests_screen.dart';
import '../../../../review_data_screen/presentation/mobile/screen/review_data_screen_mobile.dart';
import '../../../../withdrawn_customers_screen/presentation/mobile/screen/withdrawn_customers_screen_mobile.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _onItemTapped(int index) {
    // _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('الشركات'),
                  onTap: () {
                    // Change to page 1
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
                ListTile(
                  title: const Text('الباقات'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
                ListTile(
                  title: const Text('المشتركين'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
                ListTile(
                  title: const Text('المتأخرين'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
                ListTile(
                  title: const Text('المعطلين'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(4,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
                ListTile(
                  title: const Text('المسحوبين'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(5,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
                ListTile(
                  title: const Text('المحصلين'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(6,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
                ListTile(
                  title: const Text('سجل العمليات'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(7,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),ListTile(
                  title: const Text('مراجعة البيانات'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(8,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),ListTile(
                  title: const Text('طلبات المحصلون'),
                  onTap: () {
                    // Change to page 2
                    _pageController.animateToPage(9,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    Navigator.pop(context); // Close drawer
                  },
                ),
              ],
            ),
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: _onItemTapped,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocProvider.value(
                value: getIt<CompaniesCubit>(),
                child: const CompaniesScreenMobile(),
              ),
              BlocProvider.value(
                value: getIt<BunchCubit>(),
                child: const BunchScreenMobile(),
              ),
              const SubscribersScreenMobile(),
              const LateCustomersScreenMobile(),
              const DisabledCustomersScreenMobile(),
              const WithdrawnCustomersScreenMobile(),
              const CollectorsScreenMobile(),
              const HistoryOperationsMobileScreen(),
              const ReviewDataScreenMobile(),
              const ResellersRequestsScreen(),
              const Center(child: Text('HomeScreen')),
            ],
          ),
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/category.svg',color: Colors.grey,),
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
                  _pageController.animateToPage(10,
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
