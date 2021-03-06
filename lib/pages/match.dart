import 'package:beergarden/models/user.dart';
import 'package:beergarden/services/auth.dart';
import 'package:beergarden/services/database.dart';
import 'package:beergarden/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:beergarden/pages/message.dart';

class Match extends StatefulWidget {
  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  String matchID;
  String chatID;
  int matches;

  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
    print('I AM RUNNING');
    final user = Provider.of<User>(context, listen: false);

    //get matchID and chatID from db
    Firestore.instance.collection('users').document(user.uid).get().then((doc) {
      setState(() {
        matchID = doc['matchID'];
        chatID = doc['chatID'];
        matches = doc['matches'];
      });
      print('I AM matchID $matchID and I am matches $matches');
    });
  }

  @override
  Widget build(BuildContext context) {
    final myUserData = Provider.of<UserData>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: matchID).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData && matches > 0) {
            return Scaffold(
              body: ListView(
                children: <Widget>[
                  //TODAY'S MATCH
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text("Today's Match",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              )),
                          //Adding logout icon to header
                          FlatButton.icon(
                            icon: Icon(Icons.person),
                            label: Text("logout"),
                            onPressed: () async {
                              await _auth.signOut();
                            },
                          ),
                        ],
                      )),
                  //NICKNAME AND LOCATION
                  Center(
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('${userData.nickname}, ${userData.age}',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold)),
                            Row(
                              children: <Widget>[
                                Icon(MdiIcons.mapMarker,
                                    size: 18, color: Colors.grey),
                                Text('${userData.location}, Japan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey))
                              ],
                            ),
                          ]),
                    ),
                  ),
                  //IMAGE
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    width: 380,
                    height: 380,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 380,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(userData.imgUrl,
                                      fit: BoxFit.cover),
                                )),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 380,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                          color: Colors.black.withOpacity(0))),
                                )),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              height: 80,
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(35, 5, 0, 5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Text("John Smith, 28",
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(MdiIcons.mapMarker,
                                            size: 18, color: Colors.pink),
                                        Text('Tokyo, Japan',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.pink))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  //OCCUPATION
                  Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Occupation',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(height: 5),
                          Text(userData.occupation,
                              style: TextStyle(fontSize: 16))
                        ]),
                  ),
                  //INTERESTS
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Interests',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(height: 5),
                          Wrap(
                            children: <Widget>[
                              //WHEN REFACTORING CREATE SEPARATE WIDGET AND MAP THROUGH INTERESTS
                              if (userData.yodeling)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Yodeling",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.shopping)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Shopping",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.makingBalloonAnimals)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("MakingBalloonAnimals",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.cooking)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Cooking",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.painting)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Painting",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.movies)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Movies",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.sports)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Sports",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.writing)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Writing",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                              if (userData.drinking)
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: OutlineButton(
                                        child: Text("Drinking",
                                            style:
                                            TextStyle(color: Colors.pink)),
                                        onPressed: null,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)))),
                            ],
                          )
                        ]),
                  ),
                  //ABOUT ME
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('About me',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(height: 5),
                          Text(userData.about, style: TextStyle(fontSize: 16))
                        ]),
                  ),
                  //START A CONVERSATION BUTTON
                  Container(
                    margin: const EdgeInsets.fromLTRB(60, 5, 60, 0),
                    child: ButtonTheme(
                      height: 40.0,
                      child: RaisedButton(
                          child: Text('Start a conversation',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          color: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () =>
                          {
                            //set chatted to true in db
                            Firestore.instance
                                .collection("messages")
                                .document(chatID)
                                .updateData({'matched': true}),

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Message(
                                            chatRoomID: chatID,
                                            matchID: matchID)))
                          }),
                    ),
                  ),
                ],
              ),
            );
          }
          else if (matches == 0 || matchID == null) {
            final user = Provider.of<User>(context);
            return Scaffold(
              body: ListView(
                children: <Widget>[
                  //GET NEW MATCH BUTTON
                  FlatButton(
                    color: Colors.pinkAccent,
                    child: Text('Get your new match for the day <3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      //add matches by one
                      int matches = myUserData.matches + 1;

                      //find a user where matched is false
                      Firestore.instance
                          .collection("messages")
                          .where('fromID', isEqualTo: user.uid)
                          .getDocuments()
                          .then((data) => data.documents.forEach((doc) => {
                            print('I am ooping through messages'),
                        if (!doc['matched'])
                          {
                            print(
                                'found unmatched user $doc.toID and $doc.documentID'),
                            Firestore.instance
                                .collection('users')
                                .document(user.uid)
                                .updateData({
                              'matchID': doc['toID'],
                              'chatID': doc.documentID,
                              'matches': matches,
                            }),
                            print(
                                'updated user collection with matchID: $doc.toID')
                          }
                      }));

                      //go to matched Profile page
                      Navigator.of(context).pushNamed('/navigationHome');
                    },
                  ),
                ],
              ),
            );
          }
          else {
            return Loading();
          }
        });
  }
}
