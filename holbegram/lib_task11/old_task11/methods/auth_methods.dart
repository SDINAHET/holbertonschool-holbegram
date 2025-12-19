// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;

// import '../models/user.dart';

// class AuthMethode {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   /// LOGIN
//   Future<String> login({
//     required String email,
//     required String password,
//   }) async {
//     if (email.isEmpty || password.isEmpty) {
//       return 'Please fill all the fields';
//     }

//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return 'success';
//     } on FirebaseAuthException catch (e) {
//       return e.message ?? 'Login failed';
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   /// SIGN UP
//   Future<String> signUpUser({
//     required String email,
//     required String password,
//     required String username,
//     Uint8List? file,
//   }) async {
//     if (email.isEmpty || password.isEmpty || username.isEmpty) {
//       return 'Please fill all the fields';
//     }

//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User user = userCredential.user!;

//       // TODO: upload `file` to Cloudinary (http) and get photoUrl
//       final String photoUrl = '';

//       final Users users = Users(
//         uid: user.uid,
//         email: email,
//         username: username,
//         bio: '',
//         photoUrl: photoUrl,
//         followers: [],
//         following: [],
//         posts: [],
//         saved: [],
//         searchKey: username.isNotEmpty ? username[0].toLowerCase() : '',
//       );

//       await _firestore.collection("users").doc(user.uid).set(users.toJson());

//       return 'success';
//     } on FirebaseAuthException catch (e) {
//       return e.message ?? 'Sign up failed';
//     } catch (e) {
//       return e.toString();
//     }
//   }

//     /// GET CURRENT USER DETAILS
// 	Future<Users> getUserDetails() async {
// 		User currentUser = _auth.currentUser!;

// 		DocumentSnapshot snap =
// 			await _firestore.collection('users').doc(currentUser.uid).get();

// 		return Users.fromSnap(snap);
// 	}

// }


// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../models/user.dart';

// class AuthMethode {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   /// LOGIN
//   Future<String> login({
//     required String email,
//     required String password,
//   }) async {
//     if (email.isEmpty || password.isEmpty) {
//       return 'Please fill all the fields';
//     }

//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return 'success';
//     } on FirebaseAuthException catch (e) {
//       return e.message ?? 'Login failed';
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   /// SIGN UP (Email / Password)
//   Future<String> signUpUser({
//     required String email,
//     required String password,
//     required String username,
//     Uint8List? file, // (pas utilisé pour l'instant)
//   }) async {
//     if (email.isEmpty || password.isEmpty || username.isEmpty) {
//       return 'Please fill all the fields';
//     }

//     try {
//       final UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       final User user = userCredential.user!;

//       // ✅ Pour l’instant pas d’upload image (Cloudinary/Firebase Storage)
//       // Si tu veux, on branchera file plus tard
//       final String photoUrl = user.photoURL ?? '';

//       final Users users = Users(
//         uid: user.uid,
//         email: email,
//         username: username,
//         bio: '',
//         photoUrl: photoUrl,
//         followers: [],
//         following: [],
//         posts: [],
//         saved: [],
//         searchKey: username.isNotEmpty ? username[0].toLowerCase() : '',
//       );

//       await _firestore.collection("users").doc(user.uid).set(users.toJson());
//       return 'success';
//     } on FirebaseAuthException catch (e) {
//       return e.message ?? 'Sign up failed';
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   /// GOOGLE SIGN-IN
//   Future<String> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) return 'cancelled';

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);

//       final User user = userCredential.user!;

//       final DocumentReference<Map<String, dynamic>> docRef =
//           _firestore.collection("users").doc(user.uid);

//       final doc = await docRef.get();

//       // ✅ Crée le user Firestore s’il n’existe pas encore
//       if (!doc.exists) {
//         final String username = user.displayName ?? 'User';
//         final String photoUrl = user.photoURL ?? '';

//         final Users users = Users(
//           uid: user.uid,
//           email: user.email ?? '',
//           username: username,
//           bio: '',
//           photoUrl: photoUrl,
//           followers: [],
//           following: [],
//           posts: [],
//           saved: [],
//           searchKey: username.isNotEmpty ? username[0].toLowerCase() : '',
//         );

//         await docRef.set(users.toJson());
//       }

//       return 'success';
//     } on FirebaseAuthException catch (e) {
//       return e.message ?? 'Google sign-in failed';
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   /// GET CURRENT USER DETAILS
//   Future<Users> getUserDetails() async {
//     final User currentUser = _auth.currentUser!;
//     final DocumentSnapshot snap =
//         await _firestore.collection('users').doc(currentUser.uid).get();

//     return Users.fromSnap(snap);
//   }
// }

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class AuthMethode {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// LOGIN
  Future<String> login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return 'Please fill all the fields';
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Login failed';
    } catch (e) {
      return e.toString();
    }
  }

  /// SIGN UP (Email / Password)
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file, // (pas utilisé pour l'instant)
  }) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return 'Please fill all the fields';
    }

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User user = userCredential.user!;
      final String photoUrl = user.photoURL ?? '';

      final Users users = Users(
        uid: user.uid,
        email: email,
        username: username,
        bio: '',
        photoUrl: photoUrl,
        followers: [],
        following: [],
        posts: [],
        saved: [],
        searchKey: username.isNotEmpty ? username[0].toLowerCase() : '',
      );

      await _firestore.collection("users").doc(user.uid).set(users.toJson());
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Sign up failed';
    } catch (e) {
      return e.toString();
    }
  }

  /// GOOGLE SIGN-IN (google_sign_in v7+)
  Future<String> signInWithGoogle() async {
    try {
      // v7: singleton + initialize obligatoire
      await GoogleSignIn.instance.initialize();

      // v7: authenticate() remplace l'ancien signIn()
      final GoogleSignInAccount googleUser =
          await GoogleSignIn.instance.authenticate();

      // Auth (OpenID): idToken ici
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      // v7: accessToken via authorizationClient + scopes
      // (FirebaseAuth a besoin d'un accessToken)
      const scopes = <String>['email'];
      final GoogleSignInClientAuthorization authorization =
          await googleUser.authorizationClient.authorizeScopes(scopes);

      final String accessToken = authorization.accessToken;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User user = userCredential.user!;

      final DocumentReference<Map<String, dynamic>> docRef =
          _firestore.collection("users").doc(user.uid);

      final doc = await docRef.get();

      // Crée le user Firestore s’il n’existe pas encore
      if (!doc.exists) {
        final String username = user.displayName ?? 'User';
        final String photoUrl = user.photoURL ?? '';

        final Users users = Users(
          uid: user.uid,
          email: user.email ?? '',
          username: username,
          bio: '',
          photoUrl: photoUrl,
          followers: [],
          following: [],
          posts: [],
          saved: [],
          searchKey: username.isNotEmpty ? username[0].toLowerCase() : '',
        );

        await docRef.set(users.toJson());
      }

      return 'success';
    } on GoogleSignInException catch (e) {
      return 'GoogleSignInException: ${e.code}';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Google sign-in failed';
    } catch (e) {
      return e.toString();
    }
  }

  /// GET CURRENT USER DETAILS
  Future<Users> getUserDetails() async {
    final User currentUser = _auth.currentUser!;
    final DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return Users.fromSnap(snap);
  }
}
