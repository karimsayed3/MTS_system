import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class HistoryOperationCard extends StatelessWidget {
  const HistoryOperationCard({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .01,
        right: MediaQuery.of(context).size.width * .01,
        top: MediaQuery.of(context).size.height * .02,
        bottom: MediaQuery.of(context).size.height * .02,
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorsManager.lightGray))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: dimension.width150,
            child: DefaultText(
              text: 'كريم سيد ابراهيم عبدالتواب',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text: '01226139476',
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: Row(
              children: [
                Container(
                  width: dimension.width80,
                  padding: EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height5),
                  decoration: BoxDecoration(
                      color: const Color(0x0F007C92),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: DefaultText(
                      text: 'Super Flix 30',
                      color: ColorsManager.secondaryColor,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: dimension.width5,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DefaultText(
                      text: 'التبعية: ',
                      color: ColorsManager.lightGray,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                    Expanded(
                      child: DefaultText(
                        text: 'شركة لواته',
                        color: ColorsManager.darkBlack,
                        fontSize: dimension.width10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DefaultText(
                      text: 'المحصل: ',
                      color: ColorsManager.lightGray,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                    Expanded(
                      child: DefaultText(
                        text: 'كريم سيد ابراهيم',
                        color: ColorsManager.darkBlack,
                        fontSize: dimension.width10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: Row(
              children: [
                DefaultText(
                  text: ' L.E ',
                  color: ColorsManager.orangeColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                Expanded(
                  child: DefaultText(
                    text: '10',
                    color: ColorsManager.orangeColor,
                    fontSize: dimension.width10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: Row(
              children: [
                DefaultText(
                  text: ' L.E ',
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                Expanded(
                  child: DefaultText(
                    text: '10',
                    color: ColorsManager.secondaryColor,
                    fontSize: dimension.width10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text: 'تصفير',
              color: const Color(0xFFFFA800),
              fontSize: dimension.width10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: '04/18/2020',
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            width: dimension.width30,
            padding: EdgeInsets.symmetric(vertical: dimension.height10),
            decoration: BoxDecoration(
              color: const Color(0xFFEBF5F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/printer.svg'),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
