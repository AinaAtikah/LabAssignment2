import 'package:flutter/material.dart';
import 'package:homestayraya/views/screens/registrationscreen.dart';
import '../../models/user.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(title: const Text("Profile"), actions: [
            IconButton(
                onPressed: _registrationForm,
                icon: const Icon(Icons.app_registration))
          ]),
          body: const Center(child: Text("Profile")),
          drawer: MainMenuWidget(
            user: widget.user,
          )),
    );
  }

  void _registrationForm() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegistrationScreen()));
  }
}

MainMenuWidget({required User user}) {}
