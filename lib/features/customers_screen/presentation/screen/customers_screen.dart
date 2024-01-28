import 'package:flutter/material.dart';
import 'package:system/features/companies_screen/presentation/widgets/companies_nav_bar_widget.dart';
import 'package:system/features/customers_screen/presentation/screen/subscribers_screen.dart';

import '../../../../core/helpers/dimensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_text.dart';
import '../../../../core/widgets/home_widget.dart';
import '../../../companies_screen/presentation/widgets/bunch_screen_details.dart';
import '../../../companies_screen/presentation/widgets/companies_card.dart';
import '../../../companies_screen/presentation/widgets/companies_header_widget.dart';
import '../../../companies_screen/presentation/widgets/companies_screen_details.dart';
import '../../../companies_screen/presentation/widgets/companies_search_widget.dart';
import '../widgets/customers_nav_bar_widget.dart';

class CustomersScreen extends StatefulWidget {
  CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  List<Widget> body = [
    const SubscribersScreen(),
    Container(),
     Container(),
     Container(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomersNavBarWidget(
          index: index,
          onTapSubscribers: () {
            setState(() {
              index = 0;
            });
          },
          onTapLatecomers: () {
            setState(() {
              index = 1;
            });
          },
          onTapDisabled: () {
            setState(() {
              index = 2;
            });
          },
          onTapWithdrawn: () {
            setState(() {
              index = 3;
            });
          },
        ),
        Expanded(
          flex: 10,
          child: body[index],
        ),
      ],
    );
    // return Container(
    //   width: double.infinity,
    //   height: double.infinity,
    //   color: ColorsManager.backgroundColor,
    //   child: Padding(
    //     padding: EdgeInsets.symmetric(
    //         horizontal: dimension.width30, vertical: dimension.height10),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         DefaultText(
    //           text: 'الشركات',
    //           fontSize: dimension.reduce20,
    //           fontWeight: FontWeight.w400,
    //         ),
    //         verticalSpace(dimension.height5),
    //         HomeWidget(
    //           horizontal: dimension.width10,
    //           vertical: dimension.height10,
    //           height: MediaQuery.of(context).size.height * .72,
    //           width: MediaQuery.of(context).size.width,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   const CompaniesSearchWidget(),
    //                   DefaultButton(
    //                     color: const Color(0xffebf5f6),
    //                     padding: EdgeInsets.symmetric(
    //                       horizontal: dimension.width15,
    //                       vertical: dimension.height10,
    //                     ),
    //                     onPressed: () {},
    //                     child: DefaultText(
    //                       text: "+ اضافة شركة",
    //                       color: const Color(0xFF007C92),
    //                       fontSize: dimension.reduce20,
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               verticalSpace(dimension.height10),
    //               const CompaniesHeaderWidget(),
    //               Expanded(
    //                   child: ListView.builder(
    //                     itemBuilder: (context, index) {
    //                       return CompaniesCard();
    //                     },
    //                     itemCount: 10,
    //                   ))
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
