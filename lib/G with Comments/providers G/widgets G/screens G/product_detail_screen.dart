// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import '../providers/products.dart';

// class ProductDetailScreen extends StatelessWidget {
//   // final String title;
//   // ProductDetailScreen({@required this.title});

//   static const routeName = '/product-detail';

//   @override
//   Widget build(BuildContext context) {
//     //we extract the id
//     final productId = ModalRoute.of(context).settings.arguments as String;
//     //I want to get all my product data for the above productId
//     final loadedProduct = Provider.of<Products>(
//       context,
//       //this flag will not let this widget to rebuild when we don't need to listen
//       listen: false,
//     ).findById(productId);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(loadedProduct.title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 300,
//               width: double.infinity,
//               child: Image.network(
//                 loadedProduct.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               '\$${loadedProduct.price}',
//               style: TextStyle(color: Colors.grey, fontSize: 20),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               width: double.infinity,
//               child: Text(
//                 '${loadedProduct.description}',
//                 textAlign: TextAlign.center,
//                 softWrap: true,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
