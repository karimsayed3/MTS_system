import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/features/companies_screen/presentation/widgets/companies_card.dart';
import 'package:system/features/companies_screen/presentation/widgets/companies_header_widget.dart';
import '../widgets/subscribers_widgets/subscribers_card.dart';
import '../widgets/subscribers_widgets/subscribers_header_widget.dart';
import '../widgets/subscribers_widgets/subscribers_search_widget.dart';

class SubscribersScreen extends StatefulWidget {
  const SubscribersScreen({super.key});

  @override
  State<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends State<SubscribersScreen> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: DefaultText(
                    text: "العملاء",
                    color: Color(0xFF007C92),
                    fontSize: dimension.reduce20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(Icons.arrow_back_ios_new,color: ColorsManager.lightGray,size: dimension.width10),
                DefaultText(
                  text: 'المشتركين',
                  fontSize: dimension.reduce20,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            verticalSpace(dimension.height5),
            HomeWidget(
              horizontal: dimension.width10,
              vertical: dimension.height10,
              height: MediaQuery.of(context).size.height * .72,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SubscribersSearchWidget(),
                      DefaultButton(
                        color: const Color(0xffebf5f6),
                        padding: EdgeInsets.symmetric(
                          horizontal: dimension.width15,
                          vertical: dimension.height10,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/excel.svg'),
                            horizontalSpace(dimension.width5),
                            DefaultText(
                              text: "تنزيل اكسيل",
                              color: const Color(0xFF007C92),
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const SubscribersHeaderWidget(),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SubscribersCard();
                    },
                    itemCount: 10,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
