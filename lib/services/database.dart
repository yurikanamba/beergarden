import 'package:beergarden/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection =
  Firestore.instance.collection("users");

  //set user data when signing up
  Future setUserData(String email) async {
    return await usersCollection.document(uid).setData({
      'email': email,
      'nickname': "",
      'location': "",
      'age': "",
      'gender': "",
      'occupation': "",
      'about': "",
    });
  }

  //update user data when creating profile or editing profile
  Future updateUserData(
      String nickname,
      String location,
      String age,
      String gender,
      String occupation,
      String about,
      bool yodeling,
      bool shopping,
      bool makimngBalloonAnimals,
      bool cooking,
      bool painting,
      bool movies,
      bool sports,
      bool writing,
      bool drinking) async {
    print('I AM UPDATING THE DB');
    return await usersCollection.document(uid).updateData({
      'nickname': nickname,
      'location': location,
      'age': age,
      'gender': gender,
      'occupation': occupation,
      'about': about,
      'yodeling': yodeling,
      'shopping': shopping,
      'makingBalloonAnimals': makimngBalloonAnimals,
      'cooking': cooking,
      'painting': painting,
      'movies': movies,
      'sports': sports,
      'writing': writing,
      'drinking': drinking,
      'matches': 0,
    });
  }

  ///GC DELETE THSSSSS
  Future updateUserDataSmall(
      String nickname,
      String location,
      String occupation,
      String about,
      ) async {
    return await usersCollection.document(uid).updateData({
      'nickname': nickname,
      'location': location,
      'occupation': occupation,
      'about': about,
      'matchedToday': false,
    });
  }

  //matchData from snapshot

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      email: snapshot.data['email'],
      nickname: snapshot.data['nickname'],
      location: snapshot.data['location'],
      age: snapshot.data['age'],
      gender: snapshot.data['gender'],
      occupation: snapshot.data['occupation'],
      about: snapshot.data['about'],
      yodeling: snapshot.data['yodeling'],
      shopping: snapshot.data['shopping'],
      makingBalloonAnimals: snapshot.data['makingBalloonAnimals'],
      cooking: snapshot.data['cooking'],
      painting: snapshot.data['painting'],
      movies: snapshot.data['movies'],
      sports: snapshot.data['sports'],
      writing: snapshot.data['writing'],
      drinking: snapshot.data['drinking'],
      matches: snapshot.data['matches'],
      imgUrl: snapshot.data['imgUrl'],
    );
  }

  //get user doc stream
  //used when populating user data in preview profile and edit profile
  Stream<UserData> get userData {
    return usersCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  //update user img when uploaded
  Future updateUserImg(
      String imgUrl,
      ) async {
    return await usersCollection.document(uid).updateData({
      'imgUrl': imgUrl,
    });
  }

  //userData from snapshot
  UserImg _userImgFromSnapshot(DocumentSnapshot snapshot) {
    return UserImg(
      imgUrl: snapshot.data['imgUrl'],
    );
  }

  //

  Stream<UserImg> get userImg {
    return usersCollection.document(uid).snapshots().map(_userImgFromSnapshot);
  }
}
