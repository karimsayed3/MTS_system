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
import '../../../business_logic/history_operations_cubit.dart';
import '../../../data/models/get_logged_operations_request_body.dart';


class FilterWidgetForHistoricalOperationsMobile extends StatefulWidget {
  const FilterWidgetForHistoricalOperationsMobile(
      {super.key,});


  @override
  State<FilterWidgetForHistoricalOperationsMobile> createState() =>
      _FilterWidgetForHistoricalOperationsMobileState();
}

class _FilterWidgetForHistoricalOperationsMobileState
    extends State<FilterWidgetForHistoricalOperationsMobile> {
  TextEditingController collectorName = TextEditingController();
  TextEditingController relatedTo = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  List<String> lineTypeList = ["اختر الكل", "جديد", "محول"];
  List<String> selectedLineTypeList = [];
  bool flagForLineType = false;

  List<String> planNameList = [];
  List<String> selectedPlanList = [];
  List<String> operationTypes = [
    "اختر الكل",
    "تفعيل",
    "تصفير",
    "اضافة رصيد",
    "معطل",
    "مسحوب",
    "تعديل باقة",
  ];
  List<String> selectedOperationTypes = [];
  bool flagForOperationTypes = false;

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
                CustomSearchWidget(
                  width: 400.w,
                  searchController: relatedTo,
                  onChange: (value) {

                    HistoryOperationsCubit.get(context).getLoggedOperations(
                        getLoggedOperationsRequestBody: GetLoggedOperationsRequestBody(
                          relatedTo: value,
                          operationTypes: selectedOperationTypes.join(","),
                        ));
                  },
                  hintText: "التبعية",
                ),
                verticalSpace(10.h),
                MultiDropDownButton(
                  items: operationTypes.map((item) {
                    return DropdownMenuItem(
                      value: item,
//disable default onTap to avoid closing menu when selecting an item
                      enabled: false,
                      child: StatefulBuilder(
                        builder: (context, menuSetState) {
                          var isSelected = selectedOperationTypes.contains(item);
                          return InkWell(
                            onTap: () {
                              if (item == "اختر الكل") {
                                flagForOperationTypes = !flagForOperationTypes;
                                if (flagForOperationTypes) {
                                  selectedOperationTypes = operationTypes.sublist(1);
                                } else {
                                  selectedOperationTypes = [];
                                }
                              }
                              isSelected
                                  ? selectedOperationTypes.remove(item)
                                  : selectedOperationTypes.add(item);
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
                  mainList: operationTypes,
                  flag: flagForOperationTypes,
                  title: '',
                  hintText: 'نوع العملية',
                  onMenuStateChange: (isOpen) {
                    selectedOperationTypes.remove('اختر الكل');
                    if (!isOpen) {
                      // dropDownController.clear();
                      // SubscribersCubit.get(context).getDisabledSubscribers(
                      //     getDisabledSubscribersRequestBody: GetDisabledSubscribersRequestBody(
                      //       collectorName: collectorName.text,
                      //       companyName: selectedCompaniesList.join(","),
                      //       lineType: selectedLineTypeList.join(","),
                      //       planName: selectedPlanList.join(","),
                      //     ));
                      HistoryOperationsCubit.get(context).getLoggedOperations(
                          getLoggedOperationsRequestBody: GetLoggedOperationsRequestBody(
                            relatedTo: relatedTo.text,
                            operationTypes: selectedOperationTypes.join(","),
                          ));
                    }
                    // setState(() {
                    //
                    // });
                  },
                  searchText: "نوع العملية",
                  selectedList: selectedOperationTypes,
                  textEditingController: dropDownController,
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
