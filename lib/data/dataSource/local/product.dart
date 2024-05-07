import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class Product{
  @HiveField(0)
  String ?image;
  @HiveField(1)
  String ?title;
  @HiveField(2)
  dynamic ?price;
  Product({ this.image, this.title, this.price});
}