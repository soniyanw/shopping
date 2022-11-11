import 'package:built_collection/built_collection.dart';
import 'package:shopping/model/products.dart';

abstract class APIServices {
  void addproduct(
      {required String name,
      required String price,
      required int id,
      required String path,
      required String unit});
  Future<BuiltList<Products>> getprods();
  Future<void> updatecart(int id);
  Future<void> unlikeprod(int id);
  Future<void> likeprod(int id);
}
