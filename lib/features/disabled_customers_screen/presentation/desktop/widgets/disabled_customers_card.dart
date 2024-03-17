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
import 'package:system/features/disabled_customers_screen/data/models/get_disabled_subscribers_response.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/zero_subscriber_balance_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';

class DisabledCustomersCard extends StatelessWidget {
  const DisabledCustomersCard({super.key, required this.disabledSubscriber});

  final DisabledSubscriberData disabledSubscriber;

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
              text: disabledSubscriber.name??"",
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width80,
            child: DefaultText(
              text: disabledSubscriber.phoneNo??"",
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: disabledSubscriber.relatedTo??"",
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
                  text: disabledSubscriber.companyName??"",
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
                      text: disabledSubscriber.collectorName??"",
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
              text: disabledSubscriber.registrationDate!=null?convertDateToString(disabledSubscriber.registrationDate):"لا يوجد",
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
                      text: disabledSubscriber.planName??"",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: disabledSubscriber.actionDate!=null?convertDateToString(disabledSubscriber.actionDate):"لا يوجد",
                  color: Color(0xFFCC232A),
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w600,
                ),
                verticalSpace(dimension.height5),
                SizedBox(
                  width: dimension.width60,
                  child: DefaultButton(
                    color: Color(0xffebf5f6),
                    padding: EdgeInsets.symmetric(
                        // horizontal: dimension.width15,
                        vertical: dimension.height5),
                    onPressed: () {
                      SubscribersCubit.get(context).activateSubscriber(
                        activateSubscriberRequestBody:
                        ActivateSubscriberRequestBody(
                            phone: disabledSubscriber.phoneNo,
                        ),
                      );
                    },
                    child: DefaultText(
                      text: 'تفعيل',
                      color: ColorsManager.secondaryColor,
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                      text: disabledSubscriber.balance.toString(),
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
                          text: disabledSubscriber.lastPositiveDepoit.toString(),
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
                            onPressed: () {
                              SubscribersCubit.get(context)
                                  .zeroSubscriberBalance(
                                zeroSubscriberBalanceRequestBody:
                                ZeroSubscriberBalanceRequestBody(
                                  phone: disabledSubscriber.phoneNo,
                                  collectingType: 'نقدى',
                                ),
                              );
                            },
                            subscriberName: disabledSubscriber.name ?? "",
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
                          child: BlocProvider.value(
                            value: getIt<SubscribersCubit>(),
                            child: AddBalanceWidget(
                              phone: disabledSubscriber.phoneNo ?? "",
                              onPressed: () {},
                              currentBalance: disabledSubscriber.balance!,
                              dateOfLastAddedBalance: "",
                              lastPositiveBalance:
                              disabledSubscriber.lastPositiveDepoit!,
                              name: disabledSubscriber.name ?? "",
                            ),
                          ),
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
            width: dimension.width40,
            child: PopupMenuButton(
              // icon: SvgPicture.asset('assets/icons/more.svg'),
              onSelected: (String choice) {
                // Handle menu item selection
                if (choice == 'option1') {
                  // Perform action for option 1
                  // showDataAlert(
                  //   context: context,
                  //   child: UpdateSubscriberWidget(
                  //     onPressed: () {},
                  //     // companyName: "شركة فودافون كفرالشيخ",
                  //   ),
                  // );
                  showDataAlert(
                    context: context,
                    child: BlocProvider.value(
                      value: getIt<SubscribersCubit>(),
                      child: UpdateSubscriberWidget(
                        name: disabledSubscriber.name ?? "",
                        phoneNumber: disabledSubscriber.phoneNo ?? "",
                        lineType: disabledSubscriber.lineType ?? "",
                        companyName: disabledSubscriber.companyName ?? "",
                        planName: disabledSubscriber.planName ?? "",
                        relatedTo: disabledSubscriber.relatedTo ?? "",
                        address: "",
                        NID: "",
                        onPressed: () {},
                        // companyName: "شركة فودافون كفرالشيخ",
                      ),
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
                          text: 'تعديل',
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
        ],
      ),
    );
  }
}
