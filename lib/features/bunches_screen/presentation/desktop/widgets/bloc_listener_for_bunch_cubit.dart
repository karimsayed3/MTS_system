import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/extensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/theming/styles.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_cubit.dart';
import 'package:system/features/bunches_screen/business_logic/bunch_state.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_request_body.dart';

class BlocListenerForBunchCubit extends StatefulWidget {
  const BlocListenerForBunchCubit({super.key});

  @override
  State<BlocListenerForBunchCubit> createState() =>
      _BlocListenerForBunchCubitState();
}

class _BlocListenerForBunchCubitState extends State<BlocListenerForBunchCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BunchCubit, BunchState>(
      listenWhen: (previous, current) =>
          current != previous,
      listener: (context, state) {
        state.whenOrNull(
          /// Add Plan
          addPlanLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.secondaryColor,
                      ),
                    ));
          },
          addPlanSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.wb_twighlight,
                    color: Colors.green,
                    size: 32,
                  ),
                  content: Text(
                    addCompanyResponse.statusMessage!,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                        style: TextStyles.font14BlueSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
            BunchCubit.get(context).getPlans(
              getPlansRequestBody: GetPlansRequestBody(
                companyName: "",
                planName: "",
              ),
            );
          },
          addPlanErrorState: (error) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  content: Text(
                    error,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                        style: TextStyles.font14BlueSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },

          /// Get Plans
          getPlansErrorState: (error) {
            // Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  content: Text(
                    error,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          getPlansLoadingState: () {
            // print("loading loading loading loading loading loading");
            //
            // showDialog(context: context, builder: (context) => const Center(
            //   child: CircularProgressIndicator(
            //     color: ColorsManager.secondaryColor,
            //   ),
            // ));
          },
          getPlansSuccessState: (plans) {
            // Navigator.pop(context);
            context.read<BunchCubit>().plansData = plans.plans!;
          },

          /// Delete Plan
          deletePlanLoadingState: () {
            // Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          deletePlanSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.wb_twighlight,
                    color: Colors.green,
                    size: 32,
                  ),
                  content: Text(
                    addCompanyResponse.statusMessage!,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                        style: TextStyles.font14BlueSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
            BunchCubit.get(context).getPlans(
              getPlansRequestBody: GetPlansRequestBody(
                companyName: "",
                planName: "",
              ),
            );
          },
          deletePlanErrorState: (error) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  content: Text(
                    error,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                        style: TextStyles.font14BlueSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },

          /// Update Plan
          updatePlanErrorState: (error) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  content: Text(
                    error,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                        style: TextStyles.font14BlueSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          updatePlanLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          updatePlanSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.wb_twighlight,
                    color: Colors.green,
                    size: 32,
                  ),
                  content: Text(
                    addCompanyResponse.statusMessage!,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                        style: TextStyles.font14BlueSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
            BunchCubit.get(context).getPlans(
              getPlansRequestBody: GetPlansRequestBody(
                companyName: "",
                planName: "",
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
