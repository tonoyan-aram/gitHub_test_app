// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageModel<T> _$PageModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageModel<T>(
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
      count: json['total_count'] as int? ?? 0,
      success: json['incomplete_results'] as bool,
    );

Map<String, dynamic> _$PageModelToJson<T>(
  PageModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'incomplete_results': instance.success,
      'items': instance.items.map(toJsonT).toList(),
      'total_count': instance.count,
    };
