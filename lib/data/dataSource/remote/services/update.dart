import 'package:e_commerce_app/data/dataSource/remote/helper/api.dart';
import 'package:e_commerce_app/data/dataSource/remote/services/constant.dart';
import 'package:e_commerce_app/data/model/productModel.dart';

class Update{
  Future<ProductModel>update({required int id,required String title, required String price,required String description,required String image,required String category,})async{
   Map<String,dynamic>data=await Api().put(url: '$baseUrl/products/$id',body: {'title': title,
    'price': price,
    'description': description,
    'image':image,
    'category': category});
   print(data);
   return ProductModel.fromJson(data);
  }
}