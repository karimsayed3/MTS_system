import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/get_active_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';

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
              // Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error),
              ));
            },
            addNewSubscriberSuccessState: (addNewSubscriberResponse) {
              // Navigator.pop(context);
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
              // showDialog(
              //     context: context,
              //     builder: (context) => const Center(
              //             child: CircularProgressIndicator(
              //           color: ColorsManager.secondaryColor,
              //         )));
            },
            getActiveSubscribersLoadingState: () {
              // showDialog(
              //     context: context,
              //     builder: (context) => const Center(
              //             child: CircularProgressIndicator(
              //           color: ColorsManager.secondaryColor,
              //         )));
            },
            getActiveSubscribersSuccessState: (getActiveSubscribersResponse) {
              // Navigator.pop(context);
              SubscribersCubit.get(context).totalBalanceForActiveSubscribers = 0;
              for (int i = 0;
                  i < getActiveSubscribersResponse.result!.length;
                  i++) {
                if (getActiveSubscribersResponse.result![i].balance! < 0) {
                  SubscribersCubit.get(context)
                          .totalBalanceForActiveSubscribers +=
                      getActiveSubscribersResponse.result![i].balance!;
                }
              }
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
              // showDialog(
              //     context: context,
              //     builder: (context) => const Center(
              //             child: CircularProgressIndicator(
              //           color: ColorsManager.secondaryColor,
              //         )));
            },
            getLateSubscribersSuccessState: (getActiveSubscribersResponse) {
              SubscribersCubit.get(context)
                  .totalBalanceForLateSubscribers = 0;
              for (int i = 0;
                  i < getActiveSubscribersResponse.result!.length;
                  i++) {
                if (getActiveSubscribersResponse.result![i].balance! < 0) {
                  SubscribersCubit.get(context)
                          .totalBalanceForLateSubscribers +=
                      getActiveSubscribersResponse.result![i].balance!;
                }
              }
              // Navigator.pop(context);
              SubscribersCubit.get(context).lateSubscribers =
                  getActiveSubscribersResponse.result!;
              SubscribersCubit.get(context).changeLateSubscriberData(
                  lateSubscribers: getActiveSubscribersResponse.result!);
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
              // showDialog(
              //     context: context,
              //     builder: (context) => const Center(
              //             child: CircularProgressIndicator(
              //           color: ColorsManager.secondaryColor,
              //         )));
            },
            getWithdrawnSubscribersSuccessState:
                (getWithdrawnSubscribersResponse) {SubscribersCubit.get(context)
                    .totalBalanceForWithdrawnSubscribers = 0;

              for (int i = 0;
                  i < getWithdrawnSubscribersResponse.result!.length;
                  i++) {
                if (getWithdrawnSubscribersResponse.result![i].balance! < 0) {
                  SubscribersCubit.get(context)
                          .totalBalanceForWithdrawnSubscribers +=
                      getWithdrawnSubscribersResponse.result![i].balance!;
                }
              }
              // Navigator.pop(context);
              SubscribersCubit.get(context).changeWithdrawSubscribersData(
                  withdrawSubscribers: getWithdrawnSubscribersResponse.result!);
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
              // showDialog(
              //     context: context,
              //     builder: (context) => const Center(
              //             child: CircularProgressIndicator(
              //           color: ColorsManager.secondaryColor,
              //         )));
            },
            getDisabledSubscribersSuccessState: (getActiveSubscribersResponse) {
              SubscribersCubit.get(context)
                  .totalBalanceForDisabledSubscribers = 0;
              for (int i = 0;
                  i < getActiveSubscribersResponse.result!.length;
                  i++) {
                if (getActiveSubscribersResponse.result![i].balance! < 0) {
                  SubscribersCubit.get(context)
                          .totalBalanceForDisabledSubscribers +=
                      getActiveSubscribersResponse.result![i].balance!;
                }
              }
              // Navigator.pop(context);
              SubscribersCubit.get(context).changeDisabledSubscribersData(
                  disableSubscribers: getActiveSubscribersResponse.result!);
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
            activateSubscriberLoadingState: () {
              // showDialog(
              //     context: context,
              //     builder: (context) => const Center(
              //           child: CircularProgressIndicator(
              //             color: ColorsManager.secondaryColor,
              //           ),
              //         ));
            },
            activateSubscriberSuccessState: (activateSubscriberResponse) {
              // Navigator.pop(context);
              SubscribersCubit.get(context).getActiveSubscribers(
                getActiveSubscribersRequestBody:
                    GetActiveSubscribersRequestBody(
                  planName: SubscribersCubit.get(context)
                      .activatedSubscriberPlanName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .activatedSubscriberLineType
                      .text,
                  name: SubscribersCubit.get(context)
                      .activatedSubscriberName
                      .text,
                  phone: SubscribersCubit.get(context)
                      .activatedSubscriberPhone
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .activatedSubscriberRelatedTo
                      .text,
                ),
              );
              SubscribersCubit.get(context).getWithdrawnSubscribers(
                getWithdrawnSubscribersRequestBody:
                    GetWithdrawnSubscribersRequestBody(
                  relatedTo: SubscribersCubit.get(context)
                      .withdrawnSubscriberRelatedTo
                      .text,
                  phone: SubscribersCubit.get(context)
                      .withdrawnSubscriberPhone
                      .text,
                  name: SubscribersCubit.get(context)
                      .withdrawnSubscriberName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .withdrawnSubscriberLineType
                      .text,
                  planName: SubscribersCubit.get(context)
                      .withdrawnSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCompanyName
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCollectorName
                      .text,
                ),
              );
              SubscribersCubit.get(context).getLateSubscribers(
                getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                  name: SubscribersCubit.get(context).lateSubscriberName.text,
                  planName:
                      SubscribersCubit.get(context).lateSubscriberPlanName.text,
                  phone: SubscribersCubit.get(context).lateSubscriberPhone.text,
                  relatedTo: SubscribersCubit.get(context)
                      .lateSubscriberRelatedTo
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .lateSubscriberCollectorName
                      .text,
                  monthsLate: 0,
                ),
              );
              SubscribersCubit.get(context).getDisabledSubscribers(
                  getDisabledSubscribersRequestBody:
                      GetDisabledSubscribersRequestBody(
                name: SubscribersCubit.get(context).disabledSubscriberName.text,
                phone:
                    SubscribersCubit.get(context).disabledSubscriberPhone.text,
                collectorName: SubscribersCubit.get(context)
                    .disabledSubscriberCollectorName
                    .text,
                planName: SubscribersCubit.get(context)
                    .disabledSubscriberPlanName
                    .text,
                companyName: SubscribersCubit.get(context)
                    .disabledSubscriberCompanyName
                    .text,
                lineType: SubscribersCubit.get(context)
                    .disabledSubscriberLineType
                    .text,
                relatedTo: SubscribersCubit.get(context)
                    .disabledSubscriberRelatedTo
                    .text,
              ));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(activateSubscriberResponse.statusMessage!),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
            },
            activateSubscriberErrorState: (error) {
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
            zeroSubscriberBalanceLoadingState: () {
              // showDialog(
              //     context: context,
              //     builder: (context) => const Center(
              //             child: CircularProgressIndicator(
              //           color: ColorsManager.secondaryColor,
              //         )));
            },
            zeroSubscriberBalanceSuccessState: (zeroSubscriberBalanceResponse) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(zeroSubscriberBalanceResponse.statusMessage!),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
              SubscribersCubit.get(context).getActiveSubscribers(
                getActiveSubscribersRequestBody:
                    GetActiveSubscribersRequestBody(
                  planName: SubscribersCubit.get(context)
                      .activatedSubscriberPlanName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .activatedSubscriberLineType
                      .text,
                  name: SubscribersCubit.get(context)
                      .activatedSubscriberName
                      .text,
                  phone: SubscribersCubit.get(context)
                      .activatedSubscriberPhone
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .activatedSubscriberRelatedTo
                      .text,
                ),
              );
              SubscribersCubit.get(context).getWithdrawnSubscribers(
                getWithdrawnSubscribersRequestBody:
                    GetWithdrawnSubscribersRequestBody(
                  relatedTo: SubscribersCubit.get(context)
                      .withdrawnSubscriberRelatedTo
                      .text,
                  phone: SubscribersCubit.get(context)
                      .withdrawnSubscriberPhone
                      .text,
                  name: SubscribersCubit.get(context)
                      .withdrawnSubscriberName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .withdrawnSubscriberLineType
                      .text,
                  planName: SubscribersCubit.get(context)
                      .withdrawnSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCompanyName
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCollectorName
                      .text,
                ),
              );
              SubscribersCubit.get(context).getLateSubscribers(
                getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                  name: SubscribersCubit.get(context).lateSubscriberName.text,
                  planName:
                      SubscribersCubit.get(context).lateSubscriberPlanName.text,
                  phone: SubscribersCubit.get(context).lateSubscriberPhone.text,
                  relatedTo: SubscribersCubit.get(context)
                      .lateSubscriberRelatedTo
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .lateSubscriberCollectorName
                      .text,
                  monthsLate: null,
                ),
              );
              SubscribersCubit.get(context).getDisabledSubscribers(
                  getDisabledSubscribersRequestBody:
                      GetDisabledSubscribersRequestBody(
                name: SubscribersCubit.get(context).disabledSubscriberName.text,
                phone:
                    SubscribersCubit.get(context).disabledSubscriberPhone.text,
                collectorName: SubscribersCubit.get(context)
                    .disabledSubscriberCollectorName
                    .text,
                planName: SubscribersCubit.get(context)
                    .disabledSubscriberPlanName
                    .text,
                companyName: SubscribersCubit.get(context)
                    .disabledSubscriberCompanyName
                    .text,
                lineType: SubscribersCubit.get(context)
                    .disabledSubscriberLineType
                    .text,
                relatedTo: SubscribersCubit.get(context)
                    .disabledSubscriberRelatedTo
                    .text,
              ));
            },
            zeroSubscriberBalanceErrorState: (error) {
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
            withdrawSubscriberLoadingState: () {},
            withdrawSubscriberSuccessState: (withdrawSubscriberResponse) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(withdrawSubscriberResponse.statusMessage!),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
              SubscribersCubit.get(context).getActiveSubscribers(
                getActiveSubscribersRequestBody:
                    GetActiveSubscribersRequestBody(
                  planName: SubscribersCubit.get(context)
                      .activatedSubscriberPlanName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .activatedSubscriberLineType
                      .text,
                  name: SubscribersCubit.get(context)
                      .activatedSubscriberName
                      .text,
                  phone: SubscribersCubit.get(context)
                      .activatedSubscriberPhone
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .activatedSubscriberRelatedTo
                      .text,
                ),
              );
              SubscribersCubit.get(context).getWithdrawnSubscribers(
                getWithdrawnSubscribersRequestBody:
                    GetWithdrawnSubscribersRequestBody(
                  relatedTo: SubscribersCubit.get(context)
                      .withdrawnSubscriberRelatedTo
                      .text,
                  phone: SubscribersCubit.get(context)
                      .withdrawnSubscriberPhone
                      .text,
                  name: SubscribersCubit.get(context)
                      .withdrawnSubscriberName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .withdrawnSubscriberLineType
                      .text,
                  planName: SubscribersCubit.get(context)
                      .withdrawnSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCompanyName
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCollectorName
                      .text,
                ),
              );
              SubscribersCubit.get(context).getLateSubscribers(
                getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                  name: SubscribersCubit.get(context).lateSubscriberName.text,
                  planName:
                      SubscribersCubit.get(context).lateSubscriberPlanName.text,
                  phone: SubscribersCubit.get(context).lateSubscriberPhone.text,
                  relatedTo: SubscribersCubit.get(context)
                      .lateSubscriberRelatedTo
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .lateSubscriberCollectorName
                      .text,
                  monthsLate: null,
                ),
              );
              SubscribersCubit.get(context).getDisabledSubscribers(
                  getDisabledSubscribersRequestBody:
                      GetDisabledSubscribersRequestBody(
                name: SubscribersCubit.get(context).disabledSubscriberName.text,
                phone:
                    SubscribersCubit.get(context).disabledSubscriberPhone.text,
                collectorName: SubscribersCubit.get(context)
                    .disabledSubscriberCollectorName
                    .text,
                planName: SubscribersCubit.get(context)
                    .disabledSubscriberPlanName
                    .text,
                companyName: SubscribersCubit.get(context)
                    .disabledSubscriberCompanyName
                    .text,
                lineType: SubscribersCubit.get(context)
                    .disabledSubscriberLineType
                    .text,
                relatedTo: SubscribersCubit.get(context)
                    .disabledSubscriberRelatedTo
                    .text,
              ));
            },
            withdrawSubscriberErrorState: (error) {
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
            collectSubscriberBalanceLoadingState: () {},
            collectSubscriberBalanceSuccessState:
                (collectSubscriberBalanceResponse) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(collectSubscriberBalanceResponse.statusMessage!),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
              SubscribersCubit.get(context).getActiveSubscribers(
                getActiveSubscribersRequestBody:
                    GetActiveSubscribersRequestBody(
                  planName: SubscribersCubit.get(context)
                      .activatedSubscriberPlanName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .activatedSubscriberLineType
                      .text,
                  name: SubscribersCubit.get(context)
                      .activatedSubscriberName
                      .text,
                  phone: SubscribersCubit.get(context)
                      .activatedSubscriberPhone
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .activatedSubscriberRelatedTo
                      .text,
                ),
              );
              SubscribersCubit.get(context).getWithdrawnSubscribers(
                getWithdrawnSubscribersRequestBody:
                    GetWithdrawnSubscribersRequestBody(
                  relatedTo: SubscribersCubit.get(context)
                      .withdrawnSubscriberRelatedTo
                      .text,
                  phone: SubscribersCubit.get(context)
                      .withdrawnSubscriberPhone
                      .text,
                  name: SubscribersCubit.get(context)
                      .withdrawnSubscriberName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .withdrawnSubscriberLineType
                      .text,
                  planName: SubscribersCubit.get(context)
                      .withdrawnSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCompanyName
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCollectorName
                      .text,
                ),
              );
              SubscribersCubit.get(context).getLateSubscribers(
                getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                  name: SubscribersCubit.get(context).lateSubscriberName.text,
                  planName:
                      SubscribersCubit.get(context).lateSubscriberPlanName.text,
                  phone: SubscribersCubit.get(context).lateSubscriberPhone.text,
                  relatedTo: SubscribersCubit.get(context)
                      .lateSubscriberRelatedTo
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .lateSubscriberCollectorName
                      .text,
                  monthsLate: null,
                ),
              );
              SubscribersCubit.get(context).getDisabledSubscribers(
                getDisabledSubscribersRequestBody:
                    GetDisabledSubscribersRequestBody(
                  name:
                      SubscribersCubit.get(context).disabledSubscriberName.text,
                  phone: SubscribersCubit.get(context)
                      .disabledSubscriberPhone
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .disabledSubscriberCollectorName
                      .text,
                  planName: SubscribersCubit.get(context)
                      .disabledSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .disabledSubscriberCompanyName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .disabledSubscriberLineType
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .disabledSubscriberRelatedTo
                      .text,
                ),
              );
            },
            collectSubscriberBalanceErrorState: (error) {
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
            disableSubscriberLoadingState: () {},
            disableSubscriberSuccessState: (disableSubscriberResponse) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(disableSubscriberResponse.statusMessage!),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
              SubscribersCubit.get(context).getActiveSubscribers(
                getActiveSubscribersRequestBody:
                    GetActiveSubscribersRequestBody(
                  planName: SubscribersCubit.get(context)
                      .activatedSubscriberPlanName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .activatedSubscriberLineType
                      .text,
                  name: SubscribersCubit.get(context)
                      .activatedSubscriberName
                      .text,
                  phone: SubscribersCubit.get(context)
                      .activatedSubscriberPhone
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .activatedSubscriberRelatedTo
                      .text,
                ),
              );
              SubscribersCubit.get(context).getWithdrawnSubscribers(
                getWithdrawnSubscribersRequestBody:
                    GetWithdrawnSubscribersRequestBody(
                  relatedTo: SubscribersCubit.get(context)
                      .withdrawnSubscriberRelatedTo
                      .text,
                  phone: SubscribersCubit.get(context)
                      .withdrawnSubscriberPhone
                      .text,
                  name: SubscribersCubit.get(context)
                      .withdrawnSubscriberName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .withdrawnSubscriberLineType
                      .text,
                  planName: SubscribersCubit.get(context)
                      .withdrawnSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCompanyName
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCollectorName
                      .text,
                ),
              );
              SubscribersCubit.get(context).getLateSubscribers(
                getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                  name: SubscribersCubit.get(context).lateSubscriberName.text,
                  planName:
                      SubscribersCubit.get(context).lateSubscriberPlanName.text,
                  phone: SubscribersCubit.get(context).lateSubscriberPhone.text,
                  relatedTo: SubscribersCubit.get(context)
                      .lateSubscriberRelatedTo
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .lateSubscriberCollectorName
                      .text,
                  monthsLate: null,
                ),
              );
              SubscribersCubit.get(context).getDisabledSubscribers(
                  getDisabledSubscribersRequestBody:
                      GetDisabledSubscribersRequestBody(
                name: SubscribersCubit.get(context).disabledSubscriberName.text,
                phone:
                    SubscribersCubit.get(context).disabledSubscriberPhone.text,
                collectorName: SubscribersCubit.get(context)
                    .disabledSubscriberCollectorName
                    .text,
                planName: SubscribersCubit.get(context)
                    .disabledSubscriberPlanName
                    .text,
                companyName: SubscribersCubit.get(context)
                    .disabledSubscriberCompanyName
                    .text,
                lineType: SubscribersCubit.get(context)
                    .disabledSubscriberLineType
                    .text,
                relatedTo: SubscribersCubit.get(context)
                    .disabledSubscriberRelatedTo
                    .text,
              ));
            },
            disableSubscriberErrorState: (error) {
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
            deleteSubscriberLoadingState: () {},
            deleteSubscriberSuccessState: (deleteSubscriberResponse) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(deleteSubscriberResponse.statusMessage!),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
              SubscribersCubit.get(context).getActiveSubscribers(
                getActiveSubscribersRequestBody:
                    GetActiveSubscribersRequestBody(
                  planName: SubscribersCubit.get(context)
                      .activatedSubscriberPlanName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .activatedSubscriberLineType
                      .text,
                  name: SubscribersCubit.get(context)
                      .activatedSubscriberName
                      .text,
                  phone: SubscribersCubit.get(context)
                      .activatedSubscriberPhone
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .activatedSubscriberRelatedTo
                      .text,
                ),
              );
              SubscribersCubit.get(context).getWithdrawnSubscribers(
                getWithdrawnSubscribersRequestBody:
                    GetWithdrawnSubscribersRequestBody(
                  relatedTo: SubscribersCubit.get(context)
                      .withdrawnSubscriberRelatedTo
                      .text,
                  phone: SubscribersCubit.get(context)
                      .withdrawnSubscriberPhone
                      .text,
                  name: SubscribersCubit.get(context)
                      .withdrawnSubscriberName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .withdrawnSubscriberLineType
                      .text,
                  planName: SubscribersCubit.get(context)
                      .withdrawnSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCompanyName
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCollectorName
                      .text,
                ),
              );
              SubscribersCubit.get(context).getLateSubscribers(
                getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                  name: SubscribersCubit.get(context).lateSubscriberName.text,
                  planName:
                      SubscribersCubit.get(context).lateSubscriberPlanName.text,
                  phone: SubscribersCubit.get(context).lateSubscriberPhone.text,
                  relatedTo: SubscribersCubit.get(context)
                      .lateSubscriberRelatedTo
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .lateSubscriberCollectorName
                      .text,
                  monthsLate: null,
                ),
              );
              SubscribersCubit.get(context).getDisabledSubscribers(
                  getDisabledSubscribersRequestBody:
                      GetDisabledSubscribersRequestBody(
                name: SubscribersCubit.get(context).disabledSubscriberName.text,
                phone:
                    SubscribersCubit.get(context).disabledSubscriberPhone.text,
                collectorName: SubscribersCubit.get(context)
                    .disabledSubscriberCollectorName
                    .text,
                planName: SubscribersCubit.get(context)
                    .disabledSubscriberPlanName
                    .text,
                companyName: SubscribersCubit.get(context)
                    .disabledSubscriberCompanyName
                    .text,
                lineType: SubscribersCubit.get(context)
                    .disabledSubscriberLineType
                    .text,
                relatedTo: SubscribersCubit.get(context)
                    .disabledSubscriberRelatedTo
                    .text,
              ));
            },
            deleteSubscriberErrorState: (error) {
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
            updateSubscriberLoadingState: () {},
            updateSubscriberSuccessState: (updateSubscriberResponse) {
              // Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(updateSubscriberResponse.statusMessage!),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
              SubscribersCubit.get(context).getActiveSubscribers(
                getActiveSubscribersRequestBody:
                    GetActiveSubscribersRequestBody(
                  planName: SubscribersCubit.get(context)
                      .activatedSubscriberPlanName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .activatedSubscriberLineType
                      .text,
                  name: SubscribersCubit.get(context)
                      .activatedSubscriberName
                      .text,
                  phone: SubscribersCubit.get(context)
                      .activatedSubscriberPhone
                      .text,
                  relatedTo: SubscribersCubit.get(context)
                      .activatedSubscriberRelatedTo
                      .text,
                ),
              );
              SubscribersCubit.get(context).getWithdrawnSubscribers(
                getWithdrawnSubscribersRequestBody:
                    GetWithdrawnSubscribersRequestBody(
                  relatedTo: SubscribersCubit.get(context)
                      .withdrawnSubscriberRelatedTo
                      .text,
                  phone: SubscribersCubit.get(context)
                      .withdrawnSubscriberPhone
                      .text,
                  name: SubscribersCubit.get(context)
                      .withdrawnSubscriberName
                      .text,
                  lineType: SubscribersCubit.get(context)
                      .withdrawnSubscriberLineType
                      .text,
                  planName: SubscribersCubit.get(context)
                      .withdrawnSubscriberPlanName
                      .text,
                  companyName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCompanyName
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .withdrawnSubscriberCollectorName
                      .text,
                ),
              );
              SubscribersCubit.get(context).getLateSubscribers(
                getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                  name: SubscribersCubit.get(context).lateSubscriberName.text,
                  planName:
                      SubscribersCubit.get(context).lateSubscriberPlanName.text,
                  phone: SubscribersCubit.get(context).lateSubscriberPhone.text,
                  relatedTo: SubscribersCubit.get(context)
                      .lateSubscriberRelatedTo
                      .text,
                  collectorName: SubscribersCubit.get(context)
                      .lateSubscriberCollectorName
                      .text,
                  monthsLate: null,
                ),
              );
              SubscribersCubit.get(context).getDisabledSubscribers(
                  getDisabledSubscribersRequestBody:
                      GetDisabledSubscribersRequestBody(
                name: SubscribersCubit.get(context).disabledSubscriberName.text,
                phone:
                    SubscribersCubit.get(context).disabledSubscriberPhone.text,
                collectorName: SubscribersCubit.get(context)
                    .disabledSubscriberCollectorName
                    .text,
                planName: SubscribersCubit.get(context)
                    .disabledSubscriberPlanName
                    .text,
                companyName: SubscribersCubit.get(context)
                    .disabledSubscriberCompanyName
                    .text,
                lineType: SubscribersCubit.get(context)
                    .disabledSubscriberLineType
                    .text,
                relatedTo: SubscribersCubit.get(context)
                    .disabledSubscriberRelatedTo
                    .text,
              ));
            },
            updateSubscriberErrorState: (error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(error),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )));
            });
      },
      child: const SizedBox.shrink(),
    );
  }
}
