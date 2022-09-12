import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/edit_product_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/products.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //we add the provider and the create method where we instantiate the providers class
    //this is only for the widgets that are listening
    //A MultiProvider gives us the possibility of adding lists of providers
    //we are adding two providers in the entire widget tree that follows in the MaterialApp
    var EditProductScreen;
    return MultiProvider(
      //The first two are the recomended format for the route Notifier
      providers: [
        ChangeNotifierProvider(
          //for earlier than 4 versions of provider, create is builder
          //we are using this format when we are instantiating a new object from a class
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          //for earlier than 4 versions of provider, create is builder
          //we are using this format when we are instantiating a new object from a class
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider.value(
          //for earlier than 4 versions of provider, create is builder
          //we are using this format when we are instantiating a new object from a class
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.orange,
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductsScreen.routeName: (ctx) => EditProductsScreen(),
        },
      ),
    );
  }
}
