import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:shopping/core/services/api_services.dart';
import 'package:shopping/data/api_services_imp.dart';
import 'package:shopping/model/products.dart';
import 'package:shopping/provider/provider_utils.dart';
import 'package:shopping/views/widgets/mixins.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen>
    with AppProviderMixin<FavScreen>, StateMixin {
  Future<void> updatecart() async {
    await context.appViewModel.getproducts();
  }

  @override
  void initState() {
    updatecart();
    refresh();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar;
    APIServices imp = new APIServicesImp();
    BuiltList<Products>? products = context.appViewModel.state.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits Shopping'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return (products[index].fav == true)
                      ? Card(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                products[index]
                                                    .price
                                                    .toString(),
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
                                                TextButton(
                                                    onPressed: () async {
                                                      imp.unlikeprod(
                                                          products[index].id ??
                                                              0);
                                                      snackBar = SnackBar(
                                                        backgroundColor:
                                                            Colors.red,
                                                        content: Text(
                                                            '${products[index].name} removed form wishlist'),
                                                        duration: Duration(
                                                            seconds: 1),
                                                      );
                                                      await context.appViewModel
                                                          .getproducts();
                                                      setState(() {});
                                                      await context.appViewModel
                                                          .getproducts();
                                                      setState(() {});

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                    child: Text('Remove')),
                                                InkWell(
                                                  onTap: () {
                                                    if (products[index].cart ==
                                                        false) {
                                                      imp.updatecart(
                                                          products[index].id ??
                                                              0);
                                                      snackBar = SnackBar(
                                                        backgroundColor:
                                                            Colors.green,
                                                        content: Text(
                                                            '${products[index].name} is added to cart'),
                                                        duration: Duration(
                                                            seconds: 1),
                                                      );
                                                    } else {
                                                      snackBar = SnackBar(
                                                        backgroundColor:
                                                            Colors.red,
                                                        content: Text(
                                                            '${products[index].name} is already in the cart'),
                                                        duration: Duration(
                                                            seconds: 1),
                                                      );
                                                    }

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: const Center(
                                                      child: Text(
                                                        'Add to cart',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
                        )
                      : Container();
                }),
          ),
        ],
      ),
    );
  }
}
