import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/info_widget.dart';
import 'package:system/core/widgets/screen_title_widget.dart';
import 'package:system/core/widgets/search_with_filter_widget.dart';
import '../widgets/subscribers_card.dart';
import '../widgets/subscribers_header_widget.dart';

class SubscribersScreen extends StatelessWidget {
   SubscribersScreen({super.key});

  TextEditingController searchController = TextEditingController();

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
            const ScreenTitleWidget(
              coloredTitle: 'العملاء',
              title: 'المشتركين',
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
                      SearchWithFilterButtonWidget(
                        onTap: () {

                        },
                        searchController: searchController,
                      ),
                      ButtonWithTextAndImageWidget(
                        onPressed: () {},
                        color: const Color(0xffebf5f6),
                        image: 'assets/icons/excel.svg',
                        text: "تنزيل اكسيل",
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const SubscribersHeaderWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return const SubscribersCard();
                      },
                      itemCount: 10,
                    ),
                  ),
                  verticalSpace(dimension.height10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: dimension.width10,),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: dimension.width10,vertical: dimension.height5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               InfoWidget(
                                color:  Color(0xffA92087),
                                text: 'خط محول',
                                textColor: Color(0xFF969AB0),
                              ),
                              horizontalSpace(dimension.width5),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
