import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/core/widgets/title_of_screen_with_logo_widget.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_state.dart';
import 'package:system/features/collectors_screen/data/models/get_users_request_body.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/bloc_listener_collectos_cubit.dart';

import '../../desktop/widgets/add_collector_widget.dart';
import '../widgets/collectors_card_for_mobile.dart';
import '../widgets/collectors_header_widget_mobile.dart';

class CollectorsScreenMobile extends StatefulWidget {
  const CollectorsScreenMobile({super.key});

  @override
  State<CollectorsScreenMobile> createState() => _CollectorsScreenMobileState();
}

class _CollectorsScreenMobileState extends State<CollectorsScreenMobile> {

  @override
  void initState() {
    // TODO: implement initState
    CollectorsCubit.get(context).getUsers(
      getUsersRequestBody: GetUsersRequestBody(
        username: '',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.lighterGray,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleForScreenWithWidget(
                      title: "المحصلون",
                    ),
                    ButtonWithTextAndImageWidget(
                      onPressed: () {
                        showDataAlert(
                            context: context,
                            child: const AddCollectorWidget(
                              // onPressed: () {},
                            ));
                      },
                      color: const Color(0xffebf5f6),
                      text: "+ اضافة محصل",
                      fontSize: 16.sp,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      // image: "assets/images/plus.png",
                    ),
                    // LateCustomersInfoWidget(),
                  ],
                ),
              ),
              Container(
                // height: 80.h,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                // color: Colors.blueAccent,
                child: CustomSearchWidget(
                  width: double.infinity,
                  searchController: CollectorsCubit.get(context).searchController,
                  onChange: (value) {
                    CollectorsCubit.get(context).getUsers(
                      getUsersRequestBody: GetUsersRequestBody(
                        username: value,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const CollectorsHeaderWidgetMobile(),
                    BlocBuilder<CollectorsCubit, CollectorsState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CollectorsCardWidgetMobile(
                                user: CollectorsCubit.get(context).users[index],
                              );
                              // return const SizedBox.shrink();
                            },
                            itemCount: CollectorsCubit.get(context).users.length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const BlocListenerCollectorsCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
