import 'package:flutter/material.dart';

class SuggestionView extends StatelessWidget {
  const SuggestionView({Key? key, required this.listWidget}) : super(key: key);
  final List<Widget> listWidget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView(children: listWidget),
    );
  }
}
