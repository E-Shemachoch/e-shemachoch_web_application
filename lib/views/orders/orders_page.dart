import 'dart:io';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/viewmodels/adminstrator/adminstrator_model.dart';
import 'package:eshemachoch_web_application/viewmodels/order/order_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminstrator = context.read<AdminstratorModel>().adminstrator;

    return Consumer<OrderModel>(builder: (context, model, _) {
      if (model.hasError) return Text('Could not load list.');
      if (model.isLoading) return CircularProgressIndicator();
      if (model.orders!.isEmpty) return Text('The list is empyt.');
      return ListView.separated(
        itemCount: model.orders!.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          final order = model.orders![index];
          final length = order.products.length;
          final date =
              DateTime.fromMillisecondsSinceEpoch(order.date).toString();
          return ListTile(
            leading: Image.network(
                '$BASEURL/products/images/${order.products.first.image}',
                headers: {
                  HttpHeaders.authorizationHeader: adminstrator!.token!,
                }),
            title: Text(order.phoneNumber),
            subtitle: Text(order.products.first.name +
                "${length > 1 ? ' , $length more' : ''}"),
            trailing: Text(date),
          );
        },
      );
    });
  }
}
