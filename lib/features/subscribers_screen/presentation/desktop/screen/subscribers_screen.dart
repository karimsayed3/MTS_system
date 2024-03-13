import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/info_widget.dart';
import 'package:system/core/widgets/screen_title_widget.dart';
import 'package:system/core/widgets/search_with_filter_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/add_subsciber_widget.dart';
import '../widgets/bloc_listener.dart';
import '../widgets/subscribers_card.dart';
import '../widgets/subscribers_header_widget.dart';

class SubscribersScreen extends StatefulWidget {
  SubscribersScreen({super.key});

  @override
  State<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends State<SubscribersScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SubscribersCubit.get(context).getActiveSubscribers(
      getActiveSubscribersRequestBody: GetActiveSubscribersRequestBody(),
    );
  }
  SubscribersCubit? _subscribersCubit;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _subscribersCubit ??= BlocProvider.of<SubscribersCubit>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    // Clear the companiesData list
    _subscribersCubit!.changeListData(subscribers: []);
    _subscribersCubit!.subscribers = [];

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var dimension = Dimensions(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenTitleWidget(
              coloredTitle: 'العملاء',
              title: 'المشتركين',
            ),
            verticalSpace(dimension.height5),
            HomeWidget(
              horizontal: dimension.width10,
              vertical: dimension.height10,
              height: MediaQuery.of(context).size.height * .72,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SearchWithFilterButtonWidget(
                        onTap: () {},
                        searchController: searchController,
                      ),
                      Row(
                        children: [
                          CacheHelper.getdata(key: "accountType") == "ادمن"
                              ? ButtonWithTextAndImageWidget(
                                  onPressed: () {},
                                  color: const Color(0xffebf5f6),
                                  image: 'assets/icons/excel.svg',
                                  text: "تنزيل اكسيل",
                                )
                              : const SizedBox.shrink(),
                          CacheHelper.getdata(key: "accountType") == "ادمن"
                              ? horizontalSpace(dimension.width10)
                              : const SizedBox.shrink(),
                          ButtonWithTextAndImageWidget(
                            onPressed: () {
                              showDataAlert(
                                context: context,
                                child: BlocProvider.value(
                                  value: getIt<SubscribersCubit>(),
                                  child: const AddSubscriberWidget(),
                                ),
                              );
                            },
                            color: const Color(0xffebf5f6),
                            text: "+ اضافة مشترك",
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const SubscribersHeaderWidget(),
                  BlocBuilder<SubscribersCubit, SubscribersState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return SubscribersCard(
                              subscriber: SubscribersCubit.get(context)
                                  .subscribers[index],
                            );
                          },
                          itemCount:
                              SubscribersCubit.get(context).subscribers.length,
                        ),
                      );
                    },
                  ),
                  const BlocListenerForSubscribersCubit(),
                  verticalSpace(dimension.height10),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: dimension.width10,
                              vertical: dimension.height5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoWidget(
                                color: const Color(0xffA92087),
                                text: 'خط محول',
                                textColor: const Color(0xFF969AB0),
                              ),
                              horizontalSpace(dimension.width5),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
