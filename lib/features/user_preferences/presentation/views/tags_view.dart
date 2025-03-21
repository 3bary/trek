import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import 'widgets/tags_view_body.dart';

class TagsView extends StatefulWidget {
  const TagsView({super.key, required this.onNext});
  final Function() onNext;

  @override
  _TagsViewState createState() => _TagsViewState();
}

class _TagsViewState extends State<TagsView> {
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Tags"),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: TagsViewBody(onNext: widget.onNext),
    );
  }
}
