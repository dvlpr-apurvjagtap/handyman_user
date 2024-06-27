import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handyman_user/consts/firebase.dart';

class DBController {
  static var user;
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static getUserDetail({userId}) async {
    var query = _db.collection(DBCollection.customer).doc(userId);
    var response = await query.get();
    user = response.data();
    print(user);
    return user;
  }

  static storeUserDetails({email, pass, name, contact, uid}) {
    _db.collection(DBCollection.customer).doc(uid).set({
      'name': name,
      'email': email,
      'uid': uid,
      'contact': contact,
      'registration_date_time': Timestamp.now()
    });
  }
}
