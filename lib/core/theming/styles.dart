import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

class TextStyles {

  static TextStyle font24BlackBold = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  ); static TextStyle font20BlackMedium= const TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
static TextStyle font24SecondaryColor = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.secondaryColor,
  );

  static TextStyle font32BlueBold = const TextStyle(
    fontSize: 32 ,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryColor,
  );

  static TextStyle font32BlackBold = const TextStyle(
    fontSize: 32 ,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.darkBlack,
  );

  static TextStyle font13BlueSemiBold = const TextStyle(
    fontSize: 13 ,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primaryColor,
  );

  static TextStyle font13DarkBlueMedium = const TextStyle(
    fontSize: 13 ,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondaryColor,
  );

  static TextStyle font13DarkBlueRegular = const TextStyle(
    fontSize: 13 ,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondaryColor,
  );

  static TextStyle font24BlueBold = const TextStyle(
    fontSize: 24 ,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primaryColor,
  );

  static TextStyle font16WhiteSemiBold = const TextStyle(
    fontSize: 16 ,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font13GrayRegular = const TextStyle(
    fontSize: 13 ,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightGray,
  );

  static TextStyle font13BlueRegular = const TextStyle(
    fontSize: 13 ,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryColor,
  );

  static TextStyle font14GrayRegular = const TextStyle(
    fontSize: 14 ,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightGray,
  );

  static TextStyle font14LightGrayRegular = const TextStyle(
    fontSize: 14 ,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightGray,
  );

  static TextStyle font14DarkBlueMedium = const TextStyle(
    fontSize: 14 ,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondaryColor,
  );
  static TextStyle font16WhiteMedium = const TextStyle(
    fontSize: 16 ,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );

  static TextStyle font14BlueSemiBold = const TextStyle(
    fontSize: 14 ,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primaryColor,
  );

  static TextStyle font15DarkBlueMedium = const TextStyle(
    fontSize: 15 ,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondaryColor,
  );
}