import 'package:cloud_firestore/cloud_firestore.dart';

class FbDatabaseService {
  uploadUserDetails(userMap) {
    FirebaseFirestore.instance.collection('users').add(userMap);
  }

  Future getUserDetails(String Username) async{
    return await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: Username)
        .get();
  }
}
