import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'custom_choice_chip.dart';

class TagsViewBody extends StatefulWidget {
  const TagsViewBody({super.key, required this.onNext});
  final Function() onNext;

  @override
  _TagsViewBodyState createState() => _TagsViewBodyState();
}

class _TagsViewBodyState extends State<TagsViewBody> {
  List<String> selectedTags = [];
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
                    AppConstants.tags.map((tag) {
                      bool isSelected = selectedTags.contains(tag.name);
                      return CustomChooseChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tag.emoji,
                              style: TextStyle(fontSize: 18),
                            ), // Emoji
                            SizedBox(width: 6),
                            Text(
                              tag.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        isSelected: isSelected,
                        onChipSelected: () {
                          setState(() {
                            selectedTags.add(tag.name);
                          });
                          print(selectedTags);
                        },
                        onChipDeselected: () {
                          setState(() {
                            selectedTags.remove(tag.name);
                          });
                          print(selectedTags);
                        },
                      );
                    }).toList(),
              ),
            ),
          ),
          CustomButton(
            backgroundColor: kSecondaryColor,
            text: "Continue",
            textColor: Colors.white,
            onPressed: () {
              widget.onNext();
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
