import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/add_collector_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_card.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_search_widget.dart';
import 'package:system/features/review_data_screen/presentation/desktop/widgets/review_data_search_widget.dart';

class ReviewDataScreenDetails extends StatelessWidget {
  ReviewDataScreenDetails({super.key});

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
            DefaultText(
              text: 'مراجعة البيانات',
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReviewDataSearchWidget(
                        searchController: searchController,
                      ),
                      // DefaultButton(
                      //   color: const Color(0xffebf5f6),
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: dimension.width15,
                      //     vertical: dimension.height10,
                      //   ),
                      //   onPressed: () {
                      //     showDataAlert(
                      //         context: context,
                      //         child: AddCollectorWidget(
                      //           onPressed: () {},
                      //         ));
                      //   },
                      //   child: DefaultText(
                      //     text: "+ اضافة محصل",
                      //     color: const Color(0xFF007C92),
                      //     fontSize: dimension.reduce20,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  // const CollectorsHeaderWidget(),
                  Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          // return CollectorsCard();
                          return SizedBox.shrink();
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
