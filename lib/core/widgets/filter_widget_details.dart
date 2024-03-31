import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/helpers/dimensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/check_box_outline.dart';
import '../../../../../core/widgets/muilti_drop_down_button.dart';

class FilterWidgetDetails extends StatefulWidget {
  const FilterWidgetDetails({super.key, required this.visible, required this.child, required this.top, required this.right,});
  final bool visible ;
  final Widget child;
  final double top;
  final double right;
  @override
  State<FilterWidgetDetails> createState() => _FilterWidgetDetailsState();
}

class _FilterWidgetDetailsState extends State<FilterWidgetDetails> {


  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return Positioned(
      // top: dimension.height45,
      // right: dimension.width200,
      top: widget.top,
      right: widget.right,
      child: Visibility(
        visible: widget.visible,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: dimension.height10,
            horizontal: dimension.width10,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: widget.child
        ),
      ),
    );
  }
}
