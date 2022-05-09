import 'package:cartefid/models/end_users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Authservices{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  //final GoogleSignIn _googleAuth=GoogleSignIn();

//init Firebase user
Enduser _userFirebaseUser(User? firebaseUser){
  return Enduser(uid :firebaseUser!.uid,);
}

//signin Email/pass(connexion)
Future conexionnuser(String login, String password) async{
  try{
    UserCredential endUserCredentials = await _firebaseAuth.signInWithEmailAndPassword(email: login, password: password);
    User firebaseUser = endUserCredentials.user!;
    return _userFirebaseUser(firebaseUser);
  }
  catch(e){
    print('account login failed , reason :'+e.toString());
    return null;
  }
}
//sign up Email/pass(creer un compte)
  Future inscriptionnuser(String email, String password) async{
    try{
      UserCredential endUserCredentials = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
     // _createUserDocument(docId, mUser);
      User firebaseUser = endUserCredentials.user!;
      return _userFirebaseUser(firebaseUser);
    }
    catch(e){
      print('account login failed , reason :'+e.toString());
      return null;
    }
  }
  Future createUserDocument(String docId, Enduser mUser) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(docId)
          .set(mUser.toJson());
    } catch (e) {
      print(e);
    }
  }
  Future updateUserDocument(String docID) async {
    Enduser uptated = Enduser(phone: '000001', username: 'yahya1');
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(docID)
          .update(uptated.toJsonUpdate());
    } catch (e) {
      print(e);
    }
  }

  Future deleteUser() async {
    try {
      _firebaseFirestore.collection('users').doc('john').delete();
    } catch (e) {
      print(e);
    }
  }
//signout
Future<void> logout() async{
  try{
    print('loging out ..');
    await _firebaseAuth.signOut();
  }
  catch(e){
    print(e.toString());
  }
}
Stream<Enduser>?get user{
  return _firebaseAuth.authStateChanges().map(_userFirebaseUser);
}


}