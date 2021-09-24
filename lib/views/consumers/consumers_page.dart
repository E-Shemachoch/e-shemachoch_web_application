import 'package:eshemachoch_web_application/constants/api.dart';
import 'package:eshemachoch_web_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_web_application/views/consumers/consumer_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyConsumersPage extends StatelessWidget {
  const MyConsumersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsumerModel>(
      builder: (context, model, _) {
        if (model.isLoading) return Text('Loading...');
        if (model.hasError) return Text('Could not load list.');
        if (model.consumers!.isEmpty) return Text('The list is empyt.');

        return ListView.separated(
          itemCount: model.consumers!.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (context, index) {
            final consumer = model.consumers![index];

            return ListTile(
              leading: Image.network('$BASEURL/consumers/images/${consumer.photo}'),
              title: Text(consumer.name),
              subtitle: Text(consumer.phoneNumber),
              onTap: () {
                Navigator.pushNamed(context, ConsumerDetails.route, arguments: consumer);
              },
            );
          },
        );
      },
    );
  }
}
