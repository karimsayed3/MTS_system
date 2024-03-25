
import 'package:json_annotation/json_annotation.dart';
part 'get_logged_operations_response.g.dart';
@JsonSerializable()
class GetLoggedOperationsResponse {
  List<LoggedOperation>? result;

  GetLoggedOperationsResponse({this.result});
  factory GetLoggedOperationsResponse.fromJson(Map<String, dynamic> json) => _$GetLoggedOperationsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetLoggedOperationsResponseToJson(this);
}
@JsonSerializable()
class LoggedOperation {
  String? phoneNo;
  String? planName;
  String? subscriberName;
  String? relatedTo;
  String? userName;
  int? balanceBeforeOperation;
  int? addedAmount;
  String? operationType;
  String? operationDate;
  String? collectType;

  LoggedOperation(
      {this.phoneNo,
        this.planName,
        this.subscriberName,
        this.relatedTo,
        this.userName,
        this.balanceBeforeOperation,
        this.addedAmount,
        this.operationType,
        this.operationDate,
        this.collectType});

  factory LoggedOperation.fromJson(Map<String, dynamic> json) => _$LoggedOperationFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedOperationToJson(this);

}
