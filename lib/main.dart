import 'package:beergarden/pages/createprofile.dart';
import 'package:beergarden/pages/editprofile.dart';
import 'package:beergarden/pages/forgotpassword.dart';
import 'package:beergarden/pages/login.dart';
import 'package:beergarden/pages/navigationhome.dart';
import 'package:beergarden/pages/signup.dart';
import 'package:beergarden/pages/uploadphoto.dart';
import 'package:beergarden/pages/wrapper.dart';
import 'package:beergarden/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//provide user data to Wrapper file
import 'package:provider/provider.dart';

import 'models/user.dart';

//main function is the first function that fires when dart file starts
void main() {
  runApp(MyApp());
}

//create new widget called MyApp which is the root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Material App is a widget that has properties like title, theme etc.
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          title: 'BeerGarden',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Alata',
            primaryColor: Hexcolor("#fdeac6"),
            accentColor: Hexcolor("#fdeac6"),
          ),
// this goes under theme
          initialRoute: '/',
          routes: {
            '/': (_) => Wrapper(),
            '/signup': (_) => SignUp(),
            '/login': (_) => Login(),
            '/forgotpassword': (_) => ForgotPassword(),
            '/createProfile': (_) => CreateProfile(),
            '/uploadphoto': (_) => UploadPhoto(),
            '/editProfile': (_) => EditProfile(),
            '/navigationHome': (_) => NavigationHome(),
          }),
    );
  }
}