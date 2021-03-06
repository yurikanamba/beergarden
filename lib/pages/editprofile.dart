import 'package:beergarden/models/user.dart';
import 'package:beergarden/services/database.dart';
import 'package:beergarden/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  String nickname;
  String location;
  /* String age = '20 - 29';
  String gender = 'Female';*/
  String occupation;
  String about;
  /* List interests;
  //for interests
  bool yodeling = false;
  bool shopping = false;
  bool makingBalloonAnimals = false;
  bool cooking = false;
  bool painting = false;
  bool movies = false;
  bool sports = false;
  bool writing = false;
  bool drinking = false;*/


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);



    print("this is $nickname");
    /* void changeRoute() => {
      Navigator.of(context).pushNamed('/myprofile')
    };*/

    /*updateProfileData() async {
      if(nickname == '') {
        nickname = userData.nickname
      }
     // Navigator.of(context).pushNamed('/myprofile');
      await DatabaseService(uid: user.uid)
          .updateUserDataSmall(
          nickname,
          location,
         // age,
         // gender,
          occupation,
          about,
        *//*  yodeling,
          shopping,
          makingBalloonAnimals,
          cooking,
          painting,
          movies,
          sports,
          writing,
          drinking*//*
      );
    }*/

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            /*  void changeRoute() => {
            Navigator.of(context).pushNamed('/myprofile')
          };*/
            /* nickname = userData.nickname;
          location = userData.location;
          occupation = userData.occupation;
          about = userData.about;*/

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(userData.imgUrl),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Edit Profile Picture',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                textDirection: TextDirection.ltr,
                                children: <Widget>[
                                  TextFormField(
                                    onChanged: (val) {
                                      if (val != userData.nickname) {
                                        setState(() => nickname = val);
                                      } else {
                                        nickname = userData.nickname;
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    initialValue: (userData.nickname == null? ' '  : userData.nickname),
                                    decoration: InputDecoration(
                                      labelText: 'Nickname',
                                    ),
                                    autofocus: true,
                                    keyboardType: TextInputType.text,
                                  ),
                                  TextFormField(
                                    onChanged: (val) {
                                      if (val != userData.location) {
                                        setState(() => location = val);
                                      } else {
                                        location = userData.location;
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    initialValue: (userData.location == null? ' '  : userData.location),
                                    decoration: InputDecoration(
                                      labelText: 'Location',
                                    ),
                                    autofocus: true,
                                    keyboardType: TextInputType.text,
                                  ),

                                ],

                              ),
                              /*Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(right: 70),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Age',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
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
                                                ].map<DropdownMenuItem<String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[

                                          Text(
                                            'Gender',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
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
                                            ]
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),*/
                              TextFormField(
                                onChanged: (val) {
                                  if (val != userData.occupation) {
                                    setState(() => occupation = val);
                                  }  else {
                                    occupation = userData.occupation;
                                  }
                                },
                                initialValue: (userData.occupation == null? ' '  : userData.occupation),
                                decoration: InputDecoration(
                                    labelText: 'Enter your occupation'),
                                keyboardType: TextInputType.text,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  if (val != userData.about) {
                                    setState(() => about = val);
                                  }  else {
                                    about = userData.about;
                                  }
                                },
                                initialValue: (userData.about == null? ' '  : userData.about),
                                decoration: InputDecoration(
                                    labelText: 'Share something about yourself'),
                                keyboardType: TextInputType.text,
                              ),
                              /*Padding(
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
                                      selectedColor: Colors.pink[400],
                                      checkmarkColor: Colors.white,
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
                                      checkmarkColor: Colors.white,
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
                            ),*/
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: RaisedButton(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  color: Colors.pinkAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () async {

                                    print('saved is workgin');
                                    // Navigator.of(context).pushNamed('/myprofile');
                                    await DatabaseService(uid: user.uid)
                                        .updateUserDataSmall(
                                      nickname,
                                      location,
                                      // age,
                                      // gender,
                                      occupation,
                                      about,
                                      /*  yodeling,
          shopping,
          makingBalloonAnimals,
          cooking,
          painting,
          movies,
          sports,
          writing,
          drinking*/
                                    );

                                    //  Navigator.of(context).pushNamed('/myprofile'),
                                    //changeRoute(),
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
