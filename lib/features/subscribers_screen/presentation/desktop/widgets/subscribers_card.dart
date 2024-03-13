import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/make_zero_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';

import '../../../../../core/widgets/add_balance_widget.dart';
import '../../../data/models/get_subscribers_data_response.dart';

class SubscribersCard extends StatelessWidget {
  const SubscribersCard({super.key, required this.subscriber});

  final SubscriberData subscriber;

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
              text: subscriber.name??"",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text: subscriber.phoneNo??"",
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text:  subscriber.relatedTo??"",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text:  subscriber.companyName??"",
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  children: [
                    DefaultText(
                      text: 'المحصل:',
                      color: ColorsManager.lightGray,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                    DefaultText(
                      text:  subscriber.collectorName??"",
                      color: ColorsManager.darkBlack,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text:  subscriber.registrationDate!=null? convertDateToString(subscriber.registrationDate):"",
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
                      text:  subscriber.planName??"",
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
                Container(
                  width: dimension.width60,
                  padding: EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height5),
                  decoration: BoxDecoration(
                      color: Color(0x14CC232A),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: DefaultText(
                      text:  subscriber.lineType??"",
                      color: ColorsManager.secondaryColor,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: dimension.width10,
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
                      text: ' L.E',
                      color: Color(0xFFCC232A),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                    DefaultText(
                      text: subscriber.balance.toString(),
                      color: Color(0xFFCC232A),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: "اخر رصيد موجب:",
                      color: ColorsManager.lightGray,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          text: ' L.E',
                          color: ColorsManager.lightGray,
                          fontSize: dimension.width10,
                          fontWeight: FontWeight.w600,
                        ),
                        DefaultText(
                          text: subscriber.lastPositiveDepoit.toString(),
                          color: ColorsManager.lightGray,
                          fontSize: dimension.width10,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: dimension.width15,
                          vertical: dimension.height5),
                      color: ColorsManager.lightBlueColor,
                      onPressed: () {
                        showDataAlert(
                          context: context,
                          child: MakeZeroWidget(
                            onPressed: () {},
                            subscriberName: subscriber.name??"",
                          ),
                        );
                      },
                      child: DefaultText(
                        text: 'تصفير',
                        color: Color(0xFFFFA800),
                        fontWeight: FontWeight.w400,
                        fontSize: dimension.width10,
                      ),
                    ),
                    horizontalSpace(dimension.width5),
                    DefaultButton(
                      color: Color(0xffebf5f6),
                      padding: EdgeInsets.symmetric(
                          horizontal: dimension.width15,
                          vertical: dimension.height5),
                      onPressed: () {
                        showDataAlert(
                          context: context,
                          child: AddBalanceWidget(
                            UserID: 1,
                          )
                        );
                      },
                      child: DefaultText(
                        text: 'اضافة',
                        color: ColorsManager.secondaryColor,
                        fontSize: dimension.width10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: PopupMenuButton(
              // icon: SvgPicture.asset('assets/icons/more.svg'),
              onSelected: (String choice) {
                // Handle menu item selection
                if (choice == 'option1') {
                  // Perform action for option 1
                  showDataAlert(
                    context: context,
                    child: UpdateSubscriberWidget(
                      onPressed: () {},
                      // companyName: "شركة فودافون كفرالشيخ",
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: dimension.width15,
                            child:
                            SvgPicture.asset('assets/icons/edit.svg')),
                        horizontalSpace(dimension.width10),
                        DefaultText(
                          text: 'تعديل مشترك',
                          color: ColorsManager.darkBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
                // Add more PopupMenuItem widgets for additional options
              ],
              child: SvgPicture.asset('assets/icons/more.svg'),
            ),
          ),
          // SizedBox(
          //   width: dimension.width60,
          //   child: InkWell(
          //       onTap: () {}, child: SvgPicture.asset('assets/icons/more.svg')),
          // ),
        ],
      ),
    );
  }
}
