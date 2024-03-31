import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/widgets/filter_widget_details.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/check_box_outline.dart';
import '../../../../../core/widgets/muilti_drop_down_button.dart';
import '../../../business_logic/subscribers_cubit.dart';
import '../../../business_logic/subscribers_state.dart';
import '../../../data/models/get_active_subscribers_request_body.dart';

class FilterWidgetForSubscribers extends StatefulWidget {
  const FilterWidgetForSubscribers(
      {super.key, required this.visible, required this.companiesList});

  final bool visible;

  final List<String> companiesList;

  @override
  State<FilterWidgetForSubscribers> createState() =>
      _FilterWidgetForSubscribersState();
}

class _FilterWidgetForSubscribersState
    extends State<FilterWidgetForSubscribers> {
  List<String> lineTypeList = ["اختر الكل", "جديد", "محول"];
  List<String> selectedLineTypeList = [];
  bool flagForLineType = false;

  List<String> planNameList = [];
  List<String> selectedPlanList = [];
  bool flagForPlan = false;

  List<String> selectedCompaniesList = [];
  bool flagForCompanies = false;
  TextEditingController dropDownController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return FilterWidgetDetails(
      visible: widget.visible,
      top: dimension.height45,
      right: dimension.width200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SubscribersCubit, SubscribersState>(
                builder: (context, state) {
                  return MultiDropDownButton(
                    items: lineTypeList.map((item) {
                      return DropdownMenuItem(
                        value: item,
//disable default onTap to avoid closing menu when selecting an item
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            var isSelected =
                                selectedLineTypeList.contains(item);
                            return InkWell(
                              onTap: () {
                                if (item == "اختر الكل") {
                                  flagForLineType = !flagForLineType;
                                  if (flagForLineType) {
                                    selectedLineTypeList =
                                        lineTypeList.sublist(1);
                                  } else {
                                    selectedLineTypeList = [];
                                  }
                                }
                                isSelected
                                    ? selectedLineTypeList.remove(item)
                                    : selectedLineTypeList.add(item);
//This rebuilds the StatefulWidget to update the button's text
                                setState(() {});
//This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: CheckBoxOutLine(
                                isSelected: isSelected,
                                item: item,
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    mainList: lineTypeList,
                    flag: flagForLineType,
                    title: '',
                    hintText: 'نوع الخط',
                    onMenuStateChange: (isOpen) {
                      selectedLineTypeList.remove('اختر الكل');
                      if (!isOpen) {
                        // dropDownController.clear();
                        SubscribersCubit.get(context).getActiveSubscribers(
                          getActiveSubscribersRequestBody:
                              GetActiveSubscribersRequestBody(
                                  lineType: selectedLineTypeList.join(','),
                                  planName: selectedPlanList.join(','),
                                  companyName: selectedCompaniesList.join(',')),
                        );
                      }
                      // setState(() {
                      //
                      // });
                    },
                    searchText: "نوع الخط",
                    selectedList: selectedLineTypeList,
                    textEditingController: dropDownController,
                  );
                },
              ),
              horizontalSpace(dimension.width10),
              BlocConsumer<SubscribersCubit, SubscribersState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MultiDropDownButton(
                    items: widget.companiesList.map((item) {
                      return DropdownMenuItem(
                        value: item,
//disable default onTap to avoid closing menu when selecting an item
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            var isSelected =
                                selectedCompaniesList.contains(item);
                            return InkWell(
                              onTap: () {
                                if (item == "اختر الكل") {
                                  flagForCompanies = !flagForCompanies;
                                  if (flagForCompanies) {
                                    selectedCompaniesList =
                                        widget.companiesList.sublist(1);
                                  } else {
                                    selectedCompaniesList = [];
                                  }
                                }
                                isSelected
                                    ? selectedCompaniesList.remove(item)
                                    : selectedCompaniesList.add(item);
//This rebuilds the StatefulWidget to update the button's text
                                setState(() {});
//This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: CheckBoxOutLine(
                                isSelected: isSelected,
                                item: item,
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    mainList: widget.companiesList,
                    flag: flagForCompanies,
                    title: '',
                    hintText: 'الشركة',
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        dropDownController.clear();
                        selectedCompaniesList.remove('اختر الكل');
                        selectedPlanList.clear();
                        SubscribersCubit.get(context).getPlansList(
                            companyName: {
                              'companyName': selectedCompaniesList.join(',')
                            });
                        // SubscribersCubit.get(context)
                        //     .getActiveSubscribers(
                        //   getActiveSubscribersRequestBody:
                        //       GetActiveSubscribersRequestBody(
                        //     lineType: selectedLineTypeList
                        //         .join(','),
                        //     planName:
                        //         selectedPlanList.join(','),
                        //     companyName:
                        //         selectedCompaniesList
                        //             .join(','),
                        //   ),
                        // );
                      }
                    },
                    searchText: "اسم الشركة",
                    selectedList: selectedCompaniesList,
                    textEditingController: dropDownController,
                  );
                },
              ),
              horizontalSpace(dimension.width10),
              BlocConsumer<SubscribersCubit, SubscribersState>(
                listener: (context, state) {
                  if (state is GetPlansListSuccessState) {
                    planNameList =
                        ['اختر الكل'] + state.getListsResponse.result!;
                    SubscribersCubit.get(context).getActiveSubscribers(
                      getActiveSubscribersRequestBody:
                          GetActiveSubscribersRequestBody(
                        lineType: selectedLineTypeList.join(','),
                        planName: state.getListsResponse.result!.join(','),
                        companyName: selectedCompaniesList.join(','),
                      ),
                    );
                    // SubscribersCubit.get(context)
                    //     .getActiveSubscribers(
                    //   getActiveSubscribersRequestBody:
                    //       GetActiveSubscribersRequestBody(
                    //     lineType:
                    //         selectedLineTypeList.join(','),
                    //     planName: planNameList.join(','),
                    //     companyName:
                    //         selectedCompaniesList.join(','),
                    //   ),
                    // );
                  }
                },
                builder: (context, state) {
                  return MultiDropDownButton(
                    items: planNameList.map((item) {
                      return DropdownMenuItem(
                        value: item,
//disable default onTap to avoid closing menu when selecting an item
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            var isSelected = selectedPlanList.contains(item);
                            return InkWell(
                              onTap: () {
                                if (item == "اختر الكل") {
                                  flagForPlan = !flagForPlan;
                                  if (flagForPlan) {
                                    selectedPlanList = planNameList.sublist(1);
                                  } else {
                                    selectedPlanList = [];
                                  }
                                }
                                isSelected
                                    ? selectedPlanList.remove(item)
                                    : selectedPlanList.add(item);
//This rebuilds the StatefulWidget to update the button's text
                                setState(() {});
//This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: CheckBoxOutLine(
                                isSelected: isSelected,
                                item: item,
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    mainList: planNameList,
                    flag: flagForPlan,
                    title: '',
                    hintText: 'الباقة',
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        dropDownController.clear();
                        selectedPlanList.remove('اختر الكل');
                        SubscribersCubit.get(context).getActiveSubscribers(
                          getActiveSubscribersRequestBody:
                              GetActiveSubscribersRequestBody(
                            lineType: selectedLineTypeList.join(','),
                            planName: selectedPlanList.join(','),
                            companyName: selectedCompaniesList.join(','),
                          ),
                        );
                      }
                    },
                    searchText: "اسم الباقة",
                    selectedList: selectedPlanList,
                    textEditingController: dropDownController,
                  );
                },
              ),
            ],
          ),
          // verticalSpace(dimension.height5),
        ],
      ),
    );
  }
}