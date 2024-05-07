
import 'package:e_commerce_app/data/dataSource/local/product.dart';
import 'package:e_commerce_app/data/dataSource/remote/services/update.dart';
import 'package:e_commerce_app/data/model/productModel.dart';
import 'package:e_commerce_app/widgets/bottom_navigation_bar.dart';
import 'package:e_commerce_app/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UpdateProduct extends StatefulWidget{
  static String id='UpdateProduct';
  @override
  State<StatefulWidget> createState() {
    return UdateProduct_State();
  }

}
class UdateProduct_State extends State<UpdateProduct>{
  TextEditingController _titleEditingController=TextEditingController();
   TextEditingController _priceEditingController=TextEditingController();
   TextEditingController _descriptionEditingController=TextEditingController();
   TextEditingController _imageEditingController=TextEditingController();


  ProductModel?product ;
  @override

  void didChangeDependencies() {
    super.didChangeDependencies();
    product=ModalRoute.of(context)!.settings.arguments as ProductModel ;


  }
  @override
  Widget build(BuildContext context) {
    final Box<Product> _products=Hive.box('product');

    // ProductModel product= ModalRoute.of(context)!.settings.arguments as ProductModel ;

   return Scaffold(
     appBar: AppBar(
       // actions: [
       //   Padding(
       //     padding: const EdgeInsets.only(right: 18.0),
       //     child: Icon(Icons.add_shopping_cart,color: Colors.black,),
       //   )
       // ],
       title: Text('Update product item ',style: TextStyle(
           color: Colors.black
       ),),
       centerTitle: true,
       elevation: 0,
       backgroundColor: Colors.white,
     ),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 80),
         child: Column(
           children: [
             CustomTextFormField(titleEditingController: _titleEditingController,title: 'title',onsaved: (value){
               _titleEditingController.text=value!;

             },),
             SizedBox(height:17,),
             CustomTextFormField(titleEditingController: _priceEditingController,title: 'price',onsaved: (value){
               _priceEditingController.text=value!;

             },),
             SizedBox(height:17,),
             CustomTextFormField(titleEditingController: _descriptionEditingController,title: 'description',onsaved: (value){
               _descriptionEditingController.text=value!;
             },),
             SizedBox(height:17,),
             CustomTextFormField(titleEditingController: _imageEditingController,title: 'image',onsaved: (value){
               _imageEditingController.text=value!;
             },),
             SizedBox(height:25,),
             // MaterialButton(onPressed: (){
             //   print(product!.title);
             //   print(product!.description);
             //
             //
             // },
             // child: Text('tttttt'),),
             Container(
               width: double.infinity,
               height: 50,
               decoration: BoxDecoration(
                 color: Color(0xff26a0d9) ,
                 borderRadius: BorderRadius.circular(7),),
               child: MaterialButton(onPressed: ()async{
                 product!.title=_titleEditingController.text.isEmpty?product!.title:_titleEditingController.text;
                 product!.price=_priceEditingController.text!.isEmpty?product!.price:_priceEditingController.text;
                 product!.description=_descriptionEditingController.text!.isEmpty?product!.description:_descriptionEditingController.text;
                 product!.image=_imageEditingController.text!.isEmpty?product!.image:_imageEditingController.text;
                await Update().update(id: product!.id,
                     title:  product!.title,
                     price:product!.price.toString(),
                     description:  product!.description,
                     image:  product!.description,
                     category: product!.category);
                Navigator.pushNamed(context, BottonNavigation.id);
                Product _product =Product(image: product!.image,
                title: product!.title,
                price: product!.price);
                _products.add(_product);


 print('===${product!.category}');
 print(product!.title);

               },child: Text('update',style: TextStyle(color:Color(0xffffffff) ),),
               ),
             ),

           ],
         ),
       ),
     ),
   );
  }

}

