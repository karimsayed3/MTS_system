import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../helpers/dimensions.dart';
import 'default_text.dart';

class DefaultDateFormField extends StatefulWidget {
  DefaultDateFormField(
      {super.key,
      required this.controller,
      this.title,
      this.titleColor,
      this.color,
      this.onTap,
      this.enabled = true,
      this.validator,
      this.width,
      this.value,
      this.borderRadius,
      this.onFieldSubmitted});

  final TextEditingController controller;
  Function()? onTap;
  dynamic title;
  dynamic enabled;
  double? width;
  String? value;
  Color? titleColor;
  BorderRadius? borderRadius;
  dynamic color;
  Function(String)? onFieldSubmitted;
  dynamic validator;

  @override
  State<DefaultDateFormField> createState() => _DefaultDateFormFieldState();
}

class _DefaultDateFormFieldState extends State<DefaultDateFormField> {
  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    DateTime now = DateTime.now();
    String formattedDate = intl.DateFormat('yyyy-MM-dd').format(now);
    return SizedBox(
      width: widget.width ?? dimension.width200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != ""
              ? DefaultText(
                  text: widget.title,
                  color: widget.titleColor ?? Colors.black,
                )
              : const SizedBox.shrink(),
          widget.title != ""
              ? SizedBox(
                  height: dimension.height5,
                )
              : const SizedBox.shrink(),
          SizedBox(
            // height: MediaQuery.of(context).size.height * .05,
            width: dimension.width300,
            child: TextFormField(
              controller: widget.controller,
              enabled: widget.enabled ?? true,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
              ),
              decoration: InputDecoration(
                  hintText: widget.value ?? formattedDate,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black,),
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(5),
                  ),
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Almarai',
                  ),
                  filled: true,
                  fillColor: widget.color ?? Colors.white,
                  suffixIcon: const Icon(Icons.calendar_month)),
              onTap: widget.onTap ??
                  () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2050),
                    );
                    if (pickedDate != null) {
                      widget.controller.text =
                          intl.DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {});
                    }
                  },
              validator: widget.validator ??
                  (String? value) {
                    if (value!.length == 0) {
                      return "يجب ادخال تاريخ";
                    }
                    return null;
                  },
              onFieldSubmitted: widget.onFieldSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
