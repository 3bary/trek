//
// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
//   const CustomAppBar({super.key, required this.title});
// final String title;
//   @override
//   Widget build(BuildContext context) {
//    return AppBar(
//
//      toolbarHeight: 80,
//      backgroundColor: Color(0xffA8E6CF),
//      automaticallyImplyLeading: false,
//      elevation: 0,
//      title:  Text(
//       title,
//        textAlign: TextAlign.start,
//        style: TextStyle(fontWeight: FontWeight.bold),
//      ),
//    );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(80);
//
// }