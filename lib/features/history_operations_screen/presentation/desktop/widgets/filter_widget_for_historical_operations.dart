import 'package:flutter/material.dart';

import '../../../../../core/helpers/dimensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/check_box_outline.dart';
import '../../../../../core/widgets/custom_search_widget.dart';
import '../../../../../core/widgets/filter_widget_details.dart';
import '../../../../../core/widgets/muilti_drop_down_button.dart';
import '../../../business_logic/history_operations_cubit.dart';
import '../../../data/models/get_logged_operations_request_body.dart';

class FilterWidgetForHistoricalOperations extends StatefulWidget {
  const FilterWidgetForHistoricalOperations({super.key, required this.visible});

  final bool visible;

  @override
  State<FilterWidgetForHistoricalOperations> createState() =>
      _FilterWidgetForHistoricalOperationsState();
}

class _FilterWidgetForHistoricalOperationsState
    extends State<FilterWidgetForHistoricalOperations> {
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
    var dimension = Dimensions(context);
    return FilterWidgetDetails(
      visible: widget.visible,
      top: dimension.height45,
      right: dimension.width200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     DefaultText(
          //       text: "الفترة:",
          //       color: Color(0xFF333333),
          //       fontSize: 16,
          //       fontWeight: FontWeight.w400,
          //     ),
          //     horizontalSpace(dimension.width10),
          //     DefaultDateFormField(
          //       width: dimension.width200,
          //       controller: from,
          //       title: "",
          //       onFieldSubmitted: (value) {
          //         // value = convertDateToString(value);
          //         // SubscribersCubit.get(context).getDisabledSubscribers(
          //         //     getDisabledSubscribersRequestBody: GetDisabledSubscribersRequestBody(
          //         //       collectorName: collectorName.text,
          //         //
          //         //     ));
          //       },
          //       // hintText: "اسم المحصل",
          //     ),
          //     horizontalSpace(dimension.width10),
          //     DefaultDateFormField(
          //       width: dimension.width200,
          //       controller: to,
          //       title: "",
          //       // hintText: "اسم المحصل",
          //     ),
          //     // CustomSearchWidget(
          //     //   inputFormatters: [NumberInputFormatter()],
          //     //   width: dimension.width200,
          //     //   searchController: monthsLate,
          //     //   onChange: (value) {
          //     //     SubscribersCubit.get(context).getLateSubscribers(
          //     //       getLateSubscribersRequestBody: GetLateSubscribersRequestBody(
          //     //         monthsLate: int.tryParse(value),
          //     //         planName: selectedPlanList.join(","),
          //     //         collectorName: collectorName.text,
          //     //       ),
          //     //     );
          //     //   },
          //     //   hintText: "عدد الاشهر",
          //     // ),
          //   ],
          // ),
          // verticalSpace(dimension.height5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomSearchWidget(
                width: dimension.width200,
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
              horizontalSpace(dimension.width10),
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
            ],
          ),
        ],
      ),
    );
  }
}
