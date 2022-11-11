import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/core/services/api_services.dart';
import 'package:shopping/data/api_services_imp.dart';
import 'package:shopping/model/products.dart';
import 'package:shopping/provider/provider_utils.dart';
import 'package:shopping/views/cart_screen.dart';
import 'package:shopping/views/fav_screen.dart';
import 'package:shopping/views/widgets/mixins.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AppProviderMixin<HomePage>, StateMixin {
  late SnackBar snackBar;
  List<String> productName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Chery',
    'Peach',
    'Mixed Fruit Basket',
  ];
  List<String> productUnit = [
    'KG',
    'Dozen',
    'KG',
    'Dozen',
    'KG',
    'KG',
    'KG',
  ];
  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70];
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
    'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612',
    'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
    'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612',
    'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612',
  ];
  @override
  update() async {
    setLoading();

    APIServices imp = new APIServicesImp();
    QuerySnapshot<Map<String, dynamic>> collectionProducts =
        await FirebaseFirestore.instance.collection('products').get();
    if (collectionProducts.docs.isEmpty) {
      for (int i = 0; i < productName.length; i++) {
        imp.addproduct(
            name: productName[i],
            price: productPrice[i].toString(),
            id: i,
            path: productImage[i],
            unit: productUnit[i].toString());
      }
    }
    await context.appViewModel.getproducts();

    resetLoading();
  }

  void initState() {
    // TODO: implement initState
    update();
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuiltList<Products>? products = context.appViewModel.state.products;
    APIServices imp = new APIServicesImp();
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits Shopping'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavScreen()));
            },
            icon: Icon(
              Icons.favorite,
            ),
          ),
          SizedBox(width: 20.0)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                height: 100,
                                width: 100,
                                image: NetworkImage(
                                    products[index].path.toString()),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].name.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      products[index].unit.toString() +
                                          " " +
                                          r"Rs." +
                                          products[index].price.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                if (products[index].fav ==
                                                    false) {
                                                  imp.likeprod(
                                                      products[index].id ?? 0);
                                                  snackBar = SnackBar(
                                                    backgroundColor:
                                                        Colors.green,
                                                    content: Text(
                                                        '${products[index].name} is added to wishlist'),
                                                    duration:
                                                        Duration(seconds: 1),
                                                  );
                                                  await context.appViewModel
                                                      .getproducts();
                                                  setState(() {});
                                                  await context.appViewModel
                                                      .getproducts();
                                                  setState(() {});
                                                } else {
                                                  imp.unlikeprod(
                                                      products[index].id ?? 0);
                                                  snackBar = SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                        '${products[index].name} removed form wishlist'),
                                                    duration:
                                                        Duration(seconds: 1),
                                                  );
                                                  await context.appViewModel
                                                      .getproducts();
                                                  setState(() {});
                                                  await context.appViewModel
                                                      .getproducts();
                                                  setState(() {});
                                                }

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              icon: products[index].fav == true
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )
                                                  : Icon(
                                                      Icons.favorite_border)),
                                          InkWell(
                                            onTap: () {
                                              if (products[index].cart ==
                                                  false) {
                                                imp.updatecart(
                                                    products[index].id ?? 0);
                                                snackBar = SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                      '${products[index].name} is added to cart'),
                                                  duration:
                                                      Duration(seconds: 1),
                                                );
                                              } else {
                                                snackBar = SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      '${products[index].name} is already in the cart'),
                                                  duration:
                                                      Duration(seconds: 1),
                                                );
                                              }

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Center(
                                                child: Text(
                                                  'Add to cart',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
