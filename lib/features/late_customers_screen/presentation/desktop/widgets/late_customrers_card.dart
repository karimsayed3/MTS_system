import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/add_balance_widget.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/make_zero_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/late_customers_screen/data/models/get_late_subscribers_response.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/data/models/delete_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/disable_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_subscribers_data_response.dart';
import 'package:system/features/subscribers_screen/data/models/withdraw_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/zero_subscriber_balance_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';

class LateCustomersCard extends StatelessWidget {
  const LateCustomersCard({super.key, required this.subscriber});

  final LateSubscriberData subscriber;

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
              text: subscriber.name ?? "",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text: subscriber.phoneNo ?? "",
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: subscriber.relatedTo ?? "",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width130,
            child: DefaultText(
              text: subscriber.collectorName ?? "",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text: subscriber.registrationDate != null
                  ? convertDateToString(subscriber.registrationDate)
                  : "",
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
                      text: subscriber.planName ?? "",
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
                  text: ' L.E ',
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
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width200,
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    color: Color(0xFFFFF4DE),
                    onPressed: () {
                      showDataAlert(
                        context: context,
                        child: MakeZeroWidget(
                          onPressed: () {
                            SubscribersCubit.get(context).zeroSubscriberBalance(
                              zeroSubscriberBalanceRequestBody:
                                  ZeroSubscriberBalanceRequestBody(
                                phone: subscriber.phoneNo,
                                collectingType: 'نقدى',
                              ),
                            );
                          },
                          subscriberName: subscriber.name ?? "",
                        ),
                      );
                    },
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
                    color: Color(0xffebf5f6),
                    onPressed: () {
                      showDataAlert(
                        context: context,
                        child: BlocProvider.value(
                          value: getIt<SubscribersCubit>(),
                          child: AddBalanceWidget(
                            flag: "from subscriber",
                            phone: subscriber.phoneNo ?? "",
                            onPressed: () {},
                            currentBalance: subscriber.balance!,
                            dateOfLastAddedBalance: "",
                            lastPositiveBalance: 0,
                            name: subscriber.name ?? "",
                          ),
                        ),
                      );
                    },
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
                PopupMenuButton(
                  // icon: SvgPicture.asset('assets/icons/more.svg'),
                  onSelected: (String choice) {
                    // Handle menu item selection
                    if (choice == 'option1') {
                      showDataAlert(
                        context: context,
                        child: BlocProvider.value(
                          value: getIt<SubscribersCubit>(),
                          child: UpdateSubscriberWidget(
                            name: subscriber.name ?? "",
                            phoneNumber: subscriber.phoneNo ?? "",
                            lineType: "جديد",
                            companyName: "",
                            planName: subscriber.planName ?? "",
                            relatedTo: subscriber.relatedTo ?? "",
                            address: "",
                            NID: "",
                            onPressed: () {},
                            // companyName: "شركة فودافون كفرالشيخ",
                          ),
                        ),
                      );
                    }
                    if (choice == 'option2') {
                      SubscribersCubit.get(context).deleteSubscriber(
                          deleteSubscriberRequestBody:
                              DeleteSubscriberRequestBody(
                        phone: subscriber.phoneNo,
                      ));
                    }
                    if (choice == 'option3') {
                      SubscribersCubit.get(context).withdrawSubscriber(
                          withdrawSubscriberRequestBody:
                              WithdrawSubscriberRequestBody(
                        phone: subscriber.phoneNo,
                      ));
                    }
                    if (choice == 'option4') {
                      SubscribersCubit.get(context).disableSubscriber(
                          disableSubscriberRequestBody:
                              DisableSubscriberRequestBody(
                        phone: subscriber.phoneNo,
                      ));
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
                    PopupMenuItem<String>(
                      value: 'option2',
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: dimension.width15,
                                child: SvgPicture.asset(
                                    'assets/icons/remove.svg')),
                            horizontalSpace(dimension.width10),
                            DefaultText(
                              text: 'حذف',
                              color: ColorsManager.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                        PopupMenuItem<String>(
                      value: 'option3',
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: dimension.width15,
                                child: SvgPicture.asset(
                                    'assets/icons/withdraw_icon.svg')),
                            horizontalSpace(dimension.width10),
                            DefaultText(
                              text: 'سحب',
                              color: ColorsManager.darkBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'option4',
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: dimension.width15,
                                child: SvgPicture.asset(
                                    'assets/icons/disabled_icon.svg')),
                            horizontalSpace(dimension.width10),
                            DefaultText(
                              text: 'تعطيل',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
