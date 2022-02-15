import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: context.textTheme.headline6,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: context.paddingLow,
        itemBuilder: (context, i) {
          //todo: Why doesn't accept index for variable name ?
          if (i.isOdd) {
            return const Divider();
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
}
