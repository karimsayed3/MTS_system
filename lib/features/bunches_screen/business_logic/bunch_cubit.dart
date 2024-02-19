import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_request_body.dart';
import 'package:system/features/bunches_screen/data/models/get_plans_response.dart';
import '../data/models/add_plan_request_body.dart';
import '../data/models/delete_plan_request_body.dart';
import '../data/models/update_plan_request_body.dart';
import '../data/repository/bunch_repo.dart';
import 'bunch_state.dart';


class BunchCubit extends Cubit<BunchState> {
  BunchRepo repository;
  BunchCubit(this.repository) : super(const BunchState.initial());

  List<PlanData> plansData = [];

  TextEditingController searchController = TextEditingController();


  static BunchCubit get(context) => BlocProvider.of(context);

  Future<void> getPlans({required GetPlansRequestBody getPlansRequestBody}) async {
    emit(const BunchState.getPlansLoadingState());

    final response = await repository.getPlans(getPlansRequestBody);
    response.when(
        success: (data) {
          emit(BunchState.getPlansSuccessState(data));
        },
        failure: (errorHandler) {
          emit(BunchState.getPlansErrorState(error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  Future<void> updatePlan({required UpdatePlanRequestBody updatePlanRequestBody}) async {
    emit(const BunchState.updatePlanLoadingState());
    final response = await repository.updatePlan(updatePlanRequestBody);
    response.when(
        success: (data) {
          emit(BunchState.updatePlanSuccessState(data));
        },
        failure: (errorHandler) {
          emit(BunchState.updatePlanErrorState(error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  Future<void> deletePlan({required DeletePlanRequestBody deletePlanRequestBody}) async {
    emit(const BunchState.deletePlanLoadingState());
    final response = await repository.deletePlan(deletePlanRequestBody);
    response.when(
        success: (data) {
          emit(BunchState.deletePlanSuccessState(data));
        },
        failure: (errorHandler) {
          emit(BunchState.deletePlanErrorState(error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }

  Future<void> addPlan({required AddPlanRequestBody addPlanRequestBody}) async {
    emit(const BunchState.addPlanLoadingState());
    final response = await repository.addPlan(addPlanRequestBody);
    response.when(
        success: (data) {
          emit(BunchState.addPlanSuccessState(data));
        },
        failure: (errorHandler) {
          emit(BunchState.addPlanErrorState(error: errorHandler.apiErrorModel.message ?? ""));
        }
    );
  }


}
