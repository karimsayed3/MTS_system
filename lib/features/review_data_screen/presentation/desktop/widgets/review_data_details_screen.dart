import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/home_widget.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/add_collector_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_card.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_search_widget.dart';
import 'package:system/features/review_data_screen/business_logic/review_data_state.dart';
import 'package:system/features/review_data_screen/presentation/desktop/widgets/bloc_listener_for_review_data_cubit.dart';
import 'package:system/features/review_data_screen/presentation/desktop/widgets/review_data_header_widget.dart';
import 'package:system/features/review_data_screen/presentation/desktop/widgets/review_data_search_widget.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/button_with_text_and_image.dart';
import '../../../business_logic/review_data_cubit.dart';
import 'review_data_card.dart';

class ReviewDataScreenDetails extends StatefulWidget {
  ReviewDataScreenDetails({super.key});

  @override
  State<ReviewDataScreenDetails> createState() =>
      _ReviewDataScreenDetailsState();
}

class _ReviewDataScreenDetailsState extends State<ReviewDataScreenDetails> {
  TextEditingController searchController = TextEditingController();

  dynamic result;

  String filePath = "";

  @override
  void initState() {
    // TODO: implement initState
    ReviewDataCubit.get(context).reviewSubscriberData = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: 'مراجعة البيانات',
                fontSize: dimension.reduce20,
                fontWeight: FontWeight.w400,
              ),
              verticalSpace(dimension.height5),
              HomeWidget(
                horizontal: dimension.width10,
                vertical: dimension.height10,
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReviewDataSearchWidget(
                          searchController: searchController,
                        ),
                        ButtonWithTextAndImageWidget(
                          onPressed: () async {
                            // createExcelForActiveSubscribers(
                            //     data: SubscribersCubit.get(context).subscribers
                            // );
                            filePath = await selectFileFromDesktop();
                            print(filePath);

                            setState(() {});
                            // print(filePath);
                            // result = await pickFileFromWindows();
                            if (filePath.isNotEmpty) {
                              ReviewDataCubit.get(context)
                                  .reviewSubscribersPlans(
                                excel: File(filePath),
                              );
                            } else {}
                            // ReviewDataCubit.get(context).reviewSubscribersPlans(files: files);
                          },
                          color: const Color(0xffebf5f6),
                          image: 'assets/icons/excel.svg',
                          text: "رفع اكسيل",
                        ),
                        // DefaultButton(
                        //   color: const Color(0xffebf5f6),
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: dimension.width15,
                        //     vertical: dimension.height10,
                        //   ),
                        //   onPressed: () {
                        //     showDataAlert(
                        //         context: context,
                        //         child: AddCollectorWidget(
                        //           onPressed: () {},
                        //         ));
                        //   },
                        //   child: DefaultText(
                        //     text: "+ اضافة محصل",
                        //     color: const Color(0xFF007C92),
                        //     fontSize: dimension.reduce20,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        // ),
                      ],
                    ),
                    verticalSpace(dimension.height10),
                    const ReviewDataHeaderWidget(),
                    BlocBuilder<ReviewDataCubit, ReviewDataState>(
                      builder: (context, state) {
                        return Expanded(
                            child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ReviewDataCard(
                              onPressed: () {
                                ReviewDataCubit.get(context).deleteItem("phoneNo", ReviewDataCubit.get(context)
                                    .reviewSubscriberData[index].phoneNo);
                                setState(() {

                                });
                              },
                              reviewSubscriberData: ReviewDataCubit.get(context)
                                  .reviewSubscriberData[index],
                            );
                            // return SizedBox.shrink();
                          },
                          itemCount: ReviewDataCubit.get(context)
                              .reviewSubscriberData
                              .length,
                        ));
                      },
                    ),
                    const BlocListenerForReviewSubscribersCubit(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
