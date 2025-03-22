import 'package:flutter/material.dart';
import 'package:greendo/features/user_preferences/presentation/views/widgets/categories_view_body.dart';

import '../../../../core/utils/constants.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Categories"),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: CategoriesViewBody(),
    );
  }
}
