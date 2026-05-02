import 'package:beautisry_merchant/domain/models/enums/worker_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../employee_profile/employee_profile.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
abstract class Employee with _$Employee {
  const factory Employee({
    String? id,
    String? name,
    String? ar_name,
    String? en_name,
    String? phoneNumber,
    String? merchantId,
    String? imageUrl,
    String? imageId,
    String? branchId,
    bool? acceptNotifications,
    WorkerType? workerType,
    bool? isFirstTimeRegister,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}

extension EmployeeExtension on Employee {
  EmployeeProfile toEmployeeProfile() {
    return EmployeeProfile(
      id: id,
      name: name,
      image: imageUrl,
      workerType: workerType,
    );
  }
}
