import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/routing/routers.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/home_screen/presentation/desktop/widgets/logo_widget.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/business_logic/login_state.dart';
import 'package:system/main.dart';

import '../../create_pdf.dart';

class CustomNavigationBarWidget extends StatefulWidget {
  CustomNavigationBarWidget(
      {super.key,
      required this.titles,
      required this.index,
      required this.body,
      required this.changePage});

  final List<String> titles;
  final List<Widget> body;
  final Function(dynamic i) changePage;
  int index;

  @override
  State<CustomNavigationBarWidget> createState() =>
      _CustomNavigationBarWidgetState();
}

class _CustomNavigationBarWidgetState extends State<CustomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dimension.width30),
      decoration: const BoxDecoration(
        // color: Color(0xFF213555),
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoWidget(),
          Row(
            children: List.generate(widget.body.length, (idx) {
              return InkWell(
                onTap: () {
                  widget.changePage(idx);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: dimension.width10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: widget.index == idx
                              ? ColorsManager.primaryColor
                              : Colors.transparent,
                          width: 3),
                    ),
                  ),
                  child: Center(
                    child: DefaultText(
                      text: widget.titles[idx],
                      color: widget.index == idx
                          ? ColorsManager.darkBlack
                          : ColorsManager.lightGray,
                      fontSize: dimension.reduce20,
                      // fontFamily: 'Almarai',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              horizontalSpace(dimension.width10),
              Row(
                children: [
                  // SvgPicture.asset("assets/icons/power-off-icon.svg"),
                  TextButton(
                      onPressed: () {
                        // LoginCubit.get(context).logout();
                        createPdfReceipt();
                      },
                      child: DefaultText(
                        text: "تسجيل خروج",
                        fontSize: 20,
                        color: ColorsManager.primaryColor,
                      )),
                ],
              ),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LogoutSuccess) {
                    CacheHelper.removeData(key: 'login');
                    CacheHelper.removeData(key: 'accessToken');
                    CacheHelper.removeData(key: 'unit');
                    CacheHelper.removeData(key: 'token');
                    navigateToPage(Routes.loginScreenDesktop);
                  }
                },
                child: const SizedBox.shrink(),
              )
              // DefaultButton(
              //   onPressed: () {
              //   },
              //   child: DefaultText(
              //     text: "تسجيل الخروج",
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

void navigateToPage(String pageName, {dynamic arguments}) {
  if (openedPages.last.keys.last != pageName) {
    openedPages.add({pageName: arguments});
    navigatorKey.currentState?.popAndPushNamed(pageName, arguments: arguments);
    print(openedPages);
  }
}

void onPop() {
  if (openedPages.length > 1) {
    navigatorKey.currentState?.pop();
    openedPages.removeAt(openedPages.length - 1);
    navigatorKey.currentState?.pushNamed(openedPages.last.keys.last,
        arguments: openedPages.last.values.last);
    print(openedPages);
  }
}

void remove() {
  openedPages = [
    {
      Routes.loginScreenDesktop: null,
    }
  ];
  print(openedPages);
}
