import 'package:beergarden/services/auth.dart';
import 'package:beergarden/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  //text field state
  String email = "";
  String password = "";
  String error = '';

  //for loading spinner
  bool loading = false;

  void handleSignUp() async {
    setState(() => loading = true);
    String trimmedEmail = email.trim();
    String trimmedPassword = password.trim();
    dynamic result =
    await _auth.registerWithEmailAndPassword(trimmedEmail, trimmedPassword);
    if (result == null) {
      setState(() {
        error = 'Could not sign in with those credentials';
        loading = false;
      });
    } else {
      Navigator.of(context).pushNamed('/createProfile');
    }
  }

  void googleSignUp() async {
    dynamic result = await AuthService().registerWithGoogle();
    if (result == null) {
      setState(() {
        error = 'Could not sign in with those credentials';
        loading = false;
      });
    } else {
      //result.uid is the uid we will need for the db
      Navigator.of(context).pushNamed('/createProfile');
    }
  }

  void facebookSignUp() async {
    // TODO
  }

  Widget _buildEmail() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60.0,
      child: TextField(
        onChanged: (val) {
          setState(() => email = val);
        },
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(MdiIcons.email, color: Hexcolor('#F4AA33')),
            labelText: 'Email',
            labelStyle: TextStyle(
                fontSize: 18.0,
                color: Hexcolor('#F4AA33'),
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.0,
      child: TextField(
        onChanged: (val) {
          setState(() => password = val);
        },
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(MdiIcons.key, color: Hexcolor('#F4AA33')),
            labelText: 'Password',
            labelStyle: TextStyle(
                fontSize: 18.0,
                color: Hexcolor('#F4AA33'),
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => handleSignUp(),
        padding: EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 40.0),
        Text(
          '- Sign up with -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, IconData icon, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52.0,
        width: 52.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 40,
          color: color,
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(() => facebookSignUp(), MdiIcons.facebook,
              Color.fromARGB(255, 66, 103, 178)),
          _buildSocialBtn(() => googleSignUp(), MdiIcons.google,
              Color.fromARGB(255, 234, 67, 53)),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: () => {Navigator.of(context).pushNamed('/login')},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Alata',
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Alata',
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Hexcolor('#FFF1BA'),
                    Hexcolor('#F4AA33'),
                  ],
                  stops: [0.2, 0.7],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 52.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    _buildEmail(),
                    SizedBox(
                      height: 12.0,
                    ),
                    _buildPassword(),
                    SizedBox(
                      height: 40.0,
                    ),
                    _buildSignUpBtn(),
                    _buildSignInWithText(),
                    _buildSocialBtnRow(),
                    _buildLoginBtn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
