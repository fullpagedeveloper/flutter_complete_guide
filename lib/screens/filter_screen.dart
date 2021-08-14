import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScren extends StatelessWidget {
  static const routeName = '/filter-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters!'),
      ),
    );
  }
}
