import 'package:flutter/material.dart';
import 'package:homestayraya/models/user.dart';
import 'package:homestayraya/views/screens/loginscreen.dart';

class MainScreen extends StatelessWidget {
  final User user;
  const MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Screen'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              const Text("Main Screen"),
              MaterialButton(
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                minWidth: 115,
                height: 40,
                elevation: 10,
                onPressed: (() => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginScreen()))
                    }),
                child: const Text('Exit Page'),
              )
            ]))));
  }
}
