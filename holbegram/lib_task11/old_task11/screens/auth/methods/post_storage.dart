import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../auth/methods/user_storage.dart'; // <- adapte si ton chemin diffère

class PostStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// uploadPost(caption, uid, username, profImage, image)
  /// Doit utiliser uploadImageToCloudinary() depuis user_storage.dart
  Future<String> uploadPost(
    String caption,
    String uid,
    String username,
    String profImage,
    Uint8List image,
  ) async {
    try {
      final String postId = const Uuid().v4();

      // ✅ upload cloudinary (doit renvoyer url + publicId)
      final result = await uploadImageToCloudinary(
        image,
        folder: "holbegram/posts",
        publicId: postId, // pratique: même id que postId
      );

      final String postUrl = result["secure_url"] as String;
      final String publicId = result["public_id"] as String;

      await _firestore.collection("posts").doc(postId).set({
        "caption": caption.trim(),
        "uid": uid,
        "username": username,
        "likes": [],
        "postId": postId,
        "datePublished": Timestamp.now(),
        "postUrl": postUrl,
        "profImage": profImage,
        "publicId": publicId, // ✅ IMPORTANT pour delete
      });

      return "Ok";
    } catch (e) {
      return e.toString();
    }
  }

  /// deletePost(postId, publicId)
  Future<void> deletePost(String postId, String publicId) async {
    // ⚠️ supprimer sur Cloudinary depuis un client nécessite un backend (API secret)
    // Mais pour la consigne, on fait au moins la suppression Firestore.
    // (Si tu veux VRAIMENT supprimer Cloudinary, je te donne une version delete_by_token juste après.)
    await _firestore.collection("posts").doc(postId).delete();
  }
}
