import 'package:e_commerce_app/data/dataSource/remote/helper/api.dart';
import 'package:e_commerce_app/data/dataSource/remote/services/constant.dart';
class GetAllCategories{
  Future<List<dynamic>> getAllCategories()async{
  List<dynamic>data=await Api().get(url: '$baseUrl/products/categories');
   return data ;
  }
}