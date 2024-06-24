
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system/core/networking/default_api_response.dart';
import 'package:system/features/companies_screen/data/models/get_companies_response.dart';

part 'companies_state.freezed.dart';
@freezed
class CompaniesState<T> with _$CompaniesState<T> {
  const factory CompaniesState.initial() = _Initial;
  const factory CompaniesState.getCompaniesLoadingState() = GetCompaniesLoadingState;
  const factory CompaniesState.getCompaniesSuccessState(GetCompaniesResponse data) = GetCompaniesSuccessState<T>;
  const factory CompaniesState.getCompaniesErrorState({required String error}) = GetCompaniesErrorState;

  const factory CompaniesState.updateCompanyLoadingState() = UpdateCompanyLoadingState;
  const factory CompaniesState.updateCompanySuccessState(DefaultApiResponse data) = UpdateCompanySuccessState<T>;
  const factory CompaniesState.updateCompanyErrorState({required String error}) = UpdateCompanyErrorState;

  const factory CompaniesState.addCompanyLoadingState() = AddCompanyLoadingState;
  const factory CompaniesState.addCompanySuccessState(DefaultApiResponse data) = AddCompanySuccessState<T>;
  const factory CompaniesState.addCompanyErrorState({required String error}) = AddCompanyErrorState;

  const factory CompaniesState.deleteCompanyLoadingState() = DeleteCompanyLoadingState;
  const factory CompaniesState.deleteCompanySuccessState(DefaultApiResponse data) = DeleteCompanySuccessState<T>;
  const factory CompaniesState.deleteCompanyErrorState({required String error}) = DeleteCompanyErrorState;

  const factory CompaniesState.deductPlanFromSubscribersLoadingState() = DeductPlanFromSubscribersLoadingState;
  const factory CompaniesState.deductPlanFromSubscribersSuccessState(DefaultApiResponse data) = DeductPlanFromSubscribersSuccessState<T>;
  const factory CompaniesState.deductPlanFromSubscribersErrorState({required String error}) = DeductPlanFromSubscribersErrorState;

  const factory CompaniesState.undoPlanFromSubscribersLoadingState() = UndoPlanFromSubscribersLoadingState;
  const factory CompaniesState.undoPlanFromSubscribersSuccessState(DefaultApiResponse data) = UndoPlanFromSubscribersSuccessState<T>;
  const factory CompaniesState.undoPlanFromSubscribersErrorState({required String error}) = UndoPlanFromSubscribersErrorState;

  const factory CompaniesState.changeListData() = ChangeListData;

}




