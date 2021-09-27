<<<<<<< Updated upstream
import 'package:eshemachoch_web_application/constants/api.dart';
=======
import 'dart:io';

import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/viewmodels/adminstrator/adminstrator_model.dart';
>>>>>>> Stashed changes
import 'package:eshemachoch_web_application/viewmodels/product/product_model.dart';
import 'package:eshemachoch_web_application/views/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
=======
    final adminstrator = context.read<AdminstratorModel>().adminstrator;
>>>>>>> Stashed changes
    return Consumer<ProductModel>(
      builder: (context, model, _) {
        if (model.hasError) return Text('Could not load list.');
        if (model.isLoading) return CircularProgressIndicator();
        if (model.products!.isEmpty) return Text('The list is empyt.');
<<<<<<< Updated upstream

        return ListView.separated(
          itemCount: model.products!.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (context, index) {
            final product = model.products![index];
            return ListTile(
              leading: Image.network('$BASEURL/products/images/${product.image}'),
=======
        imageCache?.clear();
        imageCache?.clearLiveImages();
        return ListView.separated(
          itemCount: model.products!.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (context, index) {
            final product = model.products![index];
            return ListTile(
              leading: Image.network(
                  '$BASEURL/products/images/${product.image}',
                  key: UniqueKey(),
                  headers: {
                    HttpHeaders.authorizationHeader: adminstrator!.token!,
                  }),
>>>>>>> Stashed changes
              title: Text(product.name),
              subtitle: Text(product.price.toString()),
              trailing: Text('X ${product.quantity}'),
              onTap: () {
<<<<<<< Updated upstream
                Navigator.pushNamed(context, ProductDetails.route, arguments: product);
=======
                Navigator.pushNamed(context, ProductDetails.route,
                    arguments: product);
>>>>>>> Stashed changes
              },
            );
          },
        );
      },
    );
  }
}
