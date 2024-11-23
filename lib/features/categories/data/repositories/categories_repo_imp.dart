import 'package:flutter_course/features/categories/data/data_sources/categories_api.dart';
import 'package:flutter_course/features/categories/data/mapper.dart';
import 'package:flutter_course/features/categories/domain/entities/categories_entity.dart';
import 'package:flutter_course/features/categories/domain/repositories/categories_base_repo.dart';

class CategoriesRepoImp extends CategoriesBaseRepo {
  final CategoriesApi categoriesApi;
  CategoriesRepoImp(this.categoriesApi);

  @override
  Future<List<CategoriesEntity>> getCategories() async {
    final response = await categoriesApi.getCategories();
    List<CategoriesEntity> categoryEntity = Mapper.mapToEntity(response.categoriesDataModel.categories);
    return categoryEntity;
  }

}