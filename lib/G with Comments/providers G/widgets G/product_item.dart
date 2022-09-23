// import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/screens/product_detail_screen.dart';
// import 'package:provider/provider.dart';

// import '../providers/cart.dart';
// import '../providers/product.dart';

// class ProductItem extends StatelessWidget {
//   //we need to accept a few properties to be able to display them
//   // final String id;
//   // final String title;
//   // final String imageUrl;
//   // final double price;

//   // // to be able to get values for the above properties we need the constractor
//   // ProductItem(
//   //   this.id,
//   //   this.imageUrl,
//   //   this.title,
//   //   this.price,
//   // );

//   @override
//   Widget build(BuildContext context) {
//     final product = Provider.of<Product>(context, listen: false);
//     final cart = Provider.of<Cart>(context, listen: false);
//     //ClipRRect to clip the corners of the GridTile
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: GridTile(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
//                 arguments: product.id);
//             // Navigator.of(context).push(
//             //   MaterialPageRoute(
//             //     builder: (ctx) => ProductDetailScreen(
//             //       title: title,
//             //     ),
//             //   ),
//             // );
//           },
//           child: Image.network(product.imageUrl, fit: BoxFit.cover),
//         ),
//         footer: GridTileBar(
//           backgroundColor: Colors.black54,
//           //we are using the cosumer here since the icon button is the only thing that updates
//           leading: Consumer<Product>(
//             builder: (
//               ctx,
//               product,
//               child,
//             ) =>
//                 IconButton(
//               icon: Icon(
//                 product.isFavorite ? Icons.favorite : Icons.favorite_border,
//               ),
//               color: Theme.of(context).colorScheme.secondary,
//               onPressed: () {
//                 product.toggleFavoriteStatus();
//               },
//             ),
//           ),
//           title: Text(
//             product.title,
//             textAlign: TextAlign.center,
//             textScaleFactor: 0.6,
//           ),
//           trailing: IconButton(
//             onPressed: () {
//               Scaffold.of(context).hideCurrentSnackBar();
//               cart.addItem(product.id, product.price, product.title);
//               //we want to implement an info pop up that will indicate that we have added a product
//               //in our cart, we are establishing a connection to the nearest scaffold widget
//               // ignore: deprecated_member_use
//               Scaffold.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     'Added item to cart',
//                     //textAlign: TextAlign.center,
//                   ),
//                   duration: Duration(seconds: 2),
//                   action: SnackBarAction(
//                     label: 'Undo',
//                     onPressed: () {
//                       cart.removeSingleItem(product.id);
//                     },
//                   ),
//                 ),
//               );
//             },
//             icon: Icon(Icons.shopping_cart),
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//         ),
//         header: Text(product.price.toString()),
//       ),
//     );
//   }
// }
