import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_filter_chip.dart';

class TagsViewBody extends StatefulWidget {
  const TagsViewBody({
    super.key,
    required this.onNext,
    required this.selectedTags,
    required this.onTagsChanged,
  });

  final Function() onNext;
  final List<String> selectedTags;
  final Function(List<String>) onTagsChanged;

  @override
  _TagsViewBodyState createState() => _TagsViewBodyState();
}

class _TagsViewBodyState extends State<TagsViewBody> {
  late List<String> selectedTags;

  @override
  void initState() {
    super.initState();
    selectedTags = List.from(widget.selectedTags);
  }

  void toggleTag(String tagName, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedTags.add(tagName);
      } else {
        selectedTags.remove(tagName);
      }
    });
    widget.onTagsChanged(selectedTags);
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
                children: AppConstants.tags.map((tag) {
                  bool isSelected = selectedTags.contains(tag.name);
                  return CustomFilterChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(tag.emoji, style: const TextStyle(fontSize: 18)),
                        const SizedBox(width: 6),
                        Text(tag.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    isSelected: isSelected,
                    onChipSelected: () => toggleTag(tag.name, true),
                    onChipDeselected: () => toggleTag(tag.name, false),
                  );
                }).toList(),
              ),
            ),
          ),
          CustomButton(
            backgroundColor: kSecondaryColor,
            text: "Continue",
            textColor: Colors.white,
            onPressed: widget.onNext,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
