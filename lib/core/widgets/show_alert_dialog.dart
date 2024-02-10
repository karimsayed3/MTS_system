import 'package:flutter/material.dart';

showDataAlert({required BuildContext context, required Widget child}) {
  showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            // surfaceTintColor: Color(0xff213555),
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: child,
          ),
        );
      });
}