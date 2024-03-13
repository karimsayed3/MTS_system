import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';

import '../../../../../core/theming/colors.dart';

class BlocListenerForSubscribersCubit extends StatefulWidget {
  const BlocListenerForSubscribersCubit({super.key});

  @override
  State<BlocListenerForSubscribersCubit> createState() =>
      _BlocListenerForSubscribersCubitState();
}

class _BlocListenerForSubscribersCubitState
    extends State<BlocListenerForSubscribersCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscribersCubit, SubscribersState>(
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        state.whenOrNull(
          addNewSubscriberErrorState: (error) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
            ));
          },
          addNewSubscriberSuccessState: (addNewSubscriberResponse) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(addNewSubscriberResponse.statusMessage!),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              dismissDirection: DismissDirection.horizontal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ));
          },
          addNewSubscriberLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.secondaryColor,
                    )));
          },
          getActiveSubscribersLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.secondaryColor,
                    )));
          },
          getActiveSubscribersSuccessState: (getActiveSubscribersResponse) {
            // Navigator.pop(context);
            SubscribersCubit.get(context).changeListData(
                subscribers: getActiveSubscribersResponse.result!);
          },
          getActiveSubscribersErrorState: (error) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              dismissDirection: DismissDirection.horizontal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ));
          },
          getLateSubscribersLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.secondaryColor,
                    )));
          },
          getLateSubscribersSuccessState: (getActiveSubscribersResponse) {
            // Navigator.pop(context);
            SubscribersCubit.get(context).changeListData(
                subscribers: getActiveSubscribersResponse.result!);
          },
          getLateSubscribersErrorState: (error) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              dismissDirection: DismissDirection.horizontal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ));
          },
          getWithdrawnSubscribersLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.secondaryColor,
                    )));
          },
          getWithdrawnSubscribersSuccessState: (getActiveSubscribersResponse) {
            // Navigator.pop(context);
            SubscribersCubit.get(context).changeListData(
                subscribers: getActiveSubscribersResponse.result!);
          },
          getWithdrawnSubscribersErrorState: (error) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              dismissDirection: DismissDirection.horizontal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ));
          },
          getDisabledSubscribersLoadingState: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.secondaryColor,
                    )));
          },
          getDisabledSubscribersSuccessState: (getActiveSubscribersResponse) {
            // Navigator.pop(context);
            SubscribersCubit.get(context).changeListData(
                subscribers: getActiveSubscribersResponse.result!);
          },
          getDisabledSubscribersErrorState: (error) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              dismissDirection: DismissDirection.horizontal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
