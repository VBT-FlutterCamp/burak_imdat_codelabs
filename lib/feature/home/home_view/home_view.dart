import 'package:burak_imdat_codelabs/core/contants/string_constant.dart';
import 'package:burak_imdat_codelabs/product/random_words.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.instance.appBarTitle),
      ),
      body: const Center(child: RandomWords()),
    );
  }
}
