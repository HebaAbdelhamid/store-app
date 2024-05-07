import 'package:e_commerce_app/data/dataSource/local/product.dart';
import 'package:e_commerce_app/widgets/custom_update_product.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class LastUpdateProducts extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return LastUpdateProducts_State();
  }

}
class LastUpdateProducts_State extends State<LastUpdateProducts>{
  final Box<Product> _products=Hive.box('product');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Color(0xff26a0d9),
              onPressed: (){
            _products.clear();
          }, icon: Icon(Icons.clear_all))
        ],
        title: Text('Last update Products',style: TextStyle(
            color: Colors.black
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 70),
        child:  ValueListenableBuilder <Box<Product>> (
          valueListenable: _products.listenable(),
          builder: (context, value, child) {
            return UpdateProduct(products: _products);
          }),


        )

      );



  }

}

