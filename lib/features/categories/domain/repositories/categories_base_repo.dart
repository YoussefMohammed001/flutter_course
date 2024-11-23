import 'package:flutter_course/features/categories/domain/entities/categories_entity.dart';

abstract class CategoriesBaseRepo {
  Future<List<CategoriesEntity>> getCategories();

}