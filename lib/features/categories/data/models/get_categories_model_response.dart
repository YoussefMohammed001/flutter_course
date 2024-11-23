import 'package:json_annotation/json_annotation.dart';
part 'get_categories_model_response.g.dart';

@JsonSerializable()
class GetCategoriesModelResponse {
  final String message;
  final bool status;
  @JsonKey(name: "data")
  final CategoriesDataModel categoriesDataModel;

  GetCategoriesModelResponse(
      this.message, this.status, this.categoriesDataModel);

  factory GetCategoriesModelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesModelResponseFromJson(json);
}
@JsonSerializable()
class CategoriesDataModel {
  @JsonKey(name: "data")
  final List<CategoriesModelList> categories;

  CategoriesDataModel(this.categories);

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataModelFromJson(json);
}
@JsonSerializable()
class CategoriesModelList {
  @JsonKey(name: "id")
  final int categoryId;

  @JsonKey(name: "name")
  final String categoryName;

  @JsonKey(name: "image")
  final String categoryImage;

  CategoriesModelList(this.categoryId, this.categoryName, this.categoryImage);
  factory CategoriesModelList.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelListFromJson(json);
}
