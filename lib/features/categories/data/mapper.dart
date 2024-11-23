import 'package:flutter_course/features/categories/data/models/get_categories_model_response.dart';
import 'package:flutter_course/features/categories/domain/entities/categories_entity.dart';

class Mapper {
  static List<CategoriesEntity> mapToEntity(List<CategoriesModelList> data) {
    return data
        .map((e) => CategoriesEntity(
            id: e.categoryId, name: e.categoryName, image: e.categoryImage))
        .toList();
  }
}
