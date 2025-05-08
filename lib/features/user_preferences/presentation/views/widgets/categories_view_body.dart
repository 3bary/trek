import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_filter_chip.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({
    super.key,
    required this.selectedCategories,
    required this.onCategoriesChanged,
    required this.onFinish,
  });

  final List<String> selectedCategories;
  final Function(List<String>) onCategoriesChanged;
  final Function() onFinish;

  @override
  _CategoriesViewBodyState createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  late List<String> selectedCategories;

  @override
  void initState() {
    super.initState();
    selectedCategories = List.from(widget.selectedCategories);
  }

  void toggleCategory(String categoryName, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedCategories.add(categoryName);
      } else {
        selectedCategories.remove(categoryName);
      }
    });
    widget.onCategoriesChanged(selectedCategories);
  }

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
                children: AppConstants.categories.map((category) {
                  bool isSelected = selectedCategories.contains(category.name);
                  return CustomFilterChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(category.emoji, style: const TextStyle(fontSize: 18)),
                        const SizedBox(width: 6),
                        Text(category.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    isSelected: isSelected,
                    onChipSelected: () => toggleCategory(category.name, true),
                    onChipDeselected: () => toggleCategory(category.name, false),
                  );
                }).toList(),
              ),
            ),
          ),
          CustomButton(
            backgroundColor: kSecondaryColor,
            text: "Finish",
            textColor: Colors.white,
            onPressed: widget.onFinish,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
