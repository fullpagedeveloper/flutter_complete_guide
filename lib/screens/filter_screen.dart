import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScren extends StatefulWidget {
  static const routeName = '/filter-screen';

  @override
  _FilterScrenState createState() => _FilterScrenState();
}

class _FilterScrenState extends State<FilterScren> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                      (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                        print('====--> $_glutenFree');
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                      print('====--> $_vegetarian');
                    },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Vegan',
                  'Only include Vegan meals',
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                      print('====--> $_vegan');
                    },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Lactose Free',
                  'Only include Lactose Free meals',
                  _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                      print('====--> $_lactoseFree');
                    },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
