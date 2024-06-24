import 'package:flutter/material.dart';

class SearchInnerWidget extends StatelessWidget {
  const SearchInnerWidget({super.key, required this.hintText, required this.textEditingController});
  final  TextEditingController textEditingController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 4,
        right: 8,
        left: 8,
      ),
      child: TextFormField(
        expands: true,
        maxLines: null,
        controller:
        textEditingController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
          const EdgeInsets
              .symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          hintText:hintText,
          hintStyle: const TextStyle(
            fontSize: 12,fontFamily: 'Almarai',),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(
                8),
          ),
        ),
      ),
    );
  }
}