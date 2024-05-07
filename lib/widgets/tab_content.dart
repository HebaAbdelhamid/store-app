import 'package:e_commerce_app/data/dataSource/remote/services/get_category.dart';
import 'package:e_commerce_app/data/model/productModel.dart';
import 'package:e_commerce_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class TabContet extends StatelessWidget{

  String categoryName;
  TabContet({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future:GetCategory().getCategory(categoryName: '${categoryName}') ,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<ProductModel>_data=snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 70),
              child: GridView.builder(
                  itemCount: _data.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3/2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100
                  ),
                  itemBuilder: (context,index)=>CustomCard(_data[index])),
            );
          }
          else{
            // print('ttttt${GetAllProduct().getAllProduct().toString()}');
            return Center(child: CircularProgressIndicator());
          }
        });

  }

}
