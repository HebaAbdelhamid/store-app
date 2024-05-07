import 'package:e_commerce_app/data/dataSource/remote/services/get_all_categories.dart';
import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  int  title;

  TabTitle({
    required this.title
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetAllCategories().getAllCategories(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List lista_=snapshot.data!;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${lista_[title].toString().trim().substring(0,1).toUpperCase()}'),
                Text('${lista_[title].toString().trim().substring(1)}'),
              ],
            );
          }else
            return Text(' ');

        });
  }
}