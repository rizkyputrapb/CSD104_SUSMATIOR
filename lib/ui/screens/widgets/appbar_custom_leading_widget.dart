// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:susmatior_app/constants/colors_constants.dart';
// import 'package:susmatior_app/constants/padding_constants.dart';
// import 'package:susmatior_app/constants/radius_constants.dart';

// class AppBarCustomLeading extends StatelessWidget
//     implements PreferredSizeWidget {
//   const AppBarCustomLeading({
//     Key? key,
//     required this.textTitle,
//     required this.onTap,
//     required this.child,
//   }) : super(key: key);
//   final String textTitle;
//   final GestureTapCallback onTap;
//   final Widget? child;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       iconTheme: const IconThemeData(color: primaryColor),
//       leading: Ink(
//         padding: const EdgeInsets.all(padding_8),
//         child: InkWell(
//           onTap: onTap,
//           child: child,
//           borderRadius: BorderRadius.circular(radius_30),
//         ),
//       ),
//       title: Text(
//         textTitle,
//         style: GoogleFonts.montserrat(
//           color: Color(0xFF2F2E41),
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(56.0);
// }
