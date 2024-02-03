import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class LateCustomersCard extends StatelessWidget {
  const LateCustomersCard({super.key});

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .01,
        right: MediaQuery.of(context).size.width * .01,
        top: MediaQuery.of(context).size.height * .01,
        bottom: MediaQuery.of(context).size.height * .01,
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: ColorsManager.lightGray))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: dimension.width130,
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
              text: '01156788394',
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: 'ايمن يوسف ايمن',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width130,
            child: DefaultText(
              text: 'كريم سيد ابراهيم',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text: '04/18/2020',
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
                      color: Color(0x0F007C92),
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
            width: dimension.width80,
            child: Row(
              children: [
                DefaultText(
                  text: ' L.E',
                  color: Color(0xFFCC232A),
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w500,
                ),
                DefaultText(
                  text: ' 15-',
                  color: Color(0xFFCC232A),
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width200,
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    color:  Color(0xFFFFF4DE),
                    onPressed: () {},
                    child: DefaultText(
                      text: 'تصفير',
                      color: Color(0xFFFFA800),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                horizontalSpace(dimension.width10),
                Expanded(
                  child: DefaultButton(
                    color:  Color(0xffebf5f6),
                    onPressed: () {},
                    child: DefaultText(
                      text: 'اضافة رصيد',
                      color: ColorsManager.secondaryColor,

                      // color: Color(0xFFCC232A),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                horizontalSpace(dimension.width5),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('assets/icons/more.svg')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
