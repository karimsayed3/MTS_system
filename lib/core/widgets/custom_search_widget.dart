import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/widgets/default_text_form_field.dart';

class CustomSearchWidget extends StatelessWidget {
  CustomSearchWidget(
      {super.key,
      required this.width,
      required this.searchController,
      this.onChange,this.onTap,
      this.hintText,
      this.inputFormatters});

  final double width;
  final TextEditingController searchController;
  final Function(String)? onChange;
  Function()? onTap;
  String? hintText;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DefaultTextFormField(
        inputFormatters: inputFormatters ?? [],
        controller: searchController,
        color: Colors.white,
        hintText: hintText ?? "بحث",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: InkWell(
          onTap: onTap,
          child: SvgPicture.asset('assets/icons/filter.svg',color: ColorsManager.lightGray,fit: BoxFit.scaleDown,),
        ),
        onChange: onChange,
      ),
    );
  }
}
