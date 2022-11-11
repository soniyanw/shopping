// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Products> _$productsSerializer = new _$ProductsSerializer();

class _$ProductsSerializer implements StructuredSerializer<Products> {
  @override
  final Iterable<Type> types = const [Products, _$Products];
  @override
  final String wireName = 'Products';

  @override
  Iterable<Object?> serialize(Serializers serializers, Products object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fav;
    if (value != null) {
      result
        ..add('fav')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cart;
    if (value != null) {
      result
        ..add('cart')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.path;
    if (value != null) {
      result
        ..add('path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.unit;
    if (value != null) {
      result
        ..add('unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Products deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fav':
          result.fav = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cart':
          result.cart = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Products extends Products {
  @override
  final String? name;
  @override
  final String? price;
  @override
  final bool? fav;
  @override
  final bool? cart;
  @override
  final int? id;
  @override
  final String? path;
  @override
  final String? unit;

  factory _$Products([void Function(ProductsBuilder)? updates]) =>
      (new ProductsBuilder()..update(updates))._build();

  _$Products._(
      {this.name,
      this.price,
      this.fav,
      this.cart,
      this.id,
      this.path,
      this.unit})
      : super._();

  @override
  Products rebuild(void Function(ProductsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsBuilder toBuilder() => new ProductsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Products &&
        name == other.name &&
        price == other.price &&
        fav == other.fav &&
        cart == other.cart &&
        id == other.id &&
        path == other.path &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, name.hashCode), price.hashCode),
                        fav.hashCode),
                    cart.hashCode),
                id.hashCode),
            path.hashCode),
        unit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Products')
          ..add('name', name)
          ..add('price', price)
          ..add('fav', fav)
          ..add('cart', cart)
          ..add('id', id)
          ..add('path', path)
          ..add('unit', unit))
        .toString();
  }
}

class ProductsBuilder implements Builder<Products, ProductsBuilder> {
  _$Products? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  bool? _fav;
  bool? get fav => _$this._fav;
  set fav(bool? fav) => _$this._fav = fav;

  bool? _cart;
  bool? get cart => _$this._cart;
  set cart(bool? cart) => _$this._cart = cart;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  ProductsBuilder();

  ProductsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _price = $v.price;
      _fav = $v.fav;
      _cart = $v.cart;
      _id = $v.id;
      _path = $v.path;
      _unit = $v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Products other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Products;
  }

  @override
  void update(void Function(ProductsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Products build() => _build();

  _$Products _build() {
    final _$result = _$v ??
        new _$Products._(
            name: name,
            price: price,
            fav: fav,
            cart: cart,
            id: id,
            path: path,
            unit: unit);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
