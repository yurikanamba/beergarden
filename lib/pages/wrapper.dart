import 'package:beergarden/models/user.dart';
import 'package:beergarden/pages/welcome.dart';
import 'package:beergarden/pages/navigationhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Welcome();
    } else {
      return NavigationHome();
    }
  }
}
