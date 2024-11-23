import 'package:flutter_course/core/network/api_service.dart';
import 'package:flutter_course/core/network/endpoints.dart';
import 'package:flutter_course/features/categories/data/models/get_categories_model_response.dart';

class CategoriesApi{

 Future<GetCategoriesModelResponse> getCategories() async {
   final response = await ApiService.getData(endPoint: ApiConstants.categories);
   return GetCategoriesModelResponse.fromJson(response);
 }

}