import 'package:eshemachoch_web_application/viewmodels/adminstrator/adminstrator_model.dart';
import 'package:eshemachoch_web_application/views/consumers/consumer_details.dart';
import 'package:eshemachoch_web_application/views/consumers/consumers_page.dart';
import 'package:eshemachoch_web_application/views/notices/notice_details.dart';
import 'package:eshemachoch_web_application/views/notices/notices_page.dart';
import 'package:eshemachoch_web_application/views/orders/orders_page.dart';
import 'package:eshemachoch_web_application/views/product/product_details.dart';
import 'package:eshemachoch_web_application/views/product/product_page.dart';
import 'package:eshemachoch_web_application/views/report/report_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const route = '/';
  @override
  State<MyHomePage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    const MyProductsPage(),
    const MyNoticesPage(),
    const MyConsumersPage(),
    const MyOrdersPage(),
    const MyReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/logo_white.png',
                width: 28,
                height: 28,
              ),
              SizedBox(width: 12),
              Text('E-Shemachoch'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('LOGOUT',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white)),
              onPressed: context.read<AdminstratorModel>().logout,
            ),
          ]),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
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
                label: Text('Consumers'),
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
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          )
        ],
      ),
      floatingActionButton: _selectedIndex <= 2
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(_selectedIndex == 0
                    ? ProductDetails.route
                    : (_selectedIndex == 1)
                        ? NoticeDetails.route
                        : ConsumerDetails.route);
              },
            )
          : null,
    );
  }
}
