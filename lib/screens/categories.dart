import 'package:e_commerce_app/data/dataSource/remote/services/get_all_categories.dart';
import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/widgets/tab_content.dart';
import 'package:e_commerce_app/widgets/tab_title.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget{
  static String id='categories';
  @override
  State<StatefulWidget> createState() {
    return Categories_State();
  }

}
class Categories_State extends State<Categories>with TickerProviderStateMixin{
  late TabController _tabController;


  List pages=[HomePage(),Categories(),HomePage(),Categories()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 4,vsync: this);
    categories();

    }

Future categories()async{
    await GetAllCategories().getAllCategories();
    print(await GetAllCategories().getAllCategories());
}

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        bottom: TabBar(
isScrollable: true,
indicatorColor: Color(0xff26a0d9),
          controller:_tabController ,
          labelColor: Colors.black,
          tabs: [
            TabTitle(title:0),
            TabTitle(title: 1),
            TabTitle(title: 2),
            TabTitle(title: 3)

          ],),


        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(Icons.add_shopping_cart,color: Colors.black,),
          )
        ],
        title: Text('Categories',style: TextStyle(
            color: Colors.black
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      // bottomNavigationBar: BottonNavigation(),
      body: TabBarView(controller: _tabController,
        children: [
TabContet(categoryName: 'electronics'),
          TabContet(categoryName: 'jewelery'),
          TabContet(categoryName: "men's clothing"),
          TabContet(categoryName: "women's clothing"),
        ],
      )



          );

  }


}

