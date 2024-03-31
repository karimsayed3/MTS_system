import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/add_balance_widget.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/make_zero_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/data/models/zero_subscriber_balance_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';

import '../../../data/models/get_subscribers_data_response.dart';

class SubscribersCardWidgetMobile extends StatefulWidget {
  const SubscribersCardWidgetMobile({super.key, required this.subscriber});

  final SubscriberData subscriber;

  @override
  State<SubscribersCardWidgetMobile> createState() =>
      _SubscribersCardWidgetMobileState();
}

class _SubscribersCardWidgetMobileState
    extends State<SubscribersCardWidgetMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      // height: 70.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(
            color: ColorsManager.lightGray,
          ))),
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: widget.subscriber.name ?? "",
                  fontSize: 16.sp,
                  fontFamily: 'din',
                  fontWeight: FontWeight.w400,
                ),
                  Row(
                    children: [
                      DefaultText(
                        text: "التبعية:",
                        fontSize: 12.sp,
                        fontFamily: 'din',
                        color: ColorsManager.lightGray,
                        fontWeight: FontWeight.w400,
                      ),
                      Expanded(
                        child: DefaultText(
                          text: widget.subscriber.relatedTo ?? "",
                          fontSize: 12.sp,
                          fontFamily: 'din',
                          color: ColorsManager.lightGray,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 110.w,
            child: Column(
              children: [
                DefaultText(
                  text: widget.subscriber.phoneNo ?? "",
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                DefaultText(
                  text: widget.subscriber.planName ?? "",
                  color: ColorsManager.lightGray,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 125.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DefaultText(
                      text: ' L.E',
                      color: Color(0xFFCC232A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    DefaultText(
                      text: widget.subscriber.balance.toString(),
                      color: Color(0xFFCC232A),
                      fontSize: 16.sp,
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
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          text: ' L.E',
                          color: ColorsManager.lightGray,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        DefaultText(
                          text: widget.subscriber.lastPositiveDepoit.toString(),
                          color: ColorsManager.lightGray,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
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
                  //     name: subscriber.name ?? "",
                  //     phoneNumber: subscriber.phoneNo ?? "",
                  //     lineType: subscriber.lineType ?? "",
                  //     companyName: subscriber.companyName ?? "",
                  //     planName: subscriber.planName ?? "",
                  //     relatedTo: subscriber.relatedTo ?? "",
                  //     onPressed: () {},
                  //     // companyName: "شركة فودافون كفرالشيخ",
                  //   ),
                  // );
                  showDataAlert(
                    context: context,
                    child: BlocProvider.value(
                      value: getIt<SubscribersCubit>(),
                      child: UpdateSubscriberWidget(
                        name: widget.subscriber.name ?? "",
                        phoneNumber: widget.subscriber.phoneNo ?? "",
                        lineType: widget.subscriber.lineType ?? "",
                        companyName: widget.subscriber.companyName ?? "",
                        planName: widget.subscriber.planName ?? "",
                        relatedTo: widget.subscriber.relatedTo ?? "",
                        address: "",
                        NID: "",
                        onPressed: () {},
                        // companyName: "شركة فودافون كفرالشيخ",
                      ),
                    ),
                  );
                } else if (choice == 'option2') {
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
                      child: AddBalanceWidget(
                        flag: "from subscriber",
                        phone: widget.subscriber.phoneNo ?? "",
                        onPressed: () {},
                        currentBalance: widget.subscriber.balance!,
                        dateOfLastAddedBalance: "",
                        lastPositiveBalance:
                        widget.subscriber.lastPositiveDepoit!,
                        name: widget.subscriber.name ?? "",
                      ),
                    ),
                  );
                } else if (choice == 'option3') {
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
                            phone: widget.subscriber.phoneNo,
                            collectingType: 'نقدى',
                          ),
                        );
                      },
                      subscriberName: widget.subscriber.name ?? "",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 15.w,
                            child: SvgPicture.asset('assets/icons/edit.svg')),
                        horizontalSpace(10.w),
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
                  value: 'option3',
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
