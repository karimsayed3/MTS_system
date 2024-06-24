import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/widgets/default_text.dart';

import '../../../../../core/theming/colors.dart';

class CardForTotalInvoice extends StatelessWidget {
  const CardForTotalInvoice({super.key, required this.titleText, required this.infoText});
  final String titleText ;
  final String infoText ;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SizedBox(
      width: dimension.width230 ,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(dimension.reduce15),
            )),
        child: Padding(
          padding: EdgeInsets.only(left: dimension.width10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/mail_icon.svg"),
                        verticalSpace(dimension.height20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: infoText,
                              color: ColorsManager.darkBlack,
                              fontSize: dimension.width15,
                              fontWeight: FontWeight.w700,
                            ),
                            DefaultText(
                              text: titleText,
                              color: ColorsManager.lightGray,
                              fontSize: dimension.width10,
                              fontWeight: FontWeight.w700,
                            )
                          ],
                        ),
                      ],),
                ),
              ),
              Expanded(child: SvgPicture.asset('assets/icons/decorate_icon.svg')),
            ],
          ),
        ),
      ),
    );
  }
}
