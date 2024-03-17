import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:system/core/helpers/cache_helper.dart';
import 'package:system/core/helpers/extensions.dart';
import 'package:system/core/networking/tokenDecode.dart';
import 'package:system/core/routing/routers.dart';
import 'package:system/core/theming/colors.dart';
import 'package:system/core/theming/styles.dart';
import 'package:system/core/widgets/custom_navigation_bar_widget.dart';
import 'package:system/features/login_screen/business_logic/login_cubit.dart';
import 'package:system/features/login_screen/business_logic/login_state.dart';
import 'package:system/features/login_screen/data/models/login_response.dart';

class LoginBlocListenerDesktop extends StatelessWidget {
  const LoginBlocListenerDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.secondaryColor,
                      ),
                    ));
          },
          success: (loginResponse) async {
            Navigator.pop(context);
            debugPrint(loginResponse.accessToken);
            TokenDecode decodedToken = TokenDecode.fromJson(
                JwtDecoder.decode(loginResponse.accessToken!));
            print(CacheHelper.getdata(key: 'token'));
            await CacheHelper.saveData(
                    key: 'token', value: loginResponse.accessToken)
                .then((value) {
              print(CacheHelper.getdata(key: 'token'));
              CacheHelper.saveData(
                      key: 'userName', value: decodedToken.username)
                  .then((value) {
                CacheHelper.saveData(key: "userID", value: decodedToken.userID)
                    .then((value) {
                  CacheHelper.saveData(
                          key: "accountType", value: decodedToken.accountType)
                      .then((value) {
                    navigateToPage(Routes.homeDesktopScreen);
                  });
                });
              });
            });
            // context.pushNamedAndRemoveUntil(Routes.homeDesktopScreen, (route) => false);
          },
          error: (error) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  content: Text(
                    error,
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'حسناً',
                        style: TextStyles.font14BlueSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
