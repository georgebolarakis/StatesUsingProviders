// // ignore_for_file: missing_required_param

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../screens/cart_screen.dart';
// import '../widgets/app_drawer.dart';
// import '../widgets/badge.dart';
// import '../providers/cart.dart';
// import '../widgets/products_grid.dart';


// enum FilterOptions {
//   Favorites,
//   All,
// }

// class ProductsOverviewScreen extends StatefulWidget {
//   @override
//   State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
// }

// class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
//   var _showOnlyFavorites = false;

//   @override
//   Widget build(BuildContext context) {
//     //we are getting the context of our products
//     // final productsContainer = Provider.of<Products>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'MyShop',
//         ),
//         actions: <Widget>[
//           //we add a pop out menu having three dots on the top right
//           PopupMenuButton(
//             onSelected: (FilterOptions selectedValue) {
//               setState(() {
//                 if (selectedValue == FilterOptions.Favorites) {
//                   _showOnlyFavorites = true;
//                   // productsContainer.showFavoritesOnly();
//                 } else {
//                   _showOnlyFavorites = false;
//                   // productsContainer.showAll();
//                 }
//                 print(selectedValue);
//               });
//             },
//             icon: Icon(Icons.more_vert),
//             itemBuilder: (_) => [
//               PopupMenuItem(
//                   child: Text('Only Favorites'),
//                   value: FilterOptions.Favorites),
//               PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
//             ],
//           ),
//           Consumer<Cart>(
//             builder: (_, cart, ch) => Badge(
//               child: ch,
//               value: cart.itemCount.toString(),
//             ),
//             child: IconButton(
//               icon: Icon(
//                 Icons.shopping_cart,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pushNamed(CartScreen.routeName);
//               },
//             ),
//           ),
//         ],
//       ),
//       drawer: AppDrawer(),
//       //the gridview.builder only renders items that are on the screen
//       body: productsGrid(_showOnlyFavorites),
//     );
//   }
// }
