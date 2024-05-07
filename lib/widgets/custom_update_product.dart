import 'package:e_commerce_app/data/dataSource/local/product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UpdateProduct extends StatelessWidget {
  const UpdateProduct({
    Key? key,
    required Box<Product> products,
  }) : _products = products, super(key: key);

  final Box<Product> _products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _products.length,
        clipBehavior: Clip.none,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 100
        ), itemBuilder: (context,index)=>
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${_products.getAt(index)!.title}',style: TextStyle(color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(r'$''${_products.getAt(index)!.price}',style: TextStyle(color: Colors.grey),),

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
                  child: Image.network('${_products.getAt(index)!.image}',height: 90,width: 100,))
            ]
        ));
  }
}