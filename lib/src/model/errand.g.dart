// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Errand _$$_ErrandFromJson(Map<String, dynamic> json) => _$_Errand(
      id: json['id'] as String?,
      creatorId: json['creatorId'] as String,
      performerId: json['performerId'] as String?,
      contact: json['contact'] as String,
      description: json['description'] as String,
      isActive: json['isActive'] as bool,
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$$_ErrandToJson(_$_Errand instance) => <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'performerId': instance.performerId,
      'contact': instance.contact,
      'description': instance.description,
      'isActive': instance.isActive,
      'isComplete': instance.isComplete,
    };
