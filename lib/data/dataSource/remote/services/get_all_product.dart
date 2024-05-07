import 'package:e_commerce_app/data/dataSource/remote/helper/api.dart';
import 'package:e_commerce_app/data/dataSource/remote/services/constant.dart';
import 'package:e_commerce_app/data/model/productModel.dart';
class GetAllProduct{
  Future<List<ProductModel>>getAllProduct()async{
 List<dynamic> data=await Api().get(url: '$baseUrl/products');
  List<ProductModel> productList=[];
  for(int i=0;i<data.length;i++){
    productList.add(ProductModel.fromJson(data[i]));
  }
    return productList;
}
}