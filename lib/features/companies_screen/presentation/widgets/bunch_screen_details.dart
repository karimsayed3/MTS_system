import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/header_label_with_image.dart';
import 'package:system/core/widgets/header_widget.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/features/companies_screen/presentation/widgets/bunch_card.dart';
import 'package:system/features/collectors_screen/presentation/widgets/collectors_card.dart';
import 'package:system/features/companies_screen/presentation/widgets/companies_search_widget.dart';

import 'bunches_header_widget.dart';
import 'bunches_search_widget.dart';
import 'companies_header_widget.dart';

class BunchScreenDetails extends StatefulWidget {
  const BunchScreenDetails({super.key});

  @override
  State<BunchScreenDetails> createState() => _BunchScreenDetailsState();
}

class _BunchScreenDetailsState extends State<BunchScreenDetails> {
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
              text: 'الباقات',
              fontSize: dimension.reduce20,
              fontWeight: FontWeight.w400,
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
                      const BunchesSearchWidget(),
                      DefaultButton(
                          color: const Color(0xffebf5f6),
                          padding: EdgeInsets.symmetric(
                            horizontal: dimension.width15,
                            vertical: dimension.height10,
                          ),
                          onPressed: () {},
                          child: DefaultText(
                            text: "+ اضافة باقة",
                            color: const Color(0xFF007C92),
                            fontSize: dimension.reduce20,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const BunchesHeaderWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return BunchCard();
                      },
                      itemCount: 10,
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
