import 'package:e_commerce_app/screens/add_product.dart';
import 'package:e_commerce_app/screens/categories.dart';
import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/screens/last_update_products.dart';
import 'package:flutter/material.dart';

class BottonNavigation extends StatefulWidget{
  static String id='BottonNavigation';
  @override
  State<StatefulWidget> createState() {
    return _BottonNavigationState();
  }

}

class _BottonNavigationState extends State<BottonNavigation> {
  List pages=[HomePage(),Categories(),AddProducts(),LastUpdateProducts()];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
       unselectedItemColor: Colors.grey,
       selectedItemColor: Color(0xff26a0d9),
       type: BottomNavigationBarType.fixed,
       currentIndex: currentIndex,
       onTap: (index){
setState(() {

});
         currentIndex=index;

       },
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
         BottomNavigationBarItem(icon: Icon(Icons.category),label: 'categories'),
         BottomNavigationBarItem(icon: Icon(Icons.add),label: 'add'),
         BottomNavigationBarItem(icon: Icon(Icons.edit),label: 'las edited'),


       ],
     ),body: pages[currentIndex],

   );
  }
}