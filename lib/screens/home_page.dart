import 'package:e_commerce_app/data/dataSource/remote/services/get_all_product.dart';
import 'package:e_commerce_app/data/model/productModel.dart';
import 'package:e_commerce_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  static String id='HomePage';

  @override
  State<StatefulWidget> createState() {
    return HomePage_State();
  }

}
class HomePage_State extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       actions: [
         Padding(
           padding: const EdgeInsets.only(right: 18.0),
           child: Icon(Icons.add_shopping_cart,color: Colors.black,),
         )
       ],
       title: Text('New Trend',style: TextStyle(
         color: Colors.black
       ),),
       centerTitle: true,
       elevation: 0,
       backgroundColor: Colors.white,
     ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 70),
       child: FutureBuilder<List<ProductModel>>(
         future: GetAllProduct().getAllProduct(),
         builder: (context, snapshot) {
           if(snapshot.hasData){
             List<ProductModel>data=snapshot.data!;
             print(data);
           return GridView.builder(
             itemCount: data.length,
               clipBehavior: Clip.none,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 3/2,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 100
               ), itemBuilder: (context,index)=>CustomCard(data[index]));}
           else{
             print('ttttt${GetAllProduct().getAllProduct().toString()}');
            return Center(child: CircularProgressIndicator());
           }
         }),

       ),


   );
  }

}

