import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_state.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_request_body.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/add_bunch_widget.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/bunch_card.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/bunches_search_widget.dart';
import '../widgets/bloc_listener_for_bunch_cubit.dart';
import '../widgets/bunches_header_widget.dart';

class BunchScreenDetails extends StatefulWidget {
  const BunchScreenDetails({super.key});

  @override
  State<BunchScreenDetails> createState() => _BunchScreenDetailsState();
}

class _BunchScreenDetailsState extends State<BunchScreenDetails> {
  @override
  void initState() {
    // TODO: implement initState
    BunchCubit.get(context).getPlans(
      getPlansRequestBody: GetPlansRequestBody(
        companyName: "",
        planName: "",
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
              text: 'الباقات',
              fontSize: dimension.reduce20,
              fontWeight: FontWeight.w400,
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
                      const BunchesSearchWidget(),
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
                                value: getIt<BunchCubit>(),
                                child: AddBunchWidget(
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                          child: DefaultText(
                            text: "+ اضافة باقة",
                            color: const Color(0xFF007C92),
                            fontSize: dimension.reduce20,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ),
                  verticalSpace(dimension.height10),
                  const BunchesHeaderWidget(),
                  BlocBuilder<BunchCubit, BunchState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return BunchCard(
                              planData:
                                  BunchCubit.get(context).plansData[index],
                            );
                          },
                          itemCount: BunchCubit.get(context).plansData.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const BlocListenerForBunchCubit(),
          ],
        ),
      ),
    );
  }
}
