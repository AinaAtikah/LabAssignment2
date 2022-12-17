import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../shared/config.dart';
import 'loginscreen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    AutoLogin();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/homestay.png'),
                    fit: BoxFit.cover))),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: 80, width: 80, child: CircularProgressIndicator()),
              Text(
                "Your best stay",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

Future<void> AutoLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String id = (prefs.getString('id')) ?? '';
  String name = (prefs.getString('name')) ?? '';
  ;
  String email = (prefs.getString('email')) ?? '';
  ;
  String phone = (prefs.getString('phone')) ?? '';
  ;
  String address = (prefs.getString('address')) ?? '';
  ;
  String regdate = (prefs.getString('regdate')) ?? '';
  ;
  late User user;
  if (email.isNotEmpty) {
    var http;
    http.post(Uri.parse("${Config.SERVER}/homestay_raya/php/login_user.php"),
        body: {
          "id": id,
          "name": name,
          "email": email,
          "phone": phone,
          "address": address,
          "regdate": regdate
        }).then((response) {
      var jsonResponse = json.decode(response.body);
      if (response.statusCode == 200 && jsonResponse['status'] == "success") {
        User user = User.fromJson(jsonResponse['data']);
      } else {
        user = User(
            id: "0",
            email: "unregistered",
            name: "unregistered",
            address: "na",
            phone: "0123456789",
            regdate: "0");
      }
    });
  } else {
    user = User(
        id: "0",
        email: "unregistered",
        name: "unregistered",
        address: "na",
        phone: "0123456789",
        regdate: "0");
  }
}
