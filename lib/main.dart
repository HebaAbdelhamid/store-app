import 'package:e_commerce_app/data/dataSource/local/product.dart';
import 'package:e_commerce_app/screens/categories.dart';
import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/screens/update_product.dart';
import 'package:e_commerce_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Product>('product');
  Hive.registerAdapter<Product>(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'HomePage':(context)=>HomePage(),
        'categories':(context)=>Categories(),
        'BottonNavigation':(context)=>BottonNavigation(),
        'UpdateProduct':(context)=>UpdateProduct(),

      },
      initialRoute:BottonNavigation.id,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,


    );
  }
}

