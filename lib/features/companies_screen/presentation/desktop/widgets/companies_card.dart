import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';

class CompaniesCard extends StatelessWidget {
  const CompaniesCard({super.key});
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
              text: 'شركة فودافون كفرالشيخ',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width130,
            child: DefaultText(
              text: '04/18/2020 09:42:00AM',
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
                  width: dimension.width50,
                  padding: EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height5),
                  decoration: BoxDecoration(
                      color: Color(0x0F007C92),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: DefaultText(
                      text: '10',
                      color: ColorsManager.secondaryColor,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: dimension.width30,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width350,
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    color: Color(0xffebf5f6),
                    onPressed: () {},
                    child: DefaultText(
                      text: 'اضافة باقة للشركة',
                      color: Color(0xFF007C92),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                horizontalSpace(dimension.width10),
                Expanded(
                  child: DefaultButton(
                    color: Color(0xfffbedee),
                    onPressed: () {},
                    child: DefaultText(
                      text: 'حذف قيمة باقة',
                      color: Color(0xFFCC232A),
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