import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/dimensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text.dart';

class ResellersRequestsCardWidget extends StatelessWidget {
  const ResellersRequestsCardWidget({super.key});

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
            width: dimension.width120,
            child: DefaultText(
              text: 'كريم سيد ابراهيم',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: '01156788394',
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: '20/12/2024',
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                verticalSpace(dimension.height5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'AM ',
                      color: ColorsManager.lightGray,
                      fontSize: dimension.reduce15,
                      fontWeight: FontWeight.w400,
                    ),
                    DefaultText(
                      text: "12:44:00",
                      color: ColorsManager.lightGray,
                      fontSize: dimension.reduce15,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: "ابو خديجة",
              color: ColorsManager.darkBlack,
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
                  text: "50",
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DefaultText(
                      text: "الجديدة:",
                      color: ColorsManager.lightGray,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                    horizontalSpace(dimension.width5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: ' L.E ',
                          color: ColorsManager.secondaryColor,
                          fontSize: dimension.width10,
                          fontWeight: FontWeight.w400,
                        ),
                        DefaultText(
                          text: "50",
                          color: ColorsManager.secondaryColor,
                          fontSize: dimension.width10,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
                verticalSpace(dimension.height5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DefaultText(
                      text: "القديمة:",
                      color: ColorsManager.lightGray,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                    horizontalSpace(dimension.width5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: ' L.E ',
                          color: ColorsManager.lightGray,
                          fontSize: dimension.width10,
                          fontWeight: FontWeight.w400,
                        ),
                        DefaultText(
                          text: "50",
                          color: ColorsManager.lightGray,
                          fontSize: dimension.width10,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),SizedBox(
            width: dimension.width60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/edit.svg',color: ColorsManager.lightGray,width: dimension.width10,),
                horizontalSpace(dimension.width5 ),
                DefaultText(
                  text: "سحب",
                  color: ColorsManager.orangeColor,
                  fontSize: dimension.reduce20,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: '20/12/2024',
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                verticalSpace(dimension.height5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'AM ',
                      color: ColorsManager.lightGray,
                      fontSize: dimension.reduce15,
                      fontWeight: FontWeight.w400,
                    ),
                    DefaultText(
                      text: "12:44:00",
                      color: ColorsManager.lightGray,
                      fontSize: dimension.reduce15,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width130,
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    color: const Color(0xffebf5f6),
                    onPressed: () {
                      // CollectorsCubit.get(context).zeroCollectorTotal(zeroCollectorTotalRequestBody: ZeroCollectorTotalRequestBody(
                      //   userID: user.userID!,
                      // ));
                    },
                    child: DefaultText(
                      text: 'تنفذ',
                      color: ColorsManager.secondaryColor,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                horizontalSpace(dimension.width10),
                Expanded(
                  child: DefaultButton(
                    color:  ColorsManager.lightRedColor,
                    onPressed: () {},
                    child: DefaultText(
                      text: 'الغاء',
                      color: Color(0xFFCC232A),

                      // color: Color(0xFFCC232A),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
