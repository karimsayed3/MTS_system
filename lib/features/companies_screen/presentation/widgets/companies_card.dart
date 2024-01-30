import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class CollectorsCard extends StatelessWidget {
  const CollectorsCard({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            width: dimension.width130,
            child: DefaultText(
              text: 'abokhadiga6@gmail.com',
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: Row(
              children: [
                DefaultText(
                  text: ' L.E ',
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                DefaultText(
                  text: '10',
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: '20',
              color: Color(0xffFFA800),
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: '50',
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: '70',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width150,
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
                    child: SvgPicture.asset('assets/icons/more.svg'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
