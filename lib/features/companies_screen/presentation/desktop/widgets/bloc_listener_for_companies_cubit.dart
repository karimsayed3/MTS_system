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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(addCompanyResponse.statusMessage!),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
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
            // context.read<CompaniesCubit>().companiesData = companies.companies!;
            context.read<CompaniesCubit>().changeListData(companiesData: companies.companies!);
          },

          /// Delete Company
          deleteCompanyLoadingState: () {
            // Navigator.pop(context);
            // showDialog(
            //     context: context,
            //     builder: (context) => const Center(
            //       child: CircularProgressIndicator(
            //         color: ColorsManager.secondaryColor,
            //       ),
            //     ));
          },
          deleteCompanySuccessState: (addCompanyResponse) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(addCompanyResponse.statusMessage!),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
            CompaniesCubit.get(context).getCompanies(
              getCompaniesRequestBody: GetCompaniesRequestBody(
                companyName: CompaniesCubit.get(context).searchController.text,
              ),
            );
          },
          deleteCompanyErrorState: (error) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
          },

          /// Update Company
          updateCompanyErrorState: (error) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
          },
          updateCompanyLoadingState: () {
            // showDialog(
            //     context: context,
            //     builder: (context) => const Center(
            //       child: CircularProgressIndicator(
            //         color: ColorsManager.secondaryColor,
            //       ),
            //     ));
          },
          updateCompanySuccessState: (addCompanyResponse) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(addCompanyResponse.statusMessage!),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
            CompaniesCubit.get(context).getCompanies(
              getCompaniesRequestBody: GetCompaniesRequestBody(
                companyName: CompaniesCubit.get(context).searchController.text,
              ),
            );
          },
          deductPlanFromSubscribersLoadingState: () {

          },
          deductPlanFromSubscribersSuccessState: (deductPlanFromSubscribersResponse) {
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(deductPlanFromSubscribersResponse.statusMessage!),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            ));
          },
          deductPlanFromSubscribersErrorState: (error) {
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
          },
          undoPlanFromSubscribersLoadingState: () {

          },
          undoPlanFromSubscribersSuccessState: (undoPlanFromSubscribersResponse) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(undoPlanFromSubscribersResponse.statusMessage!),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10),
                )
            ));
          },
          undoPlanFromSubscribersErrorState: (error) {
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )));
          }
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
