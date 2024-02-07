import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system/core/helpers/spacing.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/button_with_text_and_image.dart';
import 'package:system/core/widgets/custom_search_widget.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/header_label_with_image_mobile.dart';
import 'package:system/core/widgets/header_widget.dart';
import 'package:system/features/companies_screen/presentation/mobile/widgets/companies_header_widget_mobile.dart';

class CompaniesScreenMobile extends StatefulWidget {
  const CompaniesScreenMobile({super.key});

  @override
  State<CompaniesScreenMobile> createState() => _CompaniesScreenMobileState();
}

class _CompaniesScreenMobileState extends State<CompaniesScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManager.lighterGray,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/vodafone-logo.png'),
                              fit: BoxFit.contain,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        horizontalSpace(10.w),
                        DefaultText(
                          text: 'الشركات',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    ButtonWithTextAndImageWidget(
                      onPressed: () {},
                      color: const Color(0xffebf5f6),
                      text: "+ اضافة شركة",
                      fontSize: 16.sp,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      // image: "assets/images/plus.png",
                    ),
                  ],
                ),
              ),
              Container(
                // height: 80.h,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                // color: Colors.blueAccent,
                child: CustomSearchWidget(
                  width: double.infinity,
                  searchController: TextEditingController(),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const CompaniesHeaderWidgetMobile(),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
                              // height: 70.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorsManager.lightGray,
                                  )
                                )
                              ),
                              // color: Colors.red,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180.w,
                                    child: DefaultText(
                                      text: 'شركة فودافون كفرالشيخ',
                                      fontSize: 16.sp,
                                      fontFamily: 'din',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 120.w,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                              vertical: 5.h),
                                          decoration: BoxDecoration(
                                              color:const Color(0xffebf5f6),
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Center(
                                            child: DefaultText(
                                              text: '20',
                                              color: ColorsManager.darkBlack,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 50.w,
                                    child: InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset('assets/icons/more.svg')),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
