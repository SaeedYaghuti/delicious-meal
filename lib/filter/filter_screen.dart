import 'package:deli_meal/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  Map<String, bool> filtersOption;
  final Function filterHandler;

  FiltersScreen({
    this.filtersOption,
    this.filterHandler,
  });

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vagan = false;
  bool lactoseFree = false;

  @override
  initState() {
    glutenFree = widget.filtersOption['glutenFree'];
    vegetarian = widget.filtersOption['vegetarian'];
    vagan = widget.filtersOption['vagan'];
    lactoseFree = widget.filtersOption['lactoseFree'];
    super.initState();
  }

  Widget buildSwitchListTile({
    bool initValue,
    String title,
    String subtitle,
    Function switchHandler,
  }) {
    return SwitchListTile(
      value: initValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: switchHandler,
    );
  }

  void saveButtonHandler() {
    Map<String, bool> newFiltersOption = {
      'glutenFree': glutenFree,
      'vegetarian': vegetarian,
      'vagan': vagan,
      'lactoseFree': lactoseFree,
    };
    widget.filterHandler(newFiltersOption);
  }

  Widget buildSaveButton() {
    return Center(
      child: FlatButton.icon(
        onPressed: saveButtonHandler,
        icon: Icon(
          Icons.save,
          color: Theme.of(context).accentColor,
        ),
        label: Text(
          'SAVE',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adjust your Favorite'),
        // actions: [IconButton(icon: Icon(Icons.save), onPressed: () {})],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your Favorites Food:',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  // initValue: filtersOption['glutenFree'],
                  initValue: glutenFree,
                  title: 'Glutten',
                  subtitle: 'Show only foods that are glutten free',
                  switchHandler: (state) {
                    setState(() {
                      glutenFree = state;
                    });
                  },
                ),
                buildSwitchListTile(
                  // initValue: filtersOption['vegetarian'],
                  initValue: vegetarian,
                  title: 'Vegeterian',
                  subtitle: 'Show only foods that are Vegetarian',
                  switchHandler: (state) {
                    setState(() {
                      vegetarian = state;
                    });
                  },
                ),
                buildSwitchListTile(
                  // initValue: filtersOption['vagan'],
                  initValue: vagan,
                  title: 'Vegan',
                  subtitle: 'Show only foods that are vegan',
                  switchHandler: (state) {
                    setState(() {
                      vagan = state;
                    });
                  },
                ),
                buildSwitchListTile(
                  // initValue: filtersOption['lactoseFree'],
                  initValue: lactoseFree,
                  title: 'Lactose Free',
                  subtitle: 'Show only foods that are Lactose free',
                  switchHandler: (state) {
                    setState(() {
                      lactoseFree = state;
                    });
                  },
                ),
                buildSaveButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
