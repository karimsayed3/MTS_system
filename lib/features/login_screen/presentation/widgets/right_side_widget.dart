import 'package:flutter/material.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:
            Image.asset("assets/images/login_picture.png", fit: BoxFit.fill));
  }
}
