import 'package:flutter/material.dart';
import 'package:system/core/widgets/default_text_form_field.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key, required this.width, required this.searchController});
final double width;
final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DefaultTextFormField(
        controller: searchController,
        color: Colors.white,
        hintText: "بحث",
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }
}
