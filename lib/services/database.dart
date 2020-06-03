import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishu_game/models/brew.dart';
import 'package:dishu_game/models/category.dart';
import 'package:dishu_game/models/user.dart';

class DatabaseService {
  final String uid;
  //collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  final CollectionReference categoryCollection =
      Firestore.instance.collection('categories');

  DatabaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          sugars: doc.data['sugars'] ?? '0',
          strength: doc.data['strength'] ?? 0);
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  //get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  //category list from snapshot
  List<Category> _categoryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Category(
          categoryName: doc.data['category_name'] ?? '',
          categoryType: doc.data['category_type'] ?? '',
          categoryTags: doc.data['category_tags'] ?? '');
    }).toList();
  }

  //get category stream
  Stream<List<Category>> get categories {
    return categoryCollection.snapshots().map(_categoryListFromSnapshot);
  }
}
