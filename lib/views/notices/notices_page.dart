import 'package:eshemachoch_web_application/viewmodels/notice/notice_model.dart';
import 'package:eshemachoch_web_application/views/notices/notice_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNoticesPage extends StatelessWidget {
  const MyNoticesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoticeModel>(
      builder: (context, model, _) {
        if (model.hasError) return Text('Could not load list.');
        if (model.isLoading) return CircularProgressIndicator();
        if (model.notices!.isEmpty) return Text('The list is empyt.');

        return ListView.separated(
          itemCount: model.notices!.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (context, index) {
            final notice = model.notices![index];
            final date = DateTime.fromMillisecondsSinceEpoch(notice.date).toString();
            return ListTile(
              title: Text(notice.title),
              subtitle: Text(notice.message),
              trailing: Text(date),
              onTap: () {
                Navigator.pushNamed(context, NoticeDetails.route, arguments: notice);
              },
            );
          },
        );
      },
    );
  }
}
