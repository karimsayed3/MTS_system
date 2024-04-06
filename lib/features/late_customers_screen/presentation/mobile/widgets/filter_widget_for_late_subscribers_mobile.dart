import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/filter_widget_details.dart';
import 'package:system/features/subscribers_screen/data/models/get_late_subscribers_request_body.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/check_box_outline.dart';
import '../../../../../core/widgets/custom_search_widget.dart';
import '../../../../../core/widgets/muilti_drop_down_button.dart';
import '../../../../subscribers_screen/business_logic/subscribers_cubit.dart';
import '../../../../subscribers_screen/business_logic/subscribers_state.dart';


class FilterWidgetForLateSubscribersMobile extends StatefulWidget {
  const FilterWidgetForLateSubscribersMobile(
      {super.key, required this.companiesList});

  final List<String> companiesList;

  @override
  State<FilterWidgetForLateSubscribersMobile> createState() =>
      _FilterWidgetForLateSubscribersMobileState();
}

class _FilterWidgetForLateSubscribersMobileState
    extends State<FilterWidgetForLateSubscribersMobile> {
  TextEditingController collectorName = TextEditingController();

  List<String> lineTypeList = ["اختر الكل", "جديد", "محول"];
  List<String> selectedLineTypeList = [];
  bool flagForLineType = false;

  List<String> planNameList = [];
  List<String> selectedPlanList = [];
  bool flagForPlan = false;

  List<String> selectedCompaniesList = [];
  bool flagForCompanies = false;
  TextEditingController dropDownController = TextEditingController();
  TextEditingController monthsLate = TextEditingController();

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
                CustomSearchWidget(
                  width: 350.w,
                  searchController: collectorName,
                  onChange: (value) {
                    SubscribersCubit.get(context).getLateSubscribers(
                      getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                        monthsLate: int.tryParse(monthsLate.text),
                        planName: selectedPlanList.join(","),
                        collectorName: value,
                      ),
                    );
                  },
                  hintText: "اسم المحصل",
                ),
                verticalSpace(10.h),
                CustomSearchWidget(
                  inputFormatters: [NumberInputFormatter()],
                  width: 350.w,
                  searchController: monthsLate,
                  onChange: (value) {
                    SubscribersCubit.get(context).getLateSubscribers(
                      getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                        monthsLate: int.tryParse(value),
                        planName: selectedPlanList.join(","),
                        collectorName: collectorName.text,
                      ),
                    );
                  },
                  hintText: "عدد الاشهر",
                ),
                verticalSpace(10.h),
                BlocConsumer<SubscribersCubit, SubscribersState>(
                  listener: (context, state) {
                    if (state is GetPlansListSuccessState) {
                      planNameList = ['اختر الكل'] + state.getListsResponse.result!;
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
                      width: 350.w,
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
                          SubscribersCubit.get(context).getLateSubscribers(
                            getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
                              monthsLate: int.tryParse(monthsLate.text),
                              planName: selectedPlanList.join(","),
                              collectorName: collectorName.text,
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
