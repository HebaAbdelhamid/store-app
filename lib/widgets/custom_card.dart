import 'package:e_commerce_app/data/model/productModel.dart';
import 'package:e_commerce_app/screens/update_product.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {


  CustomCard(this.product);
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return
      Stack(clipBehavior: Clip.none,
        children: [
          Container(
            decoration:  BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: .9,

                  )
                ]
            ),

            child: Card(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${product.title}',style: TextStyle(color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price}',style: TextStyle(color: Colors.grey),),
                        IconButton(onPressed: (){
                          Navigator.pushNamed(context, UpdateProduct.id,arguments: product);

                        }, icon: Icon(Icons.edit,size: 17,))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left:80,
              bottom: 90,
              child: Image.network('${product.image}',height: 90,width: 100,))
        ]
    );
  }
}