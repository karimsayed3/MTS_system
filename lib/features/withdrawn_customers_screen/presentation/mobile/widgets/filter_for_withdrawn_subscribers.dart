import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/check_box_outline.dart';
import '../../../../../core/widgets/custom_search_widget.dart';
import '../../../../../core/widgets/default_date_widget.dart';
import '../../../../../core/widgets/muilti_drop_down_button.dart';
import '../../../../subscribers_screen/business_logic/subscribers_cubit.dart';
import '../../../../subscribers_screen/business_logic/subscribers_state.dart';
import '../../../../subscribers_screen/data/models/get_disabled_subscribers_request_body.dart';
import '../../../../subscribers_screen/data/models/get_withdrawn_subscribers_request_body.dart';


class FilterWidgetForWithdrawnSubscribersMobile extends StatefulWidget {
  const FilterWidgetForWithdrawnSubscribersMobile(
      {super.key, required this.companiesList});

  final List<String> companiesList;

  @override
  State<FilterWidgetForWithdrawnSubscribersMobile> createState() =>
      _FilterWidgetForWithdrawnSubscribersMobileState();
}

class _FilterWidgetForWithdrawnSubscribersMobileState
    extends State<FilterWidgetForWithdrawnSubscribersMobile> {
  TextEditingController collectorName = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(10.h),
        Container(
          width: 50.w,
          height: 5.h,
          decoration: BoxDecoration(
              color: const Color(0xFF79747E),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
        verticalSpace(15.h),
        DefaultText(text: "فلتر",fontSize: 20.sp,color: const Color(0xFF333333),fontWeight: FontWeight.w500,),
        Expanded(
          child: SingleChildScrollView(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DefaultText(
                      text: "فترة السحب:",
                      color: const Color(0xFF333333),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    verticalSpace(5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: DefaultDateFormField(
                            hint :'الى',
                            // width: 150.w,
                            controller: from,
                            title: "",
                            onFieldSubmitted: (value) {
                              // value = convertDateToString(value);
                              // SubscribersCubit.get(context).getDisabledSubscribers(
                              //     getDisabledSubscribersRequestBody: GetDisabledSubscribersRequestBody(
                              //       collectorName: collectorName.text,
                              //
                              //     ));
                            },
                            // hintText: "اسم المحصل",
                          ),
                        ),
                        horizontalSpace(10.w),
                        Expanded(
                          child: DefaultDateFormField(
                            hint :'من',
                            width: 15.w,
                            controller: to,
                            title: "",
                            // hintText: "اسم المحصل",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(10.h),
                CustomSearchWidget(
                  width: 400.w,
                  searchController: collectorName,
                  onChange: (value) {
                    SubscribersCubit.get(context).getWithdrawnSubscribers(
                        getWithdrawnSubscribersRequestBody:
                        GetWithdrawnSubscribersRequestBody(
                          collectorName: value,
                          companyName: selectedCompaniesList.join(","),
                          lineType: selectedLineTypeList.join(","),
                          planName: selectedPlanList.join(","),
                        ));
                  },
                  hintText: "اسم المحصل",
                ),
                verticalSpace(10.h),
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
                          SubscribersCubit.get(context).getWithdrawnSubscribers(
                              getWithdrawnSubscribersRequestBody:
                              GetWithdrawnSubscribersRequestBody(
                                collectorName: collectorName.text,
                                companyName: selectedCompaniesList.join(","),
                                lineType: selectedLineTypeList.join(","),
                                planName: selectedPlanList.join(","),
                              ));
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
                verticalSpace(10.h),

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
                          SubscribersCubit.get(context).getWithdrawnSubscribers(
                              getWithdrawnSubscribersRequestBody:
                              GetWithdrawnSubscribersRequestBody(
                                collectorName: collectorName.text,
                                companyName: selectedCompaniesList.join(","),
                                lineType: selectedLineTypeList.join(","),
                                planName: selectedPlanList.join(","),
                              ));
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
                verticalSpace(10.h),
                BlocConsumer<SubscribersCubit, SubscribersState>(
                  listener: (context, state) {
                    if (state is GetPlansListSuccessState) {
                      planNameList =
                          ['اختر الكل'] + state.getListsResponse.result!;
                      // SubscribersCubit.get(context).getActiveSubscribers(
                      //   getActiveSubscribersRequestBody:
                      //   GetActiveSubscribersRequestBody(
                      //     lineType: selectedLineTypeList.join(','),
                      //     planName: state.getListsResponse.result!.join(','),
                      //     companyName: selectedCompaniesList.join(','),
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
                          SubscribersCubit.get(context).getWithdrawnSubscribers(
                              getWithdrawnSubscribersRequestBody:
                              GetWithdrawnSubscribersRequestBody(
                                collectorName: collectorName.text,
                                companyName: selectedCompaniesList.join(","),
                                lineType: selectedLineTypeList.join(","),
                                planName: selectedPlanList.join(","),
                              ));
                        }
                      },
                      searchText: "اسم الباقة",
                      selectedList: selectedPlanList,
                      textEditingController: dropDownController,
                    );
                  },
                ),
                verticalSpace(10.h),

              ],
            ),
          ),
        ),
        // verticalSpace(dimension.height5),
      ],
    );
  }
}
