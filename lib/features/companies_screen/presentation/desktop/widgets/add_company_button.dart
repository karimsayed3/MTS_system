import '';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/core/helpers/dimensions.dart';
import 'package:system/core/widgets/default_button.dart';
import 'package:system/core/widgets/default_text.dart';
import 'package:system/core/widgets/show_alert_dialog.dart';
import 'package:system/features/companies_screen/business_logic/companies_cubit.dart';
import 'package:system/features/companies_screen/presentation/desktop/widgets/add_company_widget.dart';

class AddCompanyButton extends StatelessWidget {
  const AddCompanyButton({
    super.key,
  });

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
          child: BlocProvider.value(
            value: getIt<CompaniesCubit>(),
            child: AddCompanyWidget(),
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
