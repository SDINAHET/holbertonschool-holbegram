// import 'package:cloud_firestore/cloud_firestore.dart';

// class Post {
//   final String caption;
//   final String uid;
//   final String username;
//   final List likes;
//   final String postId;
//   final DateTime datePublished;
//   final String postUrl;
//   final String profImage;

//   Post({
//     required this.caption,
//     required this.uid,
//     required this.username,
//     required this.likes,
//     required this.postId,
//     required this.datePublished,
//     required this.postUrl,
//     required this.profImage,
//   });

//   static Post fromSnap(DocumentSnapshot snap) {
//     final data = snap.data() as Map<String, dynamic>;
//     return Post(
//       caption: data['caption'] ?? '',
//       uid: data['uid'] ?? '',
//       username: data['username'] ?? '',
//       likes: data['likes'] ?? [],
//       postId: data['postId'] ?? snap.id,
//       datePublished: (data['datePublished'] as Timestamp).toDate(),
//       postUrl: data['postUrl'] ?? '',
//       profImage: data['profImage'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'caption': caption,
//         'uid': uid,
//         'username': username,
//         'likes': likes,
//         'postId': postId,
//         'datePublished': datePublished,
//         'postUrl': postUrl,
//         'profImage': profImage,
//       };
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Post {
//   final String caption;
//   final String uid;
//   final String username;
//   final List likes;
//   final String postId;
//   final DateTime datePublished;
//   final String postUrl;
//   final String profImage;

//   const Post({
//     required this.caption,
//     required this.uid,
//     required this.username,
//     required this.likes,
//     required this.postId,
//     required this.datePublished,
//     required this.postUrl,
//     required this.profImage,
//   });

//   static Post fromSnap(DocumentSnapshot snap) {
//     final data = snap.data() as Map<String, dynamic>;

//     return Post(
//       caption: (data['caption'] ?? '').toString(),
//       uid: (data['uid'] ?? '').toString(),
//       username: (data['username'] ?? '').toString(),
//       likes: (data['likes'] ?? []) as List,
//       postId: (data['postId'] ?? '').toString(),
//       datePublished: (data['datePublished'] as Timestamp).toDate(),
//       postUrl: (data['postUrl'] ?? '').toString(),
//       profImage: (data['profImage'] ?? '').toString(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'caption': caption,
//       'uid': uid,
//       'username': username,
//       'likes': likes,
//       'postId': postId,
//       'datePublished': datePublished,
//       'postUrl': postUrl,
//       'profImage': profImage,
//     };
//   }
// }

// lib/models/post.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String caption;
  final String uid;
  final String username;
  final List likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  const Post({
    required this.caption,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;

    final Timestamp? ts = data['datePublished'] as Timestamp?;

    return Post(
      caption: (data['caption'] ?? '').toString(),
      uid: (data['uid'] ?? '').toString(),
      username: (data['username'] ?? '').toString(),
      likes: (data['likes'] ?? []) as List,
      postId: (data['postId'] ?? '').toString(),
      datePublished: ts?.toDate() ?? DateTime.now(),
      postUrl: (data['postUrl'] ?? '').toString(),
      profImage: (data['profImage'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
      'uid': uid,
      'username': username,
      'likes': likes,
      'postId': postId,
      // Firestore accepte DateTime et le convertit en Timestamp
      'datePublished': datePublished,
      'postUrl': postUrl,
      'profImage': profImage,
    };
  }
}
