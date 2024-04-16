import 'package:json_annotation/json_annotation.dart';

part 'get_logged_operations_request_body.g.dart';
@JsonSerializable()
class GetLoggedOperationsRequestBody {
  String? phone;
  String? relatedTo;
  String? operationDateFrom;
  String? operationDateTo;
  String? operationTypes;
  int? pageNumber;

  GetLoggedOperationsRequestBody(
      {this.phone,
        this.relatedTo,
        this.operationDateFrom,
        this.operationDateTo,
        this.pageNumber,
        this.operationTypes});

  factory GetLoggedOperationsRequestBody.fromJson(Map<String, dynamic> json) => _$GetLoggedOperationsRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GetLoggedOperationsRequestBodyToJson(this);
}
