import 'package:flutter_course/features/categories/domain/entities/categories_entity.dart';
import 'package:flutter_course/features/categories/domain/repositories/categories_base_repo.dart';

class CategoriesUseCase {
  final CategoriesBaseRepo categoriesBaseRepo;
  CategoriesUseCase(this.categoriesBaseRepo);

  Future<List<CategoriesEntity>> execute(){
    return  categoriesBaseRepo.getCategories();
  }

}