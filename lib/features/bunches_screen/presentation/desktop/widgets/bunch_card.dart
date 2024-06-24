import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/data/models/delete_plan_request_body.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_response.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/delete_bunch_widget.dart';
import 'package:system/features/bunches_screen/presentation/desktop/widgets/update_bunch_widget.dart';

class BunchCard extends StatelessWidget {
  const BunchCard({super.key, required this.planData});

  final PlanData planData;

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
              text: planData.name ?? '',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width100,
            child: DefaultText(
              text: planData.price.toString(),
              color: ColorsManager.secondaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width150,
            child: DefaultText(
              text: planData.companyName ?? '',
              color: ColorsManager.darkBlack,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width130,
            child: DefaultText(
              text: planData.subscribersCount.toString(),
              color: ColorsManager.primaryColor,
              fontSize: dimension.width10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: dimension.width200,
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    color: Color(0xffebf5f6),
                    onPressed: () {
                      showDataAlert(
                        context: context,
                        child: BlocProvider.value(
                          value: getIt<BunchCubit>(),
                          child: UpdateBunchWidget(
                            onPressed: () {},
                            companyName: planData.companyName ?? '',
                            bunchName: planData.name ?? '',
                            bunchPrice: planData.price!,
                            planId: planData.planID!,
                          ),
                        ),
                      );
                    },
                    child: DefaultText(
                      text: 'تعديل',
                      color: Color(0xFF007C92),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                horizontalSpace(dimension.width10),
                Expanded(
                  child: DefaultButton(
                    color: ColorsManager.lightBlueColor,
                    onPressed: () {
                      showDataAlert(
                          context: context,
                          child: BlocProvider.value(
                            value: getIt<BunchCubit>(),
                            child: DeleteBunchWidget(
                              onPressed: () {
                                BunchCubit.get(context).deletePlan(
                                  deletePlanRequestBody: DeletePlanRequestBody(
                                    planID: planData.planID,
                                  ),
                                );
                              },
                              bunchName: planData.name ?? '',
                            ),
                          ));
                    },
                    child: DefaultText(
                      text: 'حذف',
                      color: Color(0xFFCC232A),
                      fontSize: dimension.width10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // horizontalSpace(dimension.width5),
                // InkWell(
                //   onTap: () {},
                //   child: SvgPicture.asset('assets/icons/more.svg'),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
