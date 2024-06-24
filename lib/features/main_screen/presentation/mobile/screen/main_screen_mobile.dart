import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../desktop/widgets/card_for_short_cuts.dart';

class MainMobileScreen extends StatefulWidget {
  const MainMobileScreen({super.key});

  @override
  State<MainMobileScreen> createState() => _MainMobileScreenState();
}

class _MainMobileScreenState extends State<MainMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CardForShortCuts(
                        iconPath: 'assets/icons/wallet-add.svg',
                        title: 'اضافة رصيد',
                        onTap: () {},
                      ),
                      horizontalSpace(15.w),
                      CardForShortCuts(
                        iconPath: 'assets/icons/receipt-text.svg',
                        title: 'ايصال سداد فاتورة',
                        onTap: () {},
                      ),

                    ],
                  ),
                  verticalSpace(10.h) ,
                  Row(
                    children: [
                      CardForShortCuts(
                        iconPath: 'assets/icons/user-add.svg',
                        title: 'اضافة مشترك',
                        onTap: () {},
                      ),
                      horizontalSpace(15.w),
                      CardForShortCuts(
                        iconPath: 'assets/icons/user-add.svg',
                        title: 'اضافة محصل',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ]
          )
        ),
      ),
    );
  }
}
