import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../auth/methods/user_storage.dart';

class PostStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String caption,
    String uid,
    String username,
    String profImage,
    Uint8List image,
  ) async {
    try {
      final String postId = const Uuid().v4();

      final result = await uploadImageToCloudinary(
        image,
        folder: "holbegram/posts",
        publicId: postId,
      );

      final String postUrl = result['secure_url'] as String;
      final String publicId = result['public_id'] as String;

      await _firestore.collection('posts').doc(postId).set({
        'caption': caption.trim(),
        'uid': uid,
        'username': username,
        'likes': [],
        'postId': postId,
        'datePublished': Timestamp.now(),
        'postUrl': postUrl,
        'profImage': profImage,
        'publicId': publicId,
      });

      return "Ok";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> deletePost(String postId, String publicId) async {
    await _firestore.collection('posts').doc(postId).delete();
  }
}
