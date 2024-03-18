import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/features/main_screen/presentation/desktop/widgets/card_for_total_invoice.dart';

class MainScreenDesktop extends StatefulWidget {
  const MainScreenDesktop({super.key});

  @override
  State<MainScreenDesktop> createState() => _MainScreenDesktopState();
}

class _MainScreenDesktopState extends State<MainScreenDesktop> {
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dimension.width10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: "الوصول السريع:",
                    color: ColorsManager.darkBlack,
                    fontSize: dimension.width10,
                    fontWeight: FontWeight.w500,
                  ),
                  verticalSpace(dimension.height5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: dimension.width230,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(dimension.reduce15),
                            )),
                            child: Padding(
                              padding: EdgeInsets.only(
                                // left: dimension.width50,
                                right: dimension.width10,
                                top: dimension.height10,
                                bottom: dimension.height10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: dimension.width10,
                                        vertical: dimension.height10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsManager.lightBlueColor),
                                    child: SvgPicture.asset(
                                      'assets/icons/wallet-add.svg',
                                    ),
                                  ),
                                  horizontalSpace(dimension.width10),
                                  DefaultText(
                                    text: 'اضافة فاتورة',
                                    color: ColorsManager.darkBlack,
                                    fontSize: dimension.width15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(dimension.width15),
                        SizedBox(
                          width: dimension.width230,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(dimension.reduce15),
                            )),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: dimension.width10,
                                top: dimension.height10,
                                bottom: dimension.height10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: dimension.width10,
                                        vertical: dimension.height10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsManager.lightBlueColor),
                                    child: SvgPicture.asset(
                                      'assets/icons/receipt-text.svg',
                                    ),
                                  ),
                                  horizontalSpace(dimension.width10),
                                  DefaultText(
                                    text: 'ايصال سداد فاتورة',
                                    color: ColorsManager.darkBlack,
                                    fontSize: dimension.width15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(dimension.width15),
                        SizedBox(
                          width: dimension.width230,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(dimension.reduce15),
                            )),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: dimension.width10,
                                top: dimension.height10,
                                bottom: dimension.height10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: dimension.width10,
                                        vertical: dimension.height10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsManager.lightBlueColor),
                                    child: SvgPicture.asset(
                                      'assets/icons/user-add.svg',
                                    ),
                                  ),
                                  horizontalSpace(dimension.width10),
                                  DefaultText(
                                    text: 'اضافة مشترك',
                                    color: ColorsManager.darkBlack,
                                    fontSize: dimension.width15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(dimension.width15),
                        SizedBox(
                          width: dimension.width230,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(dimension.reduce15),
                            )),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: dimension.width10,
                                top: dimension.height10,
                                bottom: dimension.height10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: dimension.width10,
                                        vertical: dimension.height10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsManager.lightBlueColor),
                                    child: SvgPicture.asset(
                                      'assets/icons/user-add.svg',
                                    ),
                                  ),
                                  horizontalSpace(dimension.width10),
                                  DefaultText(
                                    text: 'اضافة محصل',
                                    color: ColorsManager.darkBlack,
                                    fontSize: dimension.width15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(dimension.height10),
                  DefaultText(
                    text: "احدث العمليات:",
                    color: ColorsManager.darkBlack,
                    fontSize: dimension.width10,
                    fontWeight: FontWeight.w500,
                  ),
                  verticalSpace(dimension.height5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
