import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Shemachoch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMainApplication(),
    );
  }
}

class MyMainApplication extends StatefulWidget {
  const MyMainApplication({Key? key}) : super(key: key);

  @override
  State<MyMainApplication> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyMainApplication> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Product',
    ),
    Text(
      'Notice',
    ),
    Text(
      'Users',
    ),
    Text(
      'Orders',
    ),
    Text(
      'Report',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Shemachoch')),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.sell),
                label: Text('Product'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.info),
                label: Text('Notice'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text('Users'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.article),
                label: Text('Orders'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.show_chart),
                label: Text('Report'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          )
        ],
      ),
    );
  }
}
