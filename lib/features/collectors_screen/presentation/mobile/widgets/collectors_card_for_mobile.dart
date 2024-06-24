import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/collectors_screen/data/models/delete_user_request_body.dart';
import 'package:system/features/collectors_screen/data/models/get_users_response.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/update_collector_widget.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/update_subsciber_widget.dart';

import '../../../../../core/widgets/show_alert_dialog.dart';
import '../../desktop/widgets/delete_collector_widget.dart';

class CollectorsCardWidgetMobile extends StatefulWidget {
  const CollectorsCardWidgetMobile({super.key, required this.user});
  final UserData user;

  @override
  State<CollectorsCardWidgetMobile> createState() => _CollectorsCardWidgetMobileState();
}

class _CollectorsCardWidgetMobileState extends State<CollectorsCardWidgetMobile> {
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
            width: 130.w,
            child: DefaultText(
              text: widget.user.name ?? '',
              fontSize: 16.sp,
              fontFamily: 'din',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80.w,
            child:  Row(
              children: [
                DefaultText(
                  text: 'L.E',
                  color: ColorsManager.secondaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                horizontalSpace(5.w),
                Expanded(
                  child: DefaultText(
                    text: widget.user.collectorBalance.toString(),
                    color: ColorsManager.secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 120.w,
            child: Column(
              children: [
                Row(
                  children: [
                    DefaultText(
                      text: 'كاش:',
                      color: ColorsManager.lightGray,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        DefaultText(
                          text: 'L.E',
                          color: ColorsManager.orangeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        horizontalSpace(5.w),
                        DefaultText(
                          text: widget.user.cashCollected.toString(),
                          color: ColorsManager.orangeColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    DefaultText(
                      text: 'الاجمالي:',
                      color: ColorsManager.lightGray,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        DefaultText(
                          text: 'L.E',
                          color: ColorsManager.secondaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        horizontalSpace(5.w),
                        DefaultText(
                          text: widget.user.totalCollected.toString(),
                          color: ColorsManager.secondaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
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
                  showDataAlert(
                    context: context,
                    child: UpdateCollectorWidget(
                      userId: widget.user.userID!,
                      name:  widget.user.name ?? "",
                      email:  widget.user.email ?? "",
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
                              userID: widget.user.userID!,
                            ));
                      },
                      collectorName: widget.user.name ?? "",
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
                            child: SvgPicture.asset('assets/icons/edit.svg')),
                        horizontalSpace(10.w),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 15.w,
                            child: SvgPicture.asset('assets/icons/remove.svg',color: ColorsManager.primaryColor,)),
                        horizontalSpace(10.w),
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
          ),
        ],
      ),
    );
  }
}
