import 'package:app_trilhas/app/models/user.dart' as defaultUser;
import 'package:app_trilhas/shared/utils/api_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseReferences {
  var database = FirebaseDatabase(
    databaseURL: 'https://ecoturistapema-default-rtdb.firebaseio.com/',
  ).reference();

  var auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    if (auth.currentUser != null) {
      return auth.currentUser;
    } else {
      return null;
    }
  }

  Future<defaultUser.User?> loadUserData() async {
    var currentUser = getCurrentUser();

    var databaseReference =
        await database.child('users').child(currentUser!.uid).get();

    defaultUser.User user = defaultUser.User(
      birthDate: databaseReference!.value['birthDate'],
      email: databaseReference.value['email'],
      name: databaseReference.value['name'],
      authMethod: databaseReference.value['auth_method'],
    );

    return user;
  }

  Future<ApiResponse> updateUserData(
      defaultUser.User defaultUser, String actualEmail, String password) async {
    try {
      var currentUser = getCurrentUser();
      if (currentUser != null) {
        await currentUser.reauthenticateWithCredential(
          EmailAuthProvider.credential(email: actualEmail, password: password),
        );
      }
      if (currentUser != null) {
        await currentUser.updateEmail(defaultUser.email!);
        await currentUser.updateDisplayName(defaultUser.name);
      }
      await database
          .child('users')
          .child(currentUser!.uid)
          .update(defaultUser.toJson());

      return ApiResponse.ok(true);
    } on FirebaseException catch (e) {
      if (e.toString().contains(
          'The password is invalid or the user does not have a password.')) {
        return ApiResponse.error('A senha informada está incorreta');
      }
      return ApiResponse.error(
          'Verifique sua conexão com a internet ou tente novamente mais tarde.');
    }
  }
}
