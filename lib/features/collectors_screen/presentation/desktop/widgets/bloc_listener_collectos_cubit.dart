import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/extensions.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_cubit.dart';
import 'package:system/features/collectors_screen/business_logic/collectors_state.dart';
import 'package:system/features/collectors_screen/data/models/get_users_request_body.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class BlocListenerCollectorsCubit extends StatelessWidget {
  const BlocListenerCollectorsCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CollectorsCubit, CollectorsState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          getUsersLoadingState: () {},
          getUsersSuccessState: (getUsersResponse) {
            CollectorsCubit.get(context).changeListDate(getUsersResponse.users!);
          },
          getUsersErrorState: (error) {
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

          addUserLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          addUserSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
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
            CollectorsCubit.get(context).getUsers(
              getUsersRequestBody: GetUsersRequestBody(
                  username: CollectorsCubit.get(context).searchController.text,
              ),
            );
          },
          addUserErrorState: (error) {
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

          deleteUserLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          deleteUserSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
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
            CollectorsCubit.get(context).getUsers(
              getUsersRequestBody: GetUsersRequestBody(
                  username: CollectorsCubit.get(context).searchController.text,
              ),
            );
          },
          deleteUserErrorState: (error) {
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

          updateUserLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          updateUserSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
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
            CollectorsCubit.get(context).getUsers(
              getUsersRequestBody: GetUsersRequestBody(
                  username: CollectorsCubit.get(context).searchController.text,
              ),
            );
          },
          updateUserErrorState: (error) {
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

          zeroCollectorTotalLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          zeroCollectorTotalSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
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
            CollectorsCubit.get(context).getUsers(
              getUsersRequestBody: GetUsersRequestBody(
                  username: CollectorsCubit.get(context).searchController.text,
              ),
            );
          },
          zeroCollectorTotalErrorState: (error) {
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

          deductBalanceCollectorLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          deductBalanceCollectorSuccessState: (addCompanyResponse) {
            Navigator.pop(context);
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
            CollectorsCubit.get(context).getUsers(
              getUsersRequestBody: GetUsersRequestBody(
                  username: CollectorsCubit.get(context).searchController.text,
              ),
            );
          },
          deductBalanceCollectorErrorState: (error) {
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

        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
