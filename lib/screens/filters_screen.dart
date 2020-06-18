import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filterData;
  final Function updateFilters;

  FiltersScreen(this.filterData, this.updateFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.filterData['glutenFree'];
    _lactoseFree = widget.filterData['lactoseFree'];
    _vegan = widget.filterData['vegan'];
    _vegetarian = widget.filterData['vegetarian'];
    super.initState();
  }

  Widget buildSwitchTile({
    String title,
    String subtitle,
    void Function(bool) handler,
    bool value,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: handler,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedFilters = {
                'glutenFree': _glutenFree,
                'lactoseFree': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.updateFilters(updatedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey[100],
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              'Apply Your Filters Here',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildSwitchTile(
            title: 'Gluten Free',
            subtitle: 'Show only gluten-free meals',
            value: _glutenFree,
            handler: (newVal) {
              setState(() {
                _glutenFree = newVal;
              });
            },
          ),
          buildSwitchTile(
            title: 'Lactose Free',
            subtitle: 'Show only lactose-free meals',
            value: _lactoseFree,
            handler: (newVal) {
              setState(() {
                _lactoseFree = newVal;
              });
            },
          ),
          buildSwitchTile(
            title: 'Vegan',
            subtitle: 'Show only vegan meals',
            value: _vegan,
            handler: (newVal) {
              setState(() {
                _vegan = newVal;
              });
            },
          ),
          buildSwitchTile(
            title: 'Vegetarian',
            subtitle: 'Show only vegetarian meals',
            value: _vegetarian,
            handler: (newVal) {
              setState(() {
                _vegetarian = newVal;
              });
            },
          ),
        ],
      ),
    );
  }
}
