// import 'package:flutter/material.dart';
//
// import '../../../../../core/utils/constants.dart';
//
// class CategoryNamesList extends StatefulWidget {
//   final Function(String categoryName) onCategorySelected;
//
//   const CategoryNamesList({super.key, required this.onCategorySelected, String? selectedCategory});
//
//   @override
//   _CategoryNamesListState createState() => _CategoryNamesListState();
// }
//
// class _CategoryNamesListState extends State<CategoryNamesList> {
//   String? selectedCategory;
//
//   @override
//   Widget build(BuildContext context) {
//     final categories = AppConstants.categories;
//
//     return SizedBox(
//       height: 60,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         itemCount: categories.length,
//         separatorBuilder: (_, __) => const SizedBox(width: 10),
//         itemBuilder: (context, index) {
//           final categoryName = categories[index].name;
//           bool isSelected = selectedCategory == categoryName;
//
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedCategory = categoryName;
//               });
//               widget.onCategorySelected(categoryName);
//             },
//             child: Chip(
//               label: Text(
//                 categoryName,
//                 style: TextStyle(color: isSelected ? Colors.white : kTextColor),
//               ),
//               backgroundColor: isSelected ? kSecondaryColor : Colors.white,
//               side: const BorderSide(color: Colors.white),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
