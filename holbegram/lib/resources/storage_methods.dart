import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Uuid _uuid = const Uuid();

  /// Upload image générique.
  /// Exemple de chemin final: posts/<uid>/<postId>.jpg
  Future<String> uploadImageToStorage({
    required Uint8List file,
    required String uid,
    required String folder,
    String? fileName, // ex: postId
  }) async {
    try {
      final String id = fileName ?? _uuid.v4();
      final Reference ref = _storage.ref().child(folder).child(uid).child('$id.jpg');

      final TaskSnapshot snap = await ref.putData(
        file,
        SettableMetadata(contentType: 'image/jpeg'),
      );

      final String url = await snap.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      // message clair dans ton SnackBar
      throw Exception('[FirebaseStorage:${e.code}] ${e.message}');
    } catch (e) {
      throw Exception('Upload failed: $e');
    }
  }

  /// Upload spécifique pour un post
  Future<String> uploadPostImage({
    required Uint8List file,
    required String uid,
    String? postId,
  }) async {
    return uploadImageToStorage(
      file: file,
      uid: uid,
      folder: 'posts',
      fileName: postId,
    );
  }
}


// lib/resources/storage_methods.dart (version Windows OK)
// import 'dart:typed_data';
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:uuid/uuid.dart';

// class StorageMethods {
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final Uuid _uuid = const Uuid();

//   /// Upload pour post image.
//   /// Sur Windows: utilise putFile(File(path)) (beaucoup plus fiable).
//   /// Sur mobile/web: utilise putData(bytes)
//   Future<String> uploadPostImage({
//     required String uid,
//     required String postId,
//     Uint8List? bytes,
//     String? filePath,
//   }) async {
//     try {
//       final ref = _storage.ref().child('posts').child(uid).child('$postId.jpg');

//       TaskSnapshot snap;

//       // ✅ WINDOWS / DESKTOP : putFile
//       if (!kIsWeb && (defaultTargetPlatform == TargetPlatform.windows)) {
//         if (filePath == null || filePath.isEmpty) {
//           throw Exception('No file path (Windows upload needs filePath).');
//         }
//         snap = await ref.putFile(
//           File(filePath),
//           SettableMetadata(contentType: 'image/jpeg'),
//         );
//       } else {
//         // ✅ ANDROID / IOS / WEB : putData
//         if (bytes == null) {
//           throw Exception('No bytes provided for upload.');
//         }
//         snap = await ref.putData(
//           bytes,
//           SettableMetadata(contentType: 'image/jpeg'),
//         );
//       }

//       // ✅ IMPORTANT: URL après upload
//       final url = await snap.ref.getDownloadURL();
//       return url;
//     } on FirebaseException catch (e) {
//       throw Exception('[FirebaseStorage:${e.code}] ${e.message}');
//     } catch (e) {
//       throw Exception('Upload failed: $e');
//     }
//   }
// }
