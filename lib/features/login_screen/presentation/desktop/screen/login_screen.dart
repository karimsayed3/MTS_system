import 'package:flutter/material.dart';
import 'package:system/features/login_screen/presentation/desktop/widgets/right_side_widget.dart';

import '../widgets/left_side_widget.dart';

class LoginScreenDesktop extends StatelessWidget {
  const LoginScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 3,child: RightSideWidget(),),
            Expanded(flex: 2,child: LeftSideWidget(),),
          ],
        ),
      ),
    );
  }
}
