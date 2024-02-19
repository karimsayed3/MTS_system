import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/extensions.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/theming/styles.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/business_logic/companies_state.dart';
import 'package:system/features/companies_screen/data/models/get_companies_request_body.dart';

class BlocListenerForCompaniesCubit extends StatefulWidget {
  const BlocListenerForCompaniesCubit({super.key});

  @override
  State<BlocListenerForCompaniesCubit> createState() =>
      _BlocListenerForCompaniesCubitState();
}

class _BlocListenerForCompaniesCubitState extends State<BlocListenerForCompaniesCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CompaniesCubit, CompaniesState>(
      listenWhen: (previous, current) =>
          current != previous,
      listener: (context, state) {
        state.whenOrNull(
          /// Add Company
          addCompanyLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.secondaryColor,
                      ),
                    ));
          },
          addCompanySuccessState: (addCompanyResponse) {
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
            CompaniesCubit.get(context).getCompanies(
              getCompaniesRequestBody: GetCompaniesRequestBody(
                companyName: CompaniesCubit.get(context).searchController.text,
              ),
            );
          },
          addCompanyErrorState: (error) {
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

          /// Get Companies
          getCompaniesErrorState: (error) {
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
          getCompaniesLoadingState: () {
            // print("loading loading loading loading loading loading");
            // showDialog(context: context, builder: (context) => const Center(
            //   child: CircularProgressIndicator(
            //     color: ColorsManager.secondaryColor,
            //   ),
            // ));
          },
          getCompaniesSuccessState: (companies) {
            // Navigator.pop(context);
            context.read<CompaniesCubit>().companiesData = companies.companies!;
          },

          /// Delete Company
          deleteCompanyLoadingState: () {
            // Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          deleteCompanySuccessState: (addCompanyResponse) {
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
            CompaniesCubit.get(context).getCompanies(
              getCompaniesRequestBody: GetCompaniesRequestBody(
                companyName: CompaniesCubit.get(context).searchController.text,
              ),
            );
          },
          deleteCompanyErrorState: (error) {
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

          /// Update Company
          updateCompanyErrorState: (error) {
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
          updateCompanyLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.secondaryColor,
                  ),
                ));
          },
          updateCompanySuccessState: (addCompanyResponse) {
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
            CompaniesCubit.get(context).getCompanies(
              getCompaniesRequestBody: GetCompaniesRequestBody(
                companyName: CompaniesCubit.get(context).searchController.text,
              ),
            );
          },

        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
