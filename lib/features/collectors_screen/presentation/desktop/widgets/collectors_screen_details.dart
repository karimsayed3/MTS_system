import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_card.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_search_widget.dart';
import 'collectors_header_widget.dart';

class CollectorsScreenDetails extends StatefulWidget {
  const CollectorsScreenDetails({super.key});

  @override
  State<CollectorsScreenDetails> createState() => _CollectorsScreenDetailsState();
}

class _CollectorsScreenDetailsState extends State<CollectorsScreenDetails> {
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
            DefaultText(
              text: 'المحصلون',
              fontSize: dimension.reduce20,
              fontWeight: FontWeight.w400,
            ),
            verticalSpace(dimension.height5),
            HomeWidget(
              horizontal: dimension.width10,
              vertical: dimension.height10,
              height: MediaQuery.of(context).size.height * .8,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CollectorsSearchWidget(),
                      // DefaultButton(
                      //   color: const Color(0xffebf5f6),
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: dimension.width15,
                      //     vertical: dimension.height10,
                      //   ),
                      //   onPressed: () {},
                      //   child: DefaultText(
                      //     text: "+ اضافة شركة",
                      //     color: const Color(0xFF007C92),
                      //     fontSize: dimension.reduce20,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const CollectorsHeaderWidget(),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return  CollectorsCard();
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
