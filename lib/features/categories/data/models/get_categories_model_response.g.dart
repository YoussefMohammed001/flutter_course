// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesModelResponse _$GetCategoriesModelResponseFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesModelResponse(
      json['message'] as String,
      json['status'] as bool,
      CategoriesDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCategoriesModelResponseToJson(
        GetCategoriesModelResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.categoriesDataModel,
    };

CategoriesDataModel _$CategoriesDataModelFromJson(Map<String, dynamic> json) =>
    CategoriesDataModel(
      (json['data'] as List<dynamic>)
          .map((e) => CategoriesModelList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDataModelToJson(
        CategoriesDataModel instance) =>
    <String, dynamic>{
      'data': instance.categories,
    };

CategoriesModelList _$CategoriesModelListFromJson(Map<String, dynamic> json) =>
    CategoriesModelList(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$CategoriesModelListToJson(
        CategoriesModelList instance) =>
    <String, dynamic>{
      'id': instance.categoryId,
      'name': instance.categoryName,
      'image': instance.categoryImage,
    };
