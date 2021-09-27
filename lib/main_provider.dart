import 'package:eshemachoch_web_application/models/adminstrator.dart';
import 'package:eshemachoch_web_application/services/consumer_service.dart';
import 'package:eshemachoch_web_application/services/notice_service.dart';
import 'package:eshemachoch_web_application/services/order_service.dart';
import 'package:eshemachoch_web_application/services/product_service.dart';
import 'package:eshemachoch_web_application/services/report_service.dart';
import 'package:eshemachoch_web_application/utils/http_client.dart';
import 'package:eshemachoch_web_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_web_application/viewmodels/notice/notice_model.dart';
import 'package:eshemachoch_web_application/viewmodels/order/order_model.dart';
import 'package:eshemachoch_web_application/viewmodels/product/product_model.dart';
import 'package:eshemachoch_web_application/viewmodels/report/report_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProvider extends StatelessWidget {
  const MainProvider(
      {Key? key, required this.child, required this.adminstrator})
      : super(key: key);
  final Widget child;
  final Adminstrator adminstrator;
  @override
  Widget build(BuildContext context) {
    final client = MyCustomClient(adminstrator.token!);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ProductModel(ProductService(client))),
        ChangeNotifierProvider(
            create: (_) => NoticeModel(NoticeService(client))),
        ChangeNotifierProvider(create: (_) => OrderModel(OrderService(client))),
        ChangeNotifierProvider(
            create: (_) => ConsumerModel(ConsumerService(client))),
        ChangeNotifierProvider(
            create: (_) => ReportModel(ReportService(client))),
      ],
      child: child,
    );
  }
}
