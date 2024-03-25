import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/features/resellers_requests_screen/business_logic/collectors_requests_cubit.dart';
import 'package:system/features/resellers_requests_screen/data/models/approve_or_decline_request_body.dart';
import 'package:system/features/resellers_requests_screen/data/models/get_collector_requests_response.dart';

import '../../../../../core/helpers/dimensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text.dart';

class ResellersRequestsCardWidget extends StatelessWidget {
  const ResellersRequestsCardWidget({super.key, required this.requestData});

  final RequestData requestData;

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
              text: requestData.name ?? "",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: requestData.phoneNo ?? "",
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
                  text: requestData.requestDate != null
                      ? convertDateToString(requestData.requestDate!)
                      : "",
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                // verticalSpace(dimension.height5),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     DefaultText(
                //       text: 'AM ',
                //       color: ColorsManager.lightGray,
                //       fontSize: dimension.reduce15,
                //       fontWeight: FontWeight.w400,
                //     ),
                //     DefaultText(
                //       text: "12:44:00",
                //       color: ColorsManager.lightGray,
                //       fontSize: dimension.reduce15,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: requestData.relatedTo ?? "",
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
                  text: requestData.balance.toString(),
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
                    Expanded(
                      child: DefaultText(
                        text: "الجديدة:",
                        color: ColorsManager.lightGray,
                        fontSize: dimension.width10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    horizontalSpace(dimension.width5),
                    Expanded(
                      child: DefaultText(
                        text: requestData.newValue ?? "",
                        color: ColorsManager.lightGray,
                        fontSize: dimension.width10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     DefaultText(
                    //       text: ' L.E ',
                    //       color: ColorsManager.secondaryColor,
                    //       fontSize: dimension.width10,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     DefaultText(
                    //       text: "50",
                    //       color: ColorsManager.secondaryColor,
                    //       fontSize: dimension.width10,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ],
                    // )
                  ],
                ),
                verticalSpace(dimension.height5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DefaultText(
                        text: "القديمة:",
                        color: ColorsManager.lightGray,
                        fontSize: dimension.width10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    horizontalSpace(dimension.width5),
                    Expanded(
                      child: DefaultText(
                        text: requestData.oldValue ?? "",
                        color: ColorsManager.lightGray,
                        fontSize: dimension.width10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     DefaultText(
                    //       text: ' L.E ',
                    //       color: ColorsManager.lightGray,
                    //       fontSize: dimension.width10,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     DefaultText(
                    //       text: "50",
                    //       color: ColorsManager.lightGray,
                    //       fontSize: dimension.width10,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/edit.svg',
                  color: ColorsManager.lightGray,
                  width: dimension.width10,
                ),
                horizontalSpace(dimension.width5),
                Expanded(
                  child: DefaultText(
                    text: requestData.requestType ?? "",
                    color: ColorsManager.orangeColor,
                    fontSize: dimension.reduce20,
                    fontWeight: FontWeight.w400,
                  ),
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
                  text: requestData.actionDate != null
                      ? convertDateToString(requestData.actionDate!)
                      : "لا يوجد",
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
                // verticalSpace(dimension.height5),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     DefaultText(
                //       text: 'AM ',
                //       color: ColorsManager.lightGray,
                //       fontSize: dimension.reduce15,
                //       fontWeight: FontWeight.w400,
                //     ),
                //     DefaultText(
                //       text: "12:44:00",
                //       color: ColorsManager.lightGray,
                //       fontSize: dimension.reduce15,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const Spacer(),
          requestData.requestStatus == "منتظر تصديق"
              ? SizedBox(
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

                            CollectorsRequestsCubit.get(context).approveRequest(approveOrDeclineRequestBody: ApproveOrDeclineRequestBody(
                              requestID : requestData.requestID!,
                            ));
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
                          color: ColorsManager.lightRedColor,
                          onPressed: () {
                            CollectorsRequestsCubit.get(context).declineRequest(approveOrDeclineRequestBody: ApproveOrDeclineRequestBody(
                              requestID : requestData.requestID!,
                            ));
                          },
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
                )
              : SizedBox(
                  width: dimension.width130,
                ),
        ],
      ),
    );
  }
}
