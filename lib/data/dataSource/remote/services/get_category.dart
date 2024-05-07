import 'package:e_commerce_app/data/dataSource/remote/helper/api.dart';
import 'package:e_commerce_app/data/dataSource/remote/services/constant.dart';
import 'package:e_commerce_app/data/model/productModel.dart';
class GetCategory{
  Future<List<ProductModel>>getCategory ({required String categoryName})async{
   List<dynamic> data=await Api().get(url: '$baseUrl/products/category/$categoryName');
  List<ProductModel>productList=[];
  for(int i=0;i<data.length;i++){
    productList.add(ProductModel.fromJson(data[i]));
  }
    return productList;
  }
}