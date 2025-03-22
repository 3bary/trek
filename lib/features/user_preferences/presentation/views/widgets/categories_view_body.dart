import 'package:flutter/material.dart';
import 'package:greendo/features/user_preferences/presentation/views/widgets/custom_chip.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  _CategoriesViewBodyState createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children:
                AppConstants.categories.map((category) {
                  bool isSelected = selectedCategories.contains(
                    category.name,
                  );
                  return CustomChip(
                      isSelected: isSelected,
                      label: Text(category.name),
                      onChipSelected: (){
                        setState(() {
                          selectedCategories.add(category.name);
                        });
                      },
                      onChipDeselected: (){
                        setState(() {
                          selectedCategories.remove(category.name);
                        });
                      }
                  );
                }).toList(),
              ),
            ),
          ),
          CustomButton(
            backgroundColor: kSecondaryColor,
            text: "Finish",
            textColor: Colors.white,
            onPressed: () {

            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
