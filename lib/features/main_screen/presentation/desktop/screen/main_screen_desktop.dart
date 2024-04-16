import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_cubit.dart';
import 'package:system/features/history_operations_screen/business_logic/history_operations_state.dart';
import 'package:system/features/main_screen/presentation/desktop/widgets/card_for_total_invoice.dart';

import '../../../../history_operations_screen/data/models/get_logged_operations_request_body.dart';
import '../../../../history_operations_screen/presentation/desktop/widgets/bloc_listener_for_history_operations_cubit.dart';
import '../../../../history_operations_screen/presentation/desktop/widgets/history_operation_card.dart';
import '../../../../history_operations_screen/presentation/desktop/widgets/history_operations_header_widget.dart';
import '../widgets/card_for_short_cuts.dart';
import '../widgets/title_widget.dart';

class MainScreenDesktop extends StatefulWidget {
  const MainScreenDesktop({super.key});

  @override
  State<MainScreenDesktop> createState() => _MainScreenDesktopState();
}

class _MainScreenDesktopState extends State<MainScreenDesktop> {

  @override
  void initState() {
    // TODO: implement initState
    HistoryOperationsCubit.get(context).loggedOperations = [];
    HistoryOperationsCubit.get(context).getLoggedOperations(
        getLoggedOperationsRequestBody: GetLoggedOperationsRequestBody());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Container(
      // width: double.infinity,
      height: double.infinity,
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimension.width30, vertical: dimension.height10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// cards of total invoices
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CardForTotalInvoice(
                      infoText: 'EGP 5,209',
                      titleText: 'اجمالي مبلغ الفواتير المضافة',
                    ),
                    horizontalSpace(dimension.width15),
                    const CardForTotalInvoice(
                      infoText: '1234',
                      titleText: "عدد الفواتير المضافة",
                    ),
                    horizontalSpace(dimension.width15),
                    const CardForTotalInvoice(
                      infoText: '45157',
                      titleText: 'مشتركين تم اضافتهم',
                    ),
                    horizontalSpace(dimension.width15),
                    const CardForTotalInvoice(
                      infoText: '1247474',
                      titleText: 'محصلين تم اضافتهم',
                    ),
                  ],
                ),
              ),
              verticalSpace(dimension.height10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .6,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: dimension.width10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(
                        title: "الوصول السريع:",
                      ),
                      // CardForShortCuts(
                      //   iconPath: 'assets/icons/wallet-add.svg',
                      //   title: 'اضافة رصيد',
                      //   onTap: () {},
                      // ),
                      verticalSpace(dimension.height5),
                      Row(
                        children: [
                          CardForShortCuts(
                            iconPath: 'assets/icons/wallet-add.svg',
                            title: 'اضافة رصيد',
                            onTap: () {},
                          ),
                          horizontalSpace(dimension.width15),
                          CardForShortCuts(
                            iconPath: 'assets/icons/receipt-text.svg',
                            title: 'ايصال سداد فاتورة',
                            onTap: () {},
                          ),
                          horizontalSpace(dimension.width15),
                          CardForShortCuts(
                            iconPath: 'assets/icons/user-add.svg',
                            title: 'اضافة مشترك',
                            onTap: () {},
                          ),
                          horizontalSpace(dimension.width15),
                          CardForShortCuts(
                            iconPath: 'assets/icons/user-add.svg',
                            title: 'اضافة محصل',
                            onTap: () {},
                          ),
                        ],
                      ),
                      verticalSpace(dimension.height10),
                      const TitleWidget(
                        title: "احدث العمليات:",
                      ),
                      verticalSpace(dimension.height5),
                      const HistoryOperationsHeaderWidget(),
                      BlocBuilder<HistoryOperationsCubit,
                          HistoryOperationsState>(
                        builder: (context, state) {
                          return Expanded(
                              child: ListView.builder(
                            itemBuilder: (context, index) {
                              return HistoryOperationCard(
                                loggedOperation:
                                    HistoryOperationsCubit.get(context)
                                        .loggedOperations[index],
                              );
                              // return SizedBox.shrink();
                            },
                            itemCount: HistoryOperationsCubit.get(context)
                                        .loggedOperations
                                        .length >
                                    10
                                ? 10
                                : HistoryOperationsCubit.get(context)
                                    .loggedOperations
                                    .length,
                          ));
                        },
                      ),
                      BlocListenerForHistoryOperationsCubit(
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
