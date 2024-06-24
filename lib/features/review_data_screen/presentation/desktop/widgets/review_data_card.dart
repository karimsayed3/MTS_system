import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/delete_collector_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/update_collector_widget.dart';
import 'package:system/features/review_data_screen/business_logic/review_data_cubit.dart';

import '../../../../subscribers_screen/data/models/update_subscriber_request_body.dart';
import '../../../data/models/get_review_subscribers_plans.dart';

class ReviewDataCard extends StatelessWidget {
  ReviewDataCard({super.key, required this.reviewSubscriberData, required this.onPressed});

  final ReviewSubscriberData reviewSubscriberData;
  dynamic Function() onPressed;
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
              text: reviewSubscriberData.name??"",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: reviewSubscriberData.phoneNo??"",
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child:Row(
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
                      text: reviewSubscriberData.systemPlanName??"",
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
                      text:  reviewSubscriberData.companyPlanName??"",
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
            width: dimension.width200,
            child: DefaultText(
              text:  reviewSubscriberData.notes??"",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width180,
            child:  Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    color: Color(0xFFFFF4DE),
                    onPressed: onPressed,
                    child: DefaultText(
                      text: 'تغاضى',
                      color: Color(0xFFFFA800),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                horizontalSpace(dimension.width10),
                Expanded(
                  child: DefaultButton(
                    color: Color(0xffebf5f6),
                    onPressed: () {
                      ReviewDataCubit.get(context).updateSubscriber(
                        updateSubscriberRequestBody:
                        UpdateSubscriberRequestBody(
                          oldPhone: reviewSubscriberData.phoneNo,
                          planName: reviewSubscriberData.companyPlanName,
                        ),
                      );
                    },
                    child: DefaultText(
                      text: 'تنفيذ التعديل',
                      color: ColorsManager.secondaryColor,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // horizontalSpace(dimension.width5),
                // PopupMenuButton(
                //   // icon: SvgPicture.asset('assets/icons/more.svg'),
                //   onSelected: (String choice) {
                //     // Handle menu item selection
                //     if (choice == 'option1') {
                //       // Perform action for option 1
                //       showDataAlert(
                //         context: context,
                //         child: UpdateCollectorWidget(
                //           // onPressed: () {},
                //           userId: 0,
                //           name: "كريم سيد ابراهيم عبدالتواب",
                //           email: "abokhadiga6@gmail.com",
                //         ),
                //       );
                //     } else if (choice == 'option2') {
                //       // Perform action for option 2
                //       showDataAlert(
                //         context: context,
                //         child: DeleteCollectorWidget(
                //           onPressed: () {},
                //           collectorName: "كريم سيد ابراهيم عبدالتواب",
                //         ),
                //       );
                //     }
                //   },
                //   itemBuilder: (BuildContext context) =>
                //   <PopupMenuEntry<String>>[
                //     PopupMenuItem<String>(
                //       value: 'option1',
                //       child: Directionality(
                //         textDirection: TextDirection.rtl,
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             SizedBox(
                //                 width: dimension.width15,
                //                 child:
                //                 SvgPicture.asset('assets/icons/edit.svg')),
                //             horizontalSpace(dimension.width10),
                //             DefaultText(
                //               text: 'تعديل المحصل',
                //               color: ColorsManager.darkBlack,
                //               fontSize: 14,
                //               fontWeight: FontWeight.w500,
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     PopupMenuItem<String>(
                //       value: 'option2',
                //       child: Directionality(
                //         textDirection: TextDirection.rtl,
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             SizedBox(
                //               width: dimension.width15,
                //               child: SvgPicture.asset(
                //                 'assets/icons/remove.svg',
                //                 color: ColorsManager.primaryColor,
                //               ),
                //             ),
                //             horizontalSpace(dimension.width10),
                //             DefaultText(
                //               text: 'حذف المحصل',
                //               color: ColorsManager.primaryColor,
                //               fontSize: 14,
                //               fontWeight: FontWeight.w500,
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     // Add more PopupMenuItem widgets for additional options
                //   ],
                //   child: SvgPicture.asset('assets/icons/more.svg'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
