import 'package:amar_tali_app/data/firebase/clients/base_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationRepository extends ChangeNotifier{
  BaseClient client = BaseClient();

  var isLoggedIn = false;
  var changePass = '';


  Future<void> signInWithEmailAndPassword(
      String email,
      String password,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      client.auth.signOut();
      isLoggedIn = false;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        String _userId = value.user!.uid;
        // initializeUserModel(_userId);
        print(_userId.toString());
      });
      isLoggedIn = true;

      print('${isLoggedIn} isLoggedin value from controller');
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> changePassword(String newPassword) async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null) {
      await currentUser.updatePassword(newPassword).then((value){

      }).onError((error, stackTrace){
        changePass = error.toString();
      });
    }
  }

  Future<void> updateUser(String name, String mailAddress, String photoUrl) async{
    await client.auth.currentUser!.updateDisplayName(name);
    await client.auth.currentUser!.updateEmail(mailAddress);
    await client.auth.currentUser!.updatePhotoURL(photoUrl);

  }
}