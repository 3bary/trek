import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import 'widgets/tags_view_body.dart';

class TagsView extends StatelessWidget {
  const TagsView({
    super.key,
    required this.onNext,
    required this.selectedTags,
    required this.onTagsChanged,
  });

  final Function() onNext;
  final List<String> selectedTags;
  final Function(List<String>) onTagsChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Tags"),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: TagsViewBody(
        onNext: onNext,
        selectedTags: selectedTags,
        onTagsChanged: onTagsChanged,
      ),
    );
  }
}
