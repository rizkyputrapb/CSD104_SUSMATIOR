// import 'package:flutter/material.dart';

// class GridViewEvidence extends StatelessWidget {
//   GridViewEvidence({
//     Key? key,
//     required this.countGrid,
//   }) : super(key: key);
//   int countGrid;
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       crossAxisCount: countGrid,
//       children: [
//         Card(
//           clipBehavior: Clip.antiAlias,
//           child: Stack(
//             children: [
//               // Image
//               Placeholder(),
//               Positioned(
//                 right: 5,
//                 top: 5,
//                 child: InkWell(
//                   onTap: () {},
//                   child: Icon(
//                     Icons.remove_circle,
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Card(
//           child: IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {},
//           ),
//         ),
//         Card(
//           child: IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {},
//           ),
//         ),
//       ],
//     );
//   }
// }
