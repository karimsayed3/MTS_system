import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/search_with_filter_widget.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/history_operation_card.dart';
import 'package:system/features/history_operations_screen/presentation/desktop/widgets/history_operations_header_widget.dart';

class HistoryOperationDetailsScreen extends StatefulWidget {
  const HistoryOperationDetailsScreen({super.key});

  @override
  State<HistoryOperationDetailsScreen> createState() => _HistoryOperationDetailsScreenState();
}

class _HistoryOperationDetailsScreenState extends State<HistoryOperationDetailsScreen> {


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
              text: 'سجل العمليات',
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
                      // CollectorsSearchWidgeget(),
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
                  const HistoryOperationsHeaderWidget(),
                  Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return  const HistoryOperationCard();
                          // return SizedBox.shrink();
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
