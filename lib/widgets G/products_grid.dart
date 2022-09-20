import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/products.dart';

class productsGrid extends StatelessWidget {
  // const productsGrid({
  //   Key key,
  //   @required this.loadedProducts,
  // }) : super(key: key);

  final bool showFavs;
  productsGrid(this.showFavs);

  // final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
//we are using the provider instead of the getter above
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
//by adding the <Products> we are telling the provider that we want to establish a direct communication
//to the Provider instance of the Provider class

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      //in the ProductItem that gets three params we add the information from our loadedProducts
      //we add the provider so we can listen to each product individually
      //we are using this format(value) when we reuse an existing object
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //create: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].imageUrl,
            // products[i].title,
            // products[i].price,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
