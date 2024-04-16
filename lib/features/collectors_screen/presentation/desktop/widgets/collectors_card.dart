import '';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/add_balance_widget.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/make_zero_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/collectors_screen/data/models/get_users_response.dart';
import 'package:system/features/collectors_screen/data/models/zero_collector_total_request_body.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/delete_collector_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/update_collector_widget.dart';

import '../../../data/models/delete_user_request_body.dart';

class CollectorsCard extends StatelessWidget {
  const CollectorsCard({super.key, required this.user});

  final UserData user;

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
              text: user.name ?? '',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width130,
            child: DefaultText(
              text: user.email ?? '',
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
                  text: user.collectorBalance.toString(),
                  color: ColorsManager.secondaryColor,
                  fontSize: dimension.width10,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: user.cashCollected.toString(),
              color: const Color(0xffFFA800),
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: user.walletCollected.toString(),
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width60,
            child: DefaultText(
              text: user.totalCollected.toString(),
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
                    color: const Color(0xFFFFF4DE),
                    onPressed: () {
                      showDataAlert(
                        context: context,
                        child: MakeZeroWidget(
                          onPressed: () {
                            CollectorsCubit.get(context).zeroCollectorTotal(
                                zeroCollectorTotalRequestBody:
                                    ZeroCollectorTotalRequestBody(
                              userID: user.userID!,
                            ));
                          },
                          subscriberName: user.name ?? '',
                        ),
                      );
                    },
                    child: DefaultText(
                      text: 'تصفير',
                      color: const Color(0xFFFFA800),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                horizontalSpace(dimension.width10),
                Expanded(
                  child: DefaultButton(
                    color: const Color(0xffebf5f6),
                    onPressed: () {
                      showDataAlert(
                        context: context,
                        child: BlocProvider.value(
                          value: getIt<CollectorsCubit>(),
                          child: AddBalanceWidget(
                            flag: "from collectors",
                            phone: user.name ?? "",
                            userId: user.userID,
                            onPressed: () {

                            },
                            currentBalance: 1,
                            dateOfLastAddedBalance: "",
                            lastPositiveBalance: 1,
                            name: "",
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
                      // Perform action for option 1
                      showDataAlert(
                        context: context,
                        child: BlocProvider.value(
                          value: getIt<CollectorsCubit>(),
                          child: UpdateCollectorWidget(
                            name: user.name ?? "",
                            email: user.email ?? "",
                            userId: user.userID!,
                          ),
                        ),
                      );
                    } else if (choice == 'option2') {
                      // Perform action for option 2
                      showDataAlert(
                        context: context,
                        child: DeleteCollectorWidget(
                          onPressed: () {
                            CollectorsCubit.get(context).deleteUser(
                                deleteUserRequestBody: DeleteUserRequestBody(
                              userID: user.userID!,
                            ));
                          },
                          collectorName: user.name ?? "",
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
                              text: 'تعديل المحصل',
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
                                'assets/icons/remove.svg',
                                color: ColorsManager.primaryColor,
                              ),
                            ),
                            horizontalSpace(dimension.width10),
                            DefaultText(
                              text: 'حذف المحصل',
                              color: ColorsManager.primaryColor,
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
