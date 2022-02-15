import 'package:burak_imdat_codelabs/feature/suggestion/suggestion_view/suggestion_view.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../core/contants/string_constant.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.instance.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    final tiles = _saved.map(
      (pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: context.textTheme.headline6,
          ),
        );
      },
    );
    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
        : <Widget>[];
    Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionView(listWidget: divided)));
  }

  void onTapAction(bool isContain, WordPair pair) {
    if (isContain) {
      _saved.remove(pair);
    } else {
      _saved.add(pair);
    }
    setState(() {});
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: context.textTheme.headline6,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () => onTapAction(alreadySaved, pair),
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
