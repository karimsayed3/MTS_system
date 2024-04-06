import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/routing/routers.dart';
import '../../../../../core/widgets/custom_navigation_bar_widget.dart';
import '../../../../../create_pdf.dart';
import '../../../../login_screen/business_logic/login_state.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int index = -1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            /// header widget
            ListTile(
              title: DefaultText(
                text: 'القائمة',
                fontSize: 20.sp,
              ),
              leading: SizedBox(
                height: 50.h,
                width: 50.w,
                child: Image.asset(
                  'assets/images/vodafone-logo.png',
                ),
              ),
            ),
            CacheHelper.getdata(key: "accountType") == "ادمن"
                ? DefaultButton(
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () {
                      if (index != 0) {
                        setState(() {
                          index = 0;
                        });
                      } else {
                        setState(() {
                          index = -1;
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/building.svg"),
                          horizontalSpace(10.w),
                          DefaultText(
                            text: 'الشركات',
                            fontSize: 16.sp,
                            color: ColorsManager.darkBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            if (index == 0)
              ListTile(
                title: const Text('الشركات'),
                onTap: () {
                  // Change to page 1
                  widget.pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  Navigator.pop(context); // Close drawer
                },
              ),
            if (index == 0)
              ListTile(
                title: const Text('الباقات'),
                onTap: () {
                  // Change to page 2
                  widget.pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  Navigator.pop(context); // Close drawer
                },
              ),
             DefaultButton(
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () {
                      if (index != 1) {
                        setState(() {
                          index = 1;
                        });
                      } else {
                        setState(() {
                          index = -1;
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/collectors.svg"),
                          horizontalSpace(10.w),
                          DefaultText(
                            text: 'المحصلون',
                            fontSize: 16.sp,
                            color: ColorsManager.darkBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
            if (index == 1)
              ListTile(
                title: const Text('المحصلين'),
                onTap: () {
                  // Change to page 2
                  widget.pageController.animateToPage(7,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  Navigator.pop(context); // Close drawer
                },
              ),
            if (index == 1)
              ListTile(
              title: const Text('طلبات المحصلون'),
              onTap: () {
                // Change to page 2
                widget.pageController.animateToPage(10,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
                Navigator.pop(context); // Close drawer
              },
            ),
            DefaultButton(
              color: Colors.white,
              elevation: 0,
              onPressed: () {
                if (index != 2) {
                  setState(() {
                    index = 2;
                  });
                } else {
                  setState(() {
                    index = -1;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/subscribers.svg"),
                    horizontalSpace(10.w),
                    DefaultText(
                      text: 'العملاء',
                      fontSize: 16.sp,
                      color: ColorsManager.darkBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            if (index == 2)
              ListTile(
                title: const Text('المشتركين'),
                onTap: () {
                  // Change to page 2
                  widget.pageController.animateToPage(3,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  Navigator.pop(context); // Close drawer
                },
              ),
            if (index == 2)
              CacheHelper.getdata(key: "accountType") == "ادمن"
                  ? ListTile(
                      title: const Text('المتأخرين'),
                      onTap: () {
                        // Change to page 2
                        widget.pageController.animateToPage(4,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        Navigator.pop(context); // Close drawer
                      },
                    )
                  : const SizedBox.shrink(),
            if (index == 2)
              CacheHelper.getdata(key: "accountType") == "ادمن" ||
                      CacheHelper.getdata(key: "accountType") == "موزع"
                  ? ListTile(
                      title: const Text('المعطلين'),
                      onTap: () {
                        // Change to page 2
                        widget.pageController.animateToPage(5,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        Navigator.pop(context); // Close drawer
                      },
                    )
                  : const SizedBox.shrink(),
            if (index == 2)
              CacheHelper.getdata(key: "accountType") == "ادمن" ||
                      CacheHelper.getdata(key: "accountType") == "موزع"
                  ? ListTile(
                      title: const Text('المسحوبين'),
                      onTap: () {
                        // Change to page 2
                        widget.pageController.animateToPage(6,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        Navigator.pop(context); // Close drawer
                      },
                    )
                  : const SizedBox.shrink(),
            DefaultButton(
              color: Colors.white,
              elevation: 0,
              onPressed: () {
                if (index != 3) {
                  setState(() {
                    index = 3;
                  });
                } else {
                  setState(() {
                    index = -1;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/historicalData.svg"),
                    horizontalSpace(10.w),
                    DefaultText(
                      text: 'سجل العمليات',
                      fontSize: 16.sp,
                      color: ColorsManager.darkBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            if (index == 3)
              ListTile(
                title: const Text('سجل العمليات'),
                onTap: () {
                  // Change to page 2
                  widget.pageController.animateToPage(8,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  Navigator.pop(context); // Close drawer
                },
              ),
            CacheHelper.getdata(key: "accountType") == "ادمن"
                ? DefaultButton(
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () {
                      if (index != 4) {
                        setState(() {
                          index = 4;
                        });
                      } else {
                        setState(() {
                          index = -1;
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/dataReview.svg"),
                          horizontalSpace(10.w),
                          DefaultText(
                            text: 'مراجعة البيانات',
                            fontSize: 16.sp,
                            color: ColorsManager.darkBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            if (index == 4)
              ListTile(
                title: const Text('مراجعة البيانات'),
                onTap: () {
                  // Change to page 2
                  widget.pageController.animateToPage(9,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  Navigator.pop(context); // Close drawer
                },
              ),
            verticalSpace(20.h),
            Row(
              children: [
                // SvgPicture.asset("assets/icons/power-off-icon.svg"),
                TextButton(
                  onPressed: () async {
                    // LoginCubit.get(context).logout();
                    // createPdfReceipt(
                    //   context: context,
                    // );
                    navigateToPage(Routes.printerScreen,arguments:  {'imgPath': await createPdfReceiptForMobile(context: context)});

                  },
                  child: DefaultText(
                    text: "تسجيل خروج",
                    fontSize: 20,
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ],
            ),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  CacheHelper.removeData(key: 'login');
                  CacheHelper.removeData(key: 'accessToken');
                  CacheHelper.removeData(key: 'unit');
                  CacheHelper.removeData(key: 'token');
                  navigateToPage(Routes.loginScreenMobile);
                }
              },
              child: const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
