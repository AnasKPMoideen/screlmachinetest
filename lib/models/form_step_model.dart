import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_step_model.freezed.dart';

enum StepStatus { completed, pending }

@freezed
class FormStepModel with _$FormStepModel {
  const factory FormStepModel({
    required String title,
    required String label,
    @Default(StepStatus.pending) StepStatus status,
  }) = _FormStepModel;
}
