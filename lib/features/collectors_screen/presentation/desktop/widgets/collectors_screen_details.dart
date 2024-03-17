import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/no_data_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_state.dart';
import 'package:system/features/collectors_screen/data/models/get_users_request_body.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/add_collector_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_card.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_search_widget.dart';
import 'bloc_listener_collectos_cubit.dart';
import 'collectors_header_widget.dart';

class CollectorsScreenDetails extends StatefulWidget {
  const CollectorsScreenDetails({super.key});

  @override
  State<CollectorsScreenDetails> createState() =>
      _CollectorsScreenDetailsState();
}

class _CollectorsScreenDetailsState extends State<CollectorsScreenDetails> {
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
            DefaultText(
              text: 'المحصلون',
              fontSize: dimension.reduce20,
              fontWeight: FontWeight.w400,
            ),
            verticalSpace(dimension.height5),
            HomeWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CollectorsSearchWidget(
                        searchController:
                            CollectorsCubit.get(context).searchController,
                        onChange: (value) {
                          CollectorsCubit.get(context).getUsers(
                            getUsersRequestBody: GetUsersRequestBody(
                              username: value,
                            ),
                          );
                        },
                      ),
                      DefaultButton(
                        color: const Color(0xffebf5f6),
                        padding: EdgeInsets.symmetric(
                          horizontal: dimension.width15,
                          vertical: dimension.height10,
                        ),
                        onPressed: () {
                          showDataAlert(
                              context: context,
                              child: BlocProvider.value(
                                value: getIt<CollectorsCubit>(),
                                child: const AddCollectorWidget(),
                              ));
                        },
                        child: DefaultText(
                          text: "+ اضافة محصل",
                          color: const Color(0xFF007C92),
                          fontSize: dimension.reduce20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<CollectorsCubit, CollectorsState>(
                    builder: (context, state) {
                      if (CollectorsCubit.get(context).users.isEmpty) {
                        return Expanded(
                            child: NoDataWidget(
                          child: DefaultButton(
                            color: const Color(0xffebf5f6),
                            padding: EdgeInsets.symmetric(
                              horizontal: dimension.width15,
                              vertical: dimension.height10,
                            ),
                            onPressed: () {
                              showDataAlert(
                                  context: context,
                                  child: BlocProvider.value(
                                    value: getIt<CollectorsCubit>(),
                                    child: const AddCollectorWidget(),
                                  ));
                            },
                            child: DefaultText(
                              text: "+ اضافة محصل",
                              color: const Color(0xFF007C92),
                              fontSize: dimension.reduce20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ));
                      } else {
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(dimension.height10),
                              const CollectorsHeaderWidget(),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return CollectorsCard(
                                        user: CollectorsCubit.get(context)
                                            .users[index]);
                                  },
                                  itemCount:
                                      CollectorsCubit.get(context).users.length,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const BlocListenerCollectorsCubit()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
