import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/collectors_screen/presentation/mobile/screen/collectors_screen_mobile.dart';
import 'package:system/features/bunches_screen/presentation/mobile/screen/bunch_screen_mobile.dart';
import 'package:system/features/companies_screen/presentation/mobile/screen/companies_screen_mobile.dart';
import 'package:system/features/disabled_customers_screen/presentation/mobile/screen/disabled_customers_screen_mobile.dart';
import 'package:system/features/late_customers_screen/presentation/mobile/screen/late_customers_screen_mobile.dart';
import 'package:system/features/review_data_screen/presentation/mobile/screen/review_data_screen_mobile.dart';
import 'package:system/features/subscribers_screen/presentation/mobile/screen/subscribers_screen_mobile.dart';
import 'package:system/features/withdrawn_customers_screen/presentation/mobile/screen/withdrawn_customers_screen_mobile.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueAccent,
          ),
          body:const ReviewDataScreenMobile(),
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "الرئيسية",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "البحث",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "حسابي",
                )
              ],
              currentIndex: 0,
              onTap: (value) {
                if(value ==0){
                  _scaffoldKey.currentState?.openDrawer();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
