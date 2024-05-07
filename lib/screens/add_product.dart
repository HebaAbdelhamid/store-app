import 'package:e_commerce_app/data/dataSource/remote/services/add_product.dart';
import 'package:e_commerce_app/widgets/bottom_navigation_bar.dart';
import 'package:e_commerce_app/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return AddProducts_State();
  }

}
class AddProducts_State extends State<AddProducts>{
  TextEditingController _titleEditingController=TextEditingController();
  TextEditingController _priceEditingController=TextEditingController();
  TextEditingController _descriptionEditingController=TextEditingController();
  TextEditingController _imageEditingController=TextEditingController();
  TextEditingController _categoryEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update product item ',style: TextStyle(
            color: Colors.black
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 80),
        child: SingleChildScrollView(
          child:Column(
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
              SizedBox(height:17,),
              CustomTextFormField(titleEditingController: _categoryEditingController,title: 'category',onsaved: (value){
                _categoryEditingController.text=value!;
              },),
              SizedBox(height:25,),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff26a0d9) ,
                  borderRadius: BorderRadius.circular(7),),
                child: MaterialButton(onPressed: ()async{
AddProduct().addProduct(title: _titleEditingController.text,
    price: _priceEditingController.text,
    description: _descriptionEditingController.text,
    image: _imageEditingController.text,
    category: _categoryEditingController.text);
                  Navigator.pushNamed(context, BottonNavigation.id);



                },child: Text('Add',style: TextStyle(color:Color(0xffffffff) ),),
                ),
              ),


            ],
          ) ,
        ),
      ),

    );
  }

}