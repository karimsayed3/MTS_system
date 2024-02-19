import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system/features/login_screen/data/models/login_response.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(LoginResponse data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;
  const factory LoginState.obscureTextState() = ObscureTextState;
}
