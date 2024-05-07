import 'package:e_commerce_app/data/dataSource/remote/helper/api.dart';
import 'package:e_commerce_app/data/dataSource/remote/services/constant.dart';
import 'package:e_commerce_app/data/model/productModel.dart';

class AddProduct{
  Future<ProductModel>addProduct({required String title,required String price,required String description,required String image,required String category})async{
    Map<String,dynamic>data=await Api().post(url: '$baseUrl/products',body: {
'title':title,
'price':price,
'description': description,
'image': image,
'category': category
});

    return ProductModel.fromJson(data);
  }
}