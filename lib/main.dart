import 'package:eshemachoch_web_application/main_provider.dart';
import 'package:eshemachoch_web_application/models/notice.dart';
import 'package:eshemachoch_web_application/models/product.dart';
import 'package:eshemachoch_web_application/models/consumer.dart' as model;
import 'package:eshemachoch_web_application/services/adminstrator_service.dart';
import 'package:eshemachoch_web_application/viewmodels/adminstrator/adminstrator_model.dart';
import 'package:eshemachoch_web_application/views/consumers/consumer_details.dart';
import 'package:eshemachoch_web_application/views/home/home_page.dart';
import 'package:eshemachoch_web_application/views/notices/notice_details.dart';
import 'package:eshemachoch_web_application/views/product/product_details.dart';
import 'package:eshemachoch_web_application/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                AdminstratorModel(AdminstratorService(http.Client())))
      ],
      child: MaterialApp(
        title: 'E-Shemachoch',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.green, canvasColor: Colors.white),
        builder: (context, child) {
          return Consumer<AdminstratorModel>(
            builder: (context, model, _) {
              if (model.isLoggedIn) {
                return MainProvider(
                  adminstrator: model.adminstrator!,
                  child: child!,
                );
              }
              return Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    settings: settings,
                    builder: (context) {
                      return MyLoginPage();
                    },
                  );
                },
              );
            },
          );
        },
        initialRoute: MyHomePage.route,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case MyHomePage.route:
                  return MyHomePage();
                case ProductDetails.route:
                  final product = settings.arguments as Product?;
                  return ProductDetails(
                    product: product,
                  );
                case NoticeDetails.route:
                  final notice = settings.arguments as Notice?;
                  return NoticeDetails(
                    notice: notice,
                  );
                case ConsumerDetails.route:
                  final consumer = settings.arguments as model.Consumer?;
                  return ConsumerDetails(
                    consumer: consumer,
                  );
                default:
                  return Scaffold(body: Text('Who?'));
              }
            },
          );
        },
      ),
    );
  }
}
