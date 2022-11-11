import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/core/services/api_services.dart';
import 'package:shopping/model/products.dart';

class APIServicesImp implements APIServices {
  CollectionReference<Map<String, dynamic>> collectionProducts =
      FirebaseFirestore.instance.collection('products');
  @override
  void addproduct(
      {required String name,
      required String price,
      required int id,
      required String path,
      required String unit}) async {
    final products =
        await FirebaseFirestore.instance.collection('products').doc();
    Products newProduct = Products((b) => b
      ..name = name
      ..price = price
      ..id = id
      ..cart = false
      ..path = path
      ..unit = unit
      ..fav = false);
    products.set(newProduct.toJson());
  }

  Future<BuiltList<Products>> getprods() async {
    final QuerySnapshot<Map<String, dynamic>> _collectionRef =
        await collectionProducts.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot =
        _collectionRef.docs;
    List<Products> product_data = [];

    snapshot.forEach((element) {
      product_data.add(Products.fromJson(element.data()));
    });
    print("products");
    print(product_data);
    return product_data.toBuiltList();
  }

  Future<void> updatecart(int id) async {
    final collection = FirebaseFirestore.instance.collection('products');
    var newDocumentBody = {"cart": true};
    DocumentReference docRef;

    var response = await collection.where('id', isEqualTo: id).get();
    var batch = FirebaseFirestore.instance.batch();
    response.docs.forEach((doc) {
      docRef = collection.doc(doc.id);
      print(doc.id);
      batch.update(docRef, newDocumentBody);
    });
    batch.commit().then((a) {
      print('updated all documents inside Collection');
    });
  }

  Future<void> likeprod(int id) async {
    final collection = FirebaseFirestore.instance.collection('products');
    var newDocumentBody = {"fav": true};
    DocumentReference docRef;

    var response = await collection.where('id', isEqualTo: id).get();
    var batch = FirebaseFirestore.instance.batch();
    response.docs.forEach((doc) {
      docRef = collection.doc(doc.id);
      print(doc.id);
      batch.update(docRef, newDocumentBody);
    });
    batch.commit().then((a) {
      print('updated all documents inside Collection');
    });
  }

  Future<void> unlikeprod(int id) async {
    final collection = FirebaseFirestore.instance.collection('products');
    var newDocumentBody = {"fav": false};
    DocumentReference docRef;

    var response = await collection.where('id', isEqualTo: id).get();
    var batch = FirebaseFirestore.instance.batch();
    response.docs.forEach((doc) {
      docRef = collection.doc(doc.id);
      print(doc.id);
      batch.update(docRef, newDocumentBody);
    });
    batch.commit().then((a) {
      print('updated all documents inside Collection');
    });
  }
}
