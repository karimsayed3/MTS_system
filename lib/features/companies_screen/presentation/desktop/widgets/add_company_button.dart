import 'package:flutter/material.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/add_company_widget.dart';

class AddCompanyButton extends StatelessWidget {
  const AddCompanyButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var dimension = Dimensions(context);
    return DefaultButton(
      color: const Color(0xffebf5f6),
      padding: EdgeInsets.symmetric(
        horizontal: dimension.width15,
        vertical: dimension.height10,
      ),
      onPressed: () {
        showDataAlert(
          context: context,
          child: AddCompanyWidget(
            onPressed: onPressed,
          ),
        );
      },
      child: DefaultText(
        text: "+ اضافة شركة",
        color: const Color(0xFF007C92),
        fontSize: dimension.reduce20,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
