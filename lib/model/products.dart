import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:shopping/model/serializers.dart';

part 'products.g.dart';

abstract class Products implements Built<Products, ProductsBuilder> {
  Products._();
  factory Products([void Function(ProductsBuilder) updates]) = _$Products;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Products.serializer, this)
        as Map<String, dynamic>;
  }

  static Products fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Products.serializer, json)!;
  }

  static Serializer<Products> get serializer => _$productsSerializer;

  String? get name;
  String? get price;
  bool? get fav;
  bool? get cart;
  int? get id;
  String? get path;
  String? get unit;
}
