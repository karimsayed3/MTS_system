import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system/core/helpers/app_regex.dart';
import 'package:system/core/helpers/cache_helper.dart';
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
import 'package:system/features/subscribers_screen/data/models/update_subscriber_request_body.dart';

class UpdateSubscriberWidget extends StatefulWidget {
  const UpdateSubscriberWidget(
      {super.key,
      required this.onPressed,
      required this.name,
      required this.phoneNumber,
      required this.relatedTo,
      required this.companyName,
      required this.planName,
      required this.lineType, required this.NID, required this.address});

  final Function() onPressed;

  final String name;
  final String phoneNumber;
  final String relatedTo;
  final String companyName;
  final String planName;
  final String lineType;
  final String NID;
  final String address;

  @override
  State<UpdateSubscriberWidget> createState() => _UpdateSubscriberWidgetState();
}

class _UpdateSubscriberWidgetState extends State<UpdateSubscriberWidget> {
  TextEditingController subscriberNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController NIDController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
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
    subscriberNameController.text = widget.name;
    phoneNumberController.text = widget.phoneNumber;
    relatedToController.text = widget.relatedTo;
    selectedSimType = widget.lineType;
    selectedCompany = widget.companyName;
    NIDController.text = widget.NID;
    addressController.text = widget.address;
    // selectedPlan = widget.planName;
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
                    text: 'تعديل مشترك',
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
              // height: isMobile()
              //     ? 600.h
              //     : dimension.height350 + dimension.height320,
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
                            verticalSpace(10.h),
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'الرقم القومى',
                                        fontSize: 20.sp,
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
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? verticalSpace(5.h)
                                : const SizedBox.shrink(),
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  )
                                : const SizedBox.shrink(),
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? verticalSpace(10.h)
                                : const SizedBox.shrink(),
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
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? BlocConsumer<SubscribersCubit,
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
                                  )
                                : const SizedBox.shrink(),
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? verticalSpace(10.h)
                                : const SizedBox.shrink(),
                            BlocConsumer<SubscribersCubit, SubscribersState>(
                              listener: (context, state) {
                                // TODO: implement listener
                                if (state is GetCompaniesListSuccessState) {
                                  companies = state.getListsResponse.result!;
                                  selectedCompany = companies.contains(widget.companyName)? widget.companyName : companies[0];
                                  SubscribersCubit.get(context).getPlansList(
                                      companyName: {
                                        'companyName': selectedCompany
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
                                      SubscribersCubit.get(context).getPlansList(
                                          companyName: {
                                            'companyName': selectedCompany
                                          });
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
                                  selectedPlan = plans.isNotEmpty ? plans.contains(widget.planName)? widget.planName : plans[0] : "";

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
                              itemList: simType,
                              selectedValue: selectedSimType,
                              onChanged: (value) {
                                setState(() {
                                  selectedSimType = value!;
                                });
                              },
                              context: context,
                            ),
                            // verticalSpace(10.h),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(dimension.height10),
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            CacheHelper.getdata(key: "accountType") == "ادمن"
                                ? verticalSpace(dimension.height10)
                                : const SizedBox.shrink(),
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
                                CacheHelper.getdata(key: "accountType") == "ادمن"
                                    ? Expanded(
                                        child: BlocConsumer<SubscribersCubit,
                                            SubscribersState>(
                                          listener: (context, state) {
                                            // TODO: implement listener
                                            if (state
                                                is GetCollectorsEmailsSuccessState) {
                                              collectors = state
                                                  .getListsResponse.result!;
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
                                      )
                                    : const SizedBox.shrink(),
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
                                        companies = state.getListsResponse.result!;
                                        selectedCompany = companies.contains(widget.companyName)? widget.companyName : companies[0];

                                        SubscribersCubit.get(context)
                                            .getPlansList(companyName: {
                                          'companyName': selectedCompany
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
                                          selectedPlan = plans.isNotEmpty ? plans.contains(widget.planName)? widget.planName : plans[0] : "";
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
                                //  Expanded(
                                //   flex: 1,
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       DefaultText(
                                //         text: 'الحساب',
                                //         fontSize: dimension.reduce20,
                                //         fontWeight: FontWeight.w400,
                                //         color: ColorsManager.lightBlack,
                                //       ),
                                //       verticalSpace(dimension.height5),
                                //       DefaultTextFormField(
                                //         controller: amountController,
                                //         color: Colors.white,
                                //         hintText: "الحساب",
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                            // verticalSpace(dimension.height15),
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
                    padding: isMobile()
                        ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h)
                        : EdgeInsets.symmetric(
                            horizontal: dimension.width15,
                            vertical: dimension.height15,
                          ),
                    onPressed: () {
                      SubscribersCubit.get(context).updateSubscriber(
                        updateSubscriberRequestBody:
                            UpdateSubscriberRequestBody(
                          phoneNo: phoneNumberController.text,
                          oldPhone: widget.phoneNumber,
                          name: subscriberNameController.text,
                          relatedTo: relatedToController.text,
                          address: addressController.text,
                          nID: NIDController.text,
                          lineType: selectedSimType,
                          companyName: selectedCompany,
                          planName: selectedPlan,
                          collectorEmail: selectedCollector,
                        ),
                      );
                    },
                    child: DefaultText(
                      text: 'تعديل',
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
          ],
        ),
      ),
    );
  }
}
