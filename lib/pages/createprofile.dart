import 'dart:ui';
import 'package:beergarden/models/user.dart';
import 'package:beergarden/services/database.dart';
import 'package:beergarden/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';


//CHANGE LOCATION TO DROPDOWN OF PREFECTURES IN JAPAN

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  String nickname;
  String location;
  String age;
  String gender;
  String occupation;
  String about;
  List interests;

  //for interests
  bool yodeling = false;
  bool shopping = false;
  bool makingBalloonAnimals = false;
  bool cooking = false;
  bool painting = false;
  bool movies = false;
  bool sports = false;
  bool writing = false;
  bool drinking = false;

  //for loading spinner
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //this is providing the user object
    final user = Provider.of<User>(context);

    return loading
        ? Loading()
        : Scaffold(
      backgroundColor: Hexcolor("#FFF6C2"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    cursorWidth: 3,
                    maxLength: 35,
                    onChanged: (val) {
                      setState(() => nickname = val);
                    },
                    onSaved: (String value){
                      //this block is used to run code when a user save the form
                    },
                    decoration: InputDecoration(
                        hintText: 'Choose a nickname to display to users',
                        labelText:
                        'Nickname *'),
                    validator: (String value) {
                      return value.length < 3 ? 'Nickname is required' : null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    cursorWidth: 3,
                    onChanged: (val) {
                      setState(() => location = val);
                    },
                    decoration:
                    InputDecoration(labelText: 'Enter your Location'),
                    keyboardType: TextInputType.text,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Age'),
                      DropdownButton<String>(
                        value: age,
                        iconSize: 24,
                        onChanged: (String newValue) {
                          setState(() {
                            age = newValue;
                          });
                        },
                        items: <String>[
                          '20 - 29',
                          '30 - 39',
                          '40 - 49',
                          '50 - 59',
                          '60 - 69'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Text(
                        "Gender",
                      ),
                      DropdownButton<String>(
                        value: gender,
                        iconSize: 24,
                        onChanged: (String newValue) {
                          setState(() {
                            gender = newValue;
                          });
                        },
                        items: <String>[
                          'Female',
                          'Male',
                          'Other'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  TextField(
                    onChanged: (val) {
                      setState(() => occupation = val);
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter your occupation'),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    onChanged: (val) {
                      setState(() => about = val);
                    },
                    decoration: InputDecoration(
                        labelText: 'Share something about yourself'),
                    keyboardType: TextInputType.text,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('What are your interests?'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 5,
                        runSpacing: 3,
                        children: <Widget>[
                          FilterChip(
                            label: Text('yodeling'),
                            selected: yodeling,
                            onSelected: (isSelected) {
                              setState(() {
                                yodeling = isSelected;
                              });
                            },
                            selectedColor: Hexcolor("#80F0F0"),
//                                  checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('shopping'),
                            selected: shopping,
                            onSelected: (isSelected) {
                              setState(() {
                                shopping = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
//                                  checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('making balloon animals'),
                            selected: makingBalloonAnimals,
                            onSelected: (isSelected) {
                              setState(() {
                                makingBalloonAnimals = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
                            checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('cooking'),
                            selected: cooking,
                            onSelected: (isSelected) {
                              setState(() {
                                cooking = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
                            checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('painting'),
                            selected: painting,
                            onSelected: (isSelected) {
                              setState(() {
                                painting = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
                            checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('writing'),
                            selected: writing,
                            onSelected: (isSelected) {
                              setState(() {
                                writing = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
                            checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('sports'),
                            selected: sports,
                            onSelected: (isSelected) {
                              setState(() {
                                sports = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
                            checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('movies'),
                            selected: movies,
                            onSelected: (isSelected) {
                              setState(() {
                                movies = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
                            checkmarkColor: Colors.white,
                          ),
                          FilterChip(
                            label: Text('drinking'),
                            selected: drinking,
                            onSelected: (isSelected) {
                              setState(() {
                                drinking = isSelected;
                              });
                            },
                            selectedColor: Colors.pink[400],
                            checkmarkColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 20, 0),
                    child: RaisedButton(
                      onPressed: () async {
                        //write profile info into the db
                        await DatabaseService(uid: user.uid)
                            .updateUserData(
                          nickname,
                          location,
                          age,
                          gender,
                          occupation,
                          about,
                          yodeling,
                          shopping,
                          makingBalloonAnimals,
                          cooking,
                          painting,
                          movies,
                          sports,
                          writing,
                          drinking,
                        );
                        Navigator.of(context).pushNamed('/uploadphoto');
                      },
                      textColor: Colors.white,
                      color: Hexcolor("#215a00"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: <Widget>[
                          Text('GO TO UPLOAD PHOTO  ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Icon(MdiIcons.arrowRight, size: 18)
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}