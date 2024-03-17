import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/convert_string_to_date.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/add_balance_widget.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/make_zero_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/data/models/activate_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/zero_subscriber_balance_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';
import 'package:system/features/withdrawn_customers_screen/data/models/get_withdraw_subscribers_response.dart';

import '../../../../../core/di/dependency_injection.dart';

class WithdrawnCustomersCardWidgetMobile extends StatefulWidget {
  const WithdrawnCustomersCardWidgetMobile({super.key,required this.withdrawnSubscriberData});

  final WithdrawnSubscriberData withdrawnSubscriberData;

  @override
  State<WithdrawnCustomersCardWidgetMobile> createState() => _WithdrawnCustomersCardWidgetMobileState();
}

class _WithdrawnCustomersCardWidgetMobileState extends State<WithdrawnCustomersCardWidgetMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
      // height: 70.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(
                color: ColorsManager.lightGray,
              )
          )
      ),
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: DefaultText(
              text: widget.withdrawnSubscriberData.name ?? "",
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 140.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: widget.withdrawnSubscriberData.phoneNo ?? "",
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                verticalSpace(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'تاريخ السحب: ',
                      color: ColorsManager.lightGray,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    DefaultText(
                      text: widget.withdrawnSubscriberData.actionDate!=null ? convertDateToString(widget.withdrawnSubscriberData.actionDate!) : "",
                      color: ColorsManager.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                DefaultText(
                  text: 'L.E',
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                horizontalSpace(5.w),
                DefaultText(
                  text: widget.withdrawnSubscriberData.balance.toString(),
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 20.w,
            child: PopupMenuButton(
              surfaceTintColor: Colors.white,
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
                  SubscribersCubit.get(context).activateSubscriber(
                    activateSubscriberRequestBody:
                    ActivateSubscriberRequestBody(
                      phone: widget.withdrawnSubscriberData.phoneNo,
                    ),
                  );
                }
                else if (choice == 'option2') {
                  // Perform action for option 2
                  // showDataAlert(
                  //   context: context,
                  //   child: DeleteCompanyWidget(
                  //     onPressed: () {},
                  //     companyName: "شركة فودافون كفرالشيخ",
                  //   ),
                  // );
                  showDataAlert(
                    context: context,
                    child: BlocProvider.value(
                      value: getIt<SubscribersCubit>(),
                      child: UpdateSubscriberWidget(
                        name: widget.withdrawnSubscriberData.name ?? "",
                        phoneNumber: widget.withdrawnSubscriberData.phoneNo ?? "",
                        lineType: widget.withdrawnSubscriberData.lineType ?? "",
                        companyName: widget.withdrawnSubscriberData.companyName ?? "",
                        planName: widget.withdrawnSubscriberData.planName ?? "",
                        relatedTo: widget.withdrawnSubscriberData.relatedTo ?? "",
                        address: "",
                        NID: "",
                        onPressed: () {},
                        // companyName: "شركة فودافون كفرالشيخ",
                      ),
                    ),
                  );
                }
                else if (choice == 'option3') {
                  // Perform action for option 3
                  // showDataAlert(
                  //   context: context,
                  //   child: MakeZeroWidget(
                  //     onPressed: () {},
                  //     subscriberName: "كريم سيد ابراهيم عبدالتواب",
                  //   ),
                  // );
                  showDataAlert(
                    context: context,
                    child: BlocProvider.value(
                      value: getIt<SubscribersCubit>(),
                      child: AddBalanceWidget(
                        phone: widget.withdrawnSubscriberData.phoneNo ?? "",
                        onPressed: () {},
                        currentBalance: widget.withdrawnSubscriberData.balance!,
                        dateOfLastAddedBalance: "",
                        lastPositiveBalance:
                        widget.withdrawnSubscriberData.lastPositiveDepoit!,
                        name: widget.withdrawnSubscriberData.name ?? "",
                      ),
                    ),
                  );
                }
                else if (choice == 'option4') {
                  // Perform action for option 3
                  // showDataAlert(
                  //   context: context,
                  //   child: MakeZeroWidget(
                  //     onPressed: () {},
                  //     subscriberName: "كريم سيد ابراهيم عبدالتواب",
                  //   ),
                  // );
                  showDataAlert(
                    context: context,
                    child: MakeZeroWidget(
                      onPressed: () {
                        SubscribersCubit.get(context)
                            .zeroSubscriberBalance(
                          zeroSubscriberBalanceRequestBody:
                          ZeroSubscriberBalanceRequestBody(
                            phone: widget.withdrawnSubscriberData.phoneNo,
                            collectingType: 'نقدى',
                          ),
                        );
                      },
                      subscriberName: widget.withdrawnSubscriberData.name ?? "",
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 15.w,
                            child: SvgPicture.asset('assets/icons/disabled_icon.svg')),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'تفعيل',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 15.w,
                            child: SvgPicture.asset('assets/icons/edit.svg')),
                        horizontalSpace(10.w),
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
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15.w,
                          child: SvgPicture.asset(
                            'assets/icons/add_icon.svg',
                            color: ColorsManager.darkBlack,
                          ),
                        ),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'اضافة رصيد',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15.w,
                          child: SvgPicture.asset(
                            'assets/icons/zero_icon.svg',
                            color: ColorsManager.darkBlack,
                          ),
                        ),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'تصفير',
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
