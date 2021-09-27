import 'package:eshemachoch_web_application/models/adminstrator.dart';
import 'package:eshemachoch_web_application/viewmodels/adminstrator/adminstrator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  Adminstrator? adminstrator;

  @override
  Widget build(BuildContext context) {
    handleLogin() {
      if (form.validate()) {
        adminstrator = Adminstrator.empty();
        form.save();
        context.read<AdminstratorModel>().login(adminstrator!);
      }
    }

    return Form(
      key: formKey,
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/login.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'WELCOME TO E-SHEMACHOCH',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Username',
                  ),
                  onSaved: (value) {
                    adminstrator = adminstrator?.copyWith(username: value);
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                  ),
                  onSaved: (value) {
                    final hash = md5.convert(utf8.encode(value!)).toString();
                    adminstrator = adminstrator?.copyWith(password: hash);
                  },
                ),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: handleLogin,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
