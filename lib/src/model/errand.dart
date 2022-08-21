import 'package:freezed_annotation/freezed_annotation.dart';

part 'errand.freezed.dart';
part 'errand.g.dart';

@freezed
class Errand with _$Errand {
  const factory Errand({
    String? id,
    required String creatorId,
    String? performerId,
    required String contact,
    required String description,
    required bool isActive,
    required bool isComplete,
  }) = _Errand;

  factory Errand.fromJson(Map<String, dynamic> json) => _$ErrandFromJson(json);

  factory Errand.empty() => const _Errand(
        creatorId: '',
        contact: '',
        description: '',
        isActive: false,
        isComplete: false,
      );
}
