import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/app_regex.dart';
import 'package:system/core/helpers/check_platform.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/default_text_form_field.dart';
import 'package:system/core/widgets/drop_down_button.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_cubit.dart';
import 'package:system/features/subscribers_screen/business_logic/subscribers_state.dart';
import 'package:system/features/subscribers_screen/data/models/add_new_subscriber_request_body.dart';
import 'package:system/features/subscribers_screen/presentation/desktop/widgets/bloc_listener.dart';

class AddSubscriberWidget extends StatefulWidget {
  const AddSubscriberWidget({
    super.key,
  });

  @override
  State<AddSubscriberWidget> createState() => _AddSubscriberWidgetState();
}

class _AddSubscriberWidgetState extends State<AddSubscriberWidget> {
  TextEditingController subscriberNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController NIDController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController offerController = TextEditingController();
  TextEditingController relatedToController = TextEditingController();
  List<String> companies = [];
  String selectedValue = "";

  List<String> simType = ["جديد", "محول"];
  String selectedSimType = "جديد";

  List<String> plans = [""];
  String selectedPlan = "";

  List<String> collectors = [];
  String selectedCollector = "";

  String selectedCompany = "";

  @override
  void initState() {
    // TODO: implement initState
    SubscribersCubit.get(context).getCollectorsEmails();
    SubscribersCubit.get(context).getCompaniesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return SingleChildScrollView(
      child: SizedBox(
        width: dimension.width350 + dimension.width250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  color: ColorsManager.alertDialogHeaderColor,
                  // color: Colors.red,
                  padding: isMobile()
                      ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h)
                      : EdgeInsets.only(
                          left: dimension.width10,
                          right: dimension.width10,
                          top: dimension.height15,
                          bottom: dimension.height10,
                        ),
                  child: DefaultText(
                    text: 'اضافة مشترك',
                    color: ColorsManager.secondaryColor,
                    fontSize: isMobile() ? 20.sp : dimension.reduce20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                isMobile()
                    ? const SizedBox.shrink()
                    : const Divider(
                        color: ColorsManager.secondaryColor,
                        thickness: 2,
                        height: 0,
                      ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: isMobile()
                  ? 600.h
                  : dimension.height350 + dimension.height320,
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Padding(
                  padding: isMobile()
                      ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h)
                      : EdgeInsets.symmetric(
                          horizontal: dimension.width10,
                          vertical: dimension.height15,
                        ),
                  child: isMobile()
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'اسم المشترك',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  controller: subscriberNameController,
                                  color: Colors.white,
                                  hintText: "اسم المشترك",
                                ),
                              ],
                            ),
                            verticalSpace(5.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'رقم الهاتف',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  inputFormatters: [NumberInputFormatter()],
                                  controller: phoneNumberController,
                                  color: Colors.white,
                                  hintText: 'رقم الهاتف',
                                ),
                              ],
                            ),
                            verticalSpace(5.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'ايميل',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  controller: emailController,
                                  color: Colors.white,
                                  hintText: 'ايميل',
                                  validator: (enteredEmail) {
                                    if (!AppRegex.isEmailValid(enteredEmail)) {
                                      return "ايميل غير صحيح";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            verticalSpace(10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'الرقم القومى',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  inputFormatters: [NumberInputFormatter()],
                                  controller: NIDController,
                                  color: Colors.white,
                                  hintText: 'الرقم القومى',
                                ),
                              ],
                            ),
                            verticalSpace(5.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'العنوان',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  controller: addressController,
                                  color: Colors.white,
                                  hintText: "العنوان",
                                ),
                              ],
                            ),
                            verticalSpace(10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'التبعية',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  controller: relatedToController,
                                  color: Colors.white,
                                  hintText: "التبعية",
                                ),
                              ],
                            ),

                            verticalSpace(5.h),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'عرض',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  controller: offerController,
                                  color: Colors.white,
                                  hintText: "عرض",
                                ),
                              ],
                            ),
                            verticalSpace(5.h),
                            BlocConsumer<SubscribersCubit, SubscribersState>(
                              listener: (context, state) {
                                // TODO: implement listener
                                if (state is GetCollectorsEmailsSuccessState) {
                                  collectors = state.getListsResponse.result!;
                                  selectedCollector = collectors[0];
                                }
                              },
                              builder: (context, state) {
                                return buildDropdown(
                                  labelText: 'المحصل',
                                  itemList: collectors,
                                  selectedValue: selectedCollector,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCollector = value!;
                                    });
                                  },
                                  context: context,
                                );
                              },
                            ),
                            verticalSpace(5.h),
                            BlocConsumer<SubscribersCubit, SubscribersState>(
                              listener: (context, state) {
                                // TODO: implement listener
                                if (state is GetCompaniesListSuccessState) {
                                  companies = state.getListsResponse.result!;
                                  selectedCompany = companies[0];
                                  SubscribersCubit.get(context).getPlansList(
                                      companyName: {
                                        'companyName': companies[0]
                                      });
                                }
                              },
                              builder: (context, state) {
                                return buildDropdown(
                                  labelText: 'الشركة',
                                  itemList: companies,
                                  selectedValue: selectedCompany,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCompany = value!;
                                    });
                                  },
                                  context: context,
                                );
                              },
                            ),
                            verticalSpace(10.h),
                            BlocConsumer<SubscribersCubit, SubscribersState>(
                              listener: (context, state) {
                                // TODO: implement listener
                                if (state is GetPlansListSuccessState) {
                                  plans = state.getListsResponse.result!;
                                  selectedPlan =
                                      plans.isNotEmpty ? plans[0] : "";
                                }
                              },
                              builder: (context, state) {
                                return buildDropdown(
                                  labelText: 'الباقة',
                                  itemList: plans,
                                  selectedValue: selectedPlan,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPlan = value!;
                                    });
                                  },
                                  context: context,
                                );
                              },
                            ),
                            verticalSpace(10.h),
                            buildDropdown(
                              labelText: 'نوع الخط',
                              itemList: companies,
                              selectedValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                              context: context,
                            ),
                            verticalSpace(10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'الحساب',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.lightBlack,
                                ),
                                verticalSpace(dimension.height5),
                                DefaultTextFormField(
                                  inputFormatters: [NumberInputFormatter()],
                                  controller: amountController,
                                  color: Colors.white,
                                  hintText: "الحساب",
                                ),
                              ],
                            ),
                            verticalSpace(10.h),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'اسم المشترك',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        controller: subscriberNameController,
                                        color: Colors.white,
                                        hintText: "اسم المشترك",
                                      ),
                                    ],
                                  ),
                                ),
                                horizontalSpace(dimension.width10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'رقم الهاتف',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        inputFormatters: [
                                          NumberInputFormatter()
                                        ],
                                        controller: phoneNumberController,
                                        color: Colors.white,
                                        hintText: 'رقم الهاتف',
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 11) {
                                            return 'رقم الهاتف غير صحيح';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(dimension.height10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'الرقم القومى',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        inputFormatters: [
                                          NumberInputFormatter()
                                        ],
                                        controller: NIDController,
                                        color: Colors.white,
                                        hintText: 'الرقم القومى',
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 14) {
                                            return 'الرقم القومى غير صحيح';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                horizontalSpace(dimension.width10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'ايميل',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        controller: emailController,
                                        color: Colors.white,
                                        hintText: 'ايميل',
                                        validator: (enteredEmail) {
                                          if (!AppRegex.isEmailValid(
                                              enteredEmail)) {
                                            return "ايميل غير صحيح";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(dimension.height10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'العنوان',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        controller: addressController,
                                        color: Colors.white,
                                        hintText: "العنوان",
                                      ),
                                    ],
                                  ),
                                ),
                                horizontalSpace(dimension.width10),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'عرض',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        controller: offerController,
                                        color: Colors.white,
                                        hintText: "عرض",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(dimension.height10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'التبعية',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        controller: relatedToController,
                                        color: Colors.white,
                                        hintText: "التبعية",
                                      ),
                                    ],
                                  ),
                                ),
                                horizontalSpace(dimension.width10),
                                Expanded(
                                  child: BlocConsumer<SubscribersCubit,
                                      SubscribersState>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                      if (state
                                          is GetCollectorsEmailsSuccessState) {
                                        collectors =
                                            state.getListsResponse.result!;
                                        selectedCollector = collectors[0];
                                      }
                                    },
                                    builder: (context, state) {
                                      return buildDropdown(
                                        labelText: 'المحصل',
                                        itemList: collectors,
                                        selectedValue: selectedCollector,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedCollector = value!;
                                          });
                                        },
                                        context: context,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(dimension.height10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: BlocConsumer<SubscribersCubit,
                                      SubscribersState>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                      if (state
                                          is GetCompaniesListSuccessState) {
                                        companies =
                                            state.getListsResponse.result!;
                                        selectedCompany = companies[0];

                                        SubscribersCubit.get(context)
                                            .getPlansList(companyName: {
                                          'companyName': companies[0]
                                        });
                                      }
                                    },
                                    builder: (context, state) {
                                      return buildDropdown(
                                        labelText: 'الشركة',
                                        itemList: companies,
                                        selectedValue: selectedCompany,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedCompany = value!;
                                            SubscribersCubit.get(context)
                                                .getPlansList(companyName: {
                                              'companyName': selectedCompany
                                            });
                                          });
                                        },
                                        context: context,
                                      );
                                    },
                                  ),
                                ),
                                horizontalSpace(dimension.width10),
                                Expanded(
                                  child: BlocConsumer<SubscribersCubit,
                                      SubscribersState>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                      if (state is GetPlansListSuccessState) {
                                        plans = state.getListsResponse.result!;
                                        selectedPlan =
                                            plans.isNotEmpty ? plans[0] : "";
                                      }
                                    },
                                    builder: (context, state) {
                                      return buildDropdown(
                                        labelText: 'الباقة',
                                        itemList: plans,
                                        selectedValue: selectedPlan,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPlan = value!;
                                          });
                                        },
                                        context: context,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(dimension.height10),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: buildDropdown(
                                    labelText: 'نوع الخط',
                                    itemList: simType,
                                    selectedValue: selectedSimType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedSimType = value!;
                                      });
                                    },
                                    context: context,
                                  ),
                                ),
                                horizontalSpace(dimension.width10),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'الحساب',
                                        fontSize: dimension.reduce20,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsManager.lightBlack,
                                      ),
                                      verticalSpace(dimension.height5),
                                      DefaultTextFormField(
                                        inputFormatters: [
                                          NumberInputFormatter()
                                        ],
                                        controller: amountController,
                                        color: Colors.white,
                                        hintText: "الحساب",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(dimension.height15),
                          ],
                        ),
                ),
              ),
            ),
            Padding(
              padding: isMobile()
                  ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h)
                  : EdgeInsets.symmetric(
                      horizontal: dimension.width10,
                      vertical: dimension.height15,
                    ),
              child: Row(
                children: [
                  DefaultButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: dimension.width15,
                      vertical: dimension.height15,
                    ),
                    onPressed: () {
                      SubscribersCubit.get(context).addNewSubscriber(
                        addNewSubscriberRequestBody:
                            AddNewSubscriberRequestBody(
                          name: subscriberNameController.text,
                          phone: phoneNumberController.text,
                          nID: NIDController.text,
                          companyName: selectedCompany,
                          planName: selectedPlan,
                          address: addressController.text,
                          relatedTo: relatedToController.text,
                          lineType: selectedSimType,
                          balance: int.parse(amountController.text),
                          collectorEmail: selectedCollector,
                          email: emailController.text,
                          offer: offerController.text,
                        ),
                      );
                    },
                    child: DefaultText(
                      text: 'حفظ',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  horizontalSpace(dimension.width10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: DefaultText(
                      text: 'الغاء',
                      color: ColorsManager.lightGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const BlocListenerForSubscribersCubit()
          ],
        ),
      ),
    );
  }
}
