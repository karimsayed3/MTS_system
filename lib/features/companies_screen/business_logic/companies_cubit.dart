import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/companies_screen/business_logic/companies_state.dart';
import 'package:system/features/companies_screen/data/models/add_company_request_body.dart';
import 'package:system/features/companies_screen/data/models/deduct_plan_from_subscribers_request_body.dart';
import 'package:system/features/companies_screen/data/models/delete_company_request_body.dart';
import 'package:system/features/companies_screen/data/models/get_companies_request_body.dart';
import 'package:system/features/companies_screen/data/models/get_companies_response.dart';
import 'package:system/features/companies_screen/data/models/undo_plan_from_subscribers_request_body.dart';
import 'package:system/features/companies_screen/data/models/update_company_request_body.dart';
import 'package:system/features/companies_screen/data/repository/companies_repo.dart';


class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesRepo repository;
  CompaniesCubit(this.repository) : super(const CompaniesState.initial());

  static CompaniesCubit get(context) => BlocProvider.of(context);

  List<CompanyData> companiesData = [];

  TextEditingController searchController = TextEditingController();


  Future<void> getCompanies({required GetCompaniesRequestBody getCompaniesRequestBody}) async {
    emit(const CompaniesState.getCompaniesLoadingState());
    final response = await repository.getCompanies(getCompaniesRequestBody);
    response.when(
      success: (data) {
        emit(CompaniesState.getCompaniesSuccessState(data));
      },
      failure: (errorHandler) {
        emit(CompaniesState.getCompaniesErrorState(error: errorHandler.apiErrorModel.message ?? ""));
      }
    );
  }

  Future<void> addCompany({required  AddCompanyRequestBody addCompanyRequestBody}) async {
    emit(const CompaniesState.addCompanyLoadingState());
    final response = await repository.addCompany(addCompanyRequestBody);
    response.when(
      success: (data) {
        emit(CompaniesState.addCompanySuccessState(data));
      },
      failure: (errorHandler) {
        emit(CompaniesState.addCompanyErrorState(error: errorHandler.apiErrorModel.message ?? ""));
      }
    );
  }

  Future<void> updateCompany({required UpdateCompanyRequestBody updateCompanyRequestBody}) async {
    emit(const CompaniesState.updateCompanyLoadingState());
    final response = await repository.updateCompany(updateCompanyRequestBody);
    response.when(
        success: (data) {
          emit(CompaniesState.updateCompanySuccessState(data));
        },
        failure: (errorHandler) {
          emit(CompaniesState.updateCompanyErrorState(
              error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  Future<void> deleteCompany({required DeleteCompanyRequestBody deleteCompanyRequestBody}) async {
    emit(const CompaniesState.deleteCompanyLoadingState());
    final response = await repository.deleteCompany(deleteCompanyRequestBody);
    response.when(
        success: (data) {
          emit(CompaniesState.deleteCompanySuccessState(data));
        },
        failure: (errorHandler) {
          emit(CompaniesState.deleteCompanyErrorState(
              error: errorHandler.apiErrorModel.message ?? ""
          ));
        }
    );
  }

  Future<void> deductPlanFromSubscribers({required DeductPlanFromSubscribersRequestBody deductPlanFromSubscribersRequestBody}) async {
    emit(const CompaniesState.deductPlanFromSubscribersLoadingState());
    final response = await repository.deductPlanFromSubscribers(deductPlanFromSubscribersRequestBody);
    response.when(
        success: (data) {
          emit(CompaniesState.deductPlanFromSubscribersSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CompaniesState.deductPlanFromSubscribersErrorState(
              error: errorHandler.apiErrorModel.message ?? ""
          ));
        }
    );
  }

  Future<void> undoPlanFromSubscribers({required UndoPlanFromSubscribersRequestBody undoPlanFromSubscribersRequestBody}) async {
    emit(const CompaniesState.undoPlanFromSubscribersLoadingState());
    final response = await repository.undoPlanFromSubscribers(undoPlanFromSubscribersRequestBody);
    response.when(
        success: (data) {
          emit(CompaniesState.undoPlanFromSubscribersSuccessState(data));
        },
        failure: (errorHandler) {
          emit(CompaniesState.undoPlanFromSubscribersErrorState(
              error: errorHandler.apiErrorModel.message ?? ""
          ));
        }
    );
  }

}
