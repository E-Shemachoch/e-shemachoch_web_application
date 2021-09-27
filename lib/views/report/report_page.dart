import 'package:eshemachoch_web_application/viewmodels/report/report_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReportPage extends StatelessWidget {
  const MyReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildReport(String header, String value) {
      final theme = Theme.of(context);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: theme.textTheme.headline6,
            ),
            Text(
              value,
              style: theme.textTheme.headline4!
                  .copyWith(color: theme.colorScheme.secondary),
            ),
          ],
        ),
      );
    }

    return Consumer<ReportModel>(builder: (context, model, _) {
      if (model.hasError) return Text('Could not load list.');
      if (model.isLoading) return CircularProgressIndicator();
      if (model.report == null) return Text('There\'s no report.');
      final report = model.report;
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildReport('Total Monthly Income', '${report!.income}ETB'),
            buildReport('Total Sold Items', report.sold.toString()),
            buildReport('Items Available', report.available.toString())
          ]),
        ),
      );
    });
  }
}
