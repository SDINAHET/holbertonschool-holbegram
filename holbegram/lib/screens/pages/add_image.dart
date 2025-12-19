// import 'package:flutter/material.dart';

// class AddImage extends StatelessWidget {
//   const AddImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text('Add Image')));
//   }
// }

// import 'package:flutter/material.dart';

// class AddImage extends StatefulWidget {
//   const AddImage({super.key});

//   @override
//   State<AddImage> createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   final TextEditingController _captionController = TextEditingController();

//   @override
//   void dispose() {
//     _captionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'New Post',
//           style: TextStyle(
//             fontFamily: 'Billabong',
//             fontSize: 30,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // 👉 upload Firestore ici (étape suivante)
//               Navigator.pop(context); // retour Feed
//             },
//             child: const Text(
//               'Post',
//               style: TextStyle(color: Colors.blue),
//             ),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           Container(
//             width: double.infinity,
//             height: 300,
//             color: Colors.grey[300],
//             child: const Icon(Icons.image, size: 100),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _captionController,
//               decoration: const InputDecoration(
//                 hintText: 'Write a caption...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

// import '../../resources/storage_methods.dart';

// class AddImage extends StatefulWidget {
//   const AddImage({super.key});

//   @override
//   State<AddImage> createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   Uint8List? _image;
//   bool _isLoading = false;
//   final TextEditingController _captionController = TextEditingController();

//   // ⚠️ TEMPORAIRE – à remplacer par Provider getUser
//   final String uid = "demo_uid";
//   final String username = "Holberton";
//   final String profImage =
//       "https://i.imgur.com/BoN9kdC.png";

//   @override
//   void dispose() {
//     _captionController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final XFile? file =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
//     if (file == null) return;

//     final bytes = await file.readAsBytes();
//     setState(() => _image = bytes);
//   }

//   Future<void> _post() async {
//     if (_image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Select an image first")),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final postUrl = await StorageMethods().uploadImageToStorage(
//         file: _image!,
//         uid: uid,
//       );

//       final postId = const Uuid().v4();

//       await FirebaseFirestore.instance.collection('posts').doc(postId).set({
//         "caption": _captionController.text.trim(),
//         "uid": uid,
//         "username": username,
//         "likes": [],
//         "postId": postId,
//         "datePublished": DateTime.now(),
//         "postUrl": postUrl,
//         "profImage": profImage,
//       });

//       if (!mounted) return;
//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'New Post',
//           style: TextStyle(
//             fontFamily: 'Billabong',
//             fontSize: 30,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _isLoading ? null : _post,
//             child: _isLoading
//                 ? const SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : const Text('Post', style: TextStyle(color: Colors.blue)),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           GestureDetector(
//             onTap: _pickImage,
//             child: Container(
//               width: double.infinity,
//               height: 300,
//               color: Colors.grey[300],
//               child: _image == null
//                   ? const Icon(Icons.image, size: 100)
//                   : Image.memory(_image!, fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _captionController,
//               decoration: const InputDecoration(
//                 hintText: 'Write a caption...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

// import '../../resources/storage_methods.dart';

// class AddImage extends StatefulWidget {
//   const AddImage({super.key});

//   @override
//   State<AddImage> createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   Uint8List? _image;
//   bool _isLoading = false;
//   final TextEditingController _captionController = TextEditingController();

//   @override
//   void dispose() {
//     _captionController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final XFile? file =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

//     if (file == null) return;

//     final bytes = await file.readAsBytes();
//     setState(() => _image = bytes);
//   }

//   Future<void> _post() async {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("You must be logged in")),
//       );
//       return;
//     }

//     if (_image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Select an image first")),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final postId = const Uuid().v4();

//       final postUrl = await StorageMethods().uploadPostImage(
//         file: _image!,
//         uid: user.uid,
//         postId: postId,
//       );

//       // Récupère username/photo depuis Firestore si dispo
//       String username = user.email ?? 'user';
//       String profImage = '';

//       final userSnap = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (userSnap.exists) {
//         final data = userSnap.data()!;
//         username = (data['username'] ?? username).toString();
//         profImage = (data['photoUrl'] ?? '').toString();
//       }

//       await FirebaseFirestore.instance.collection('posts').doc(postId).set({
//         "caption": _captionController.text.trim(),
//         "uid": user.uid,
//         "username": username,
//         "likes": [],
//         "postId": postId,
//         "datePublished": DateTime.now(),
//         "postUrl": postUrl,
//         "profImage": profImage,
//       });

//       if (!mounted) return;

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Post published ✅")),
//       );

//       Navigator.pop(context);
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'New Post',
//           style: TextStyle(
//             fontFamily: 'Billabong',
//             fontSize: 30,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _isLoading ? null : _post,
//             child: _isLoading
//                 ? const SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : const Text('Post', style: TextStyle(color: Colors.blue)),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           GestureDetector(
//             onTap: _pickImage,
//             child: Container(
//               width: double.infinity,
//               height: 300,
//               color: Colors.grey[300],
//               child: _image == null
//                   ? const Icon(Icons.image, size: 100)
//                   : Image.memory(_image!, fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _captionController,
//               decoration: const InputDecoration(
//                 hintText: 'Write a caption...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // lib/screens/pages/add_image.dart
// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

// import '../../resources/storage_methods.dart';

// class AddImage extends StatefulWidget {
//   const AddImage({super.key});

//   @override
//   State<AddImage> createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   Uint8List? _imageBytes;
//   String? _imagePath; // ✅ utile pour Windows
//   bool _isLoading = false;
//   final TextEditingController _captionController = TextEditingController();

//   @override
//   void dispose() {
//     _captionController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final XFile? file =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

//     if (file == null) return;

//     final bytes = await file.readAsBytes();

//     setState(() {
//       _imageBytes = bytes;
//       _imagePath = file.path; // ✅ IMPORTANT pour Windows
//     });
//   }

//   Future<void> _post() async {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("You must be logged in")),
//       );
//       return;
//     }

//     if (_imageBytes == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Select an image first")),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final postId = const Uuid().v4();

//       final postUrl = await StorageMethods().uploadPostImage(
//         uid: user.uid,
//         postId: postId,
//         file: _imageBytes!, // ✅ c’est ton Uint8List
//       );

//       // username / photo depuis Firestore
//       String username = user.email ?? 'user';
//       String profImage = '';

//       final userSnap = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (userSnap.exists) {
//         final data = userSnap.data()!;
//         username = (data['username'] ?? username).toString();
//         profImage = (data['photoUrl'] ?? '').toString();
//       }

//       await FirebaseFirestore.instance.collection('posts').doc(postId).set({
//         "caption": _captionController.text.trim(),
//         "uid": user.uid,
//         "username": username,
//         "likes": [],
//         "postId": postId,
//         "datePublished": Timestamp.now(),
//         "postUrl": postUrl,
//         "profImage": profImage,
//       });

//       if (!mounted) return;

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Post published ✅")),
//       );

//       Navigator.pop(context);
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'New Post',
//           style: TextStyle(
//             fontFamily: 'Billabong',
//             fontSize: 30,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _isLoading ? null : _post,
//             child: _isLoading
//                 ? const SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : const Text('Post', style: TextStyle(color: Colors.blue)),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           GestureDetector(
//             onTap: _pickImage,
//             child: Container(
//               width: double.infinity,
//               height: 300,
//               color: Colors.grey[300],
//               child: _imageBytes == null
//                   ? const Icon(Icons.image, size: 100)
//                   : Image.memory(_imageBytes!, fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _captionController,
//               decoration: const InputDecoration(
//                 hintText: 'Write a caption...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // lib/screens/pages/add_image.dart
// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

// import '../../resources/storage_methods.dart';

// class AddImage extends StatefulWidget {
//   const AddImage({super.key});

//   @override
//   State<AddImage> createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   Uint8List? _imageBytes;
//   bool _isLoading = false;
//   final TextEditingController _captionController = TextEditingController();

//   @override
//   void dispose() {
//     _captionController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final XFile? file =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

//     if (file == null) return;

//     final bytes = await file.readAsBytes();

//     setState(() {
//       _imageBytes = bytes;
//     });
//   }

//   Future<void> _post() async {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("You must be logged in")),
//       );
//       return;
//     }

//     if (_imageBytes == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Select an image first")),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final postId = const Uuid().v4();
//       debugPrint("POST ID => $postId");

//       // 1) Upload image vers Firebase Storage
//       final postUrl = await StorageMethods().uploadPostImage(
//         uid: user.uid,
//         postId: postId,
//         file: _imageBytes!,
//       );

//       debugPrint("POST URL => $postUrl");

//       // 2) Récupère username + photo depuis Firestore
//       String username = user.email ?? 'user';
//       String profImage = '';

//       final userSnap = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (userSnap.exists) {
//         final data = userSnap.data()!;
//         username = (data['username'] ?? username).toString();
//         profImage = (data['photoUrl'] ?? '').toString();
//       }

//       // 3) Sauvegarde du post dans Firestore
//       await FirebaseFirestore.instance.collection('posts').doc(postId).set({
//         "caption": _captionController.text.trim(),
//         "uid": user.uid,
//         "username": username,
//         "likes": [],
//         "postId": postId,
//         "datePublished": Timestamp.now(),
//         "postUrl": postUrl,
//         "profImage": profImage,
//       });

//       debugPrint("POST SAVED IN FIRESTORE => $postId");

//       if (!mounted) return;

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Post published ✅")),
//       );

//       // reset (optionnel)
//       setState(() {
//         _imageBytes = null;
//       });
//       _captionController.clear();

//       Navigator.pop(context);
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//       debugPrint("POST ERROR => $e");
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'New Post',
//           style: TextStyle(
//             fontFamily: 'Billabong',
//             fontSize: 30,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _isLoading ? null : _post,
//             child: _isLoading
//                 ? const SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : const Text('Post', style: TextStyle(color: Colors.blue)),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           GestureDetector(
//             onTap: _isLoading ? null : _pickImage,
//             child: Container(
//               width: double.infinity,
//               height: 300,
//               color: Colors.grey[300],
//               child: _imageBytes == null
//                   ? const Icon(Icons.image, size: 100)
//                   : Image.memory(_imageBytes!, fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _captionController,
//               decoration: const InputDecoration(
//                 hintText: 'Write a caption...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// // lib/screens/pages/add_image.dart
// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

// import '../../resources/storage_methods.dart';

// class AddImage extends StatefulWidget {
//   const AddImage({super.key});

//   @override
//   State<AddImage> createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   Uint8List? _imageBytes;
//   bool _isLoading = false;
//   final TextEditingController _captionController = TextEditingController();

//   @override
//   void dispose() {
//     _captionController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final XFile? file =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

//     if (file == null) return;

//     final bytes = await file.readAsBytes();

//     setState(() {
//       _imageBytes = bytes;
//     });
//   }

//   Future<void> _post() async {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("You must be logged in")),
//       );
//       return;
//     }

//     if (_imageBytes == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Select an image first")),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final postId = const Uuid().v4();
//       debugPrint("POST ID => $postId");

//       // 1) Upload image vers Firebase Storage
//       final postUrl = await StorageMethods().uploadPostImage(
//         uid: user.uid,
//         postId: postId,
//         file: _imageBytes!,
//       );

//       debugPrint("POST URL => $postUrl");

//       // 2) Récupère username + photo depuis Firestore
//       String username = user.email ?? 'user';
//       String profImage = '';

//       final userSnap = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();

//       if (userSnap.exists) {
//         final data = userSnap.data()!;
//         username = (data['username'] ?? username).toString();
//         profImage = (data['photoUrl'] ?? '').toString();
//       }

//       // 3) Sauvegarde du post dans Firestore
//       await FirebaseFirestore.instance.collection('posts').doc(postId).set({
//         "caption": _captionController.text.trim(),
//         "uid": user.uid,
//         "username": username,
//         "likes": [],
//         "postId": postId,
//         "datePublished": Timestamp.now(),
//         "postUrl": postUrl,
//         "profImage": profImage,
//       });

//       debugPrint("POST SAVED IN FIRESTORE => $postId");

//       if (!mounted) return;

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Post published ✅")),
//       );

//       // reset (optionnel)
//       setState(() {
//         _imageBytes = null;
//       });
//       _captionController.clear();

//       Navigator.pop(context);
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//       debugPrint("POST ERROR => $e");
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'New Post',
//           style: TextStyle(
//             fontFamily: 'Billabong',
//             fontSize: 30,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _isLoading ? null : _post,
//             child: _isLoading
//                 ? const SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : const Text('Post', style: TextStyle(color: Colors.blue)),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           GestureDetector(
//             onTap: _isLoading ? null : _pickImage,
//             child: Container(
//               width: double.infinity,
//               height: 300,
//               color: Colors.grey[300],
//               child: _imageBytes == null
//                   ? const Icon(Icons.image, size: 100)
//                   : Image.memory(_imageBytes!, fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _captionController,
//               decoration: const InputDecoration(
//                 hintText: 'Write a caption...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/screens/pages/add_image.dart
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../resources/cloudinary_methods.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  Uint8List? _imageBytes;
  bool _isLoading = false;
  final TextEditingController _captionController = TextEditingController();

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? file =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

    if (file == null) return;

    final bytes = await file.readAsBytes();

    setState(() {
      _imageBytes = bytes;
    });
  }

  Future<void> _post() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must be logged in")),
      );
      return;
    }

    if (_imageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select an image first")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final postId = const Uuid().v4();
      debugPrint("POST ID => $postId");

      // 1) Upload image vers Cloudinary (renvoie une URL https)
      final postUrl = await CloudinaryMethods().uploadPostImage(_imageBytes!);
      debugPrint("POST URL (Cloudinary) => $postUrl");

      // 2) Récupère username + photo depuis Firestore
      String username = user.email ?? 'user';
      String profImage = '';

      final userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userSnap.exists && userSnap.data() != null) {
        final data = userSnap.data()!;
        username = (data['username'] ?? username).toString();
        profImage = (data['photoUrl'] ?? '').toString();
      }

      // 3) Sauvegarde du post dans Firestore
      await FirebaseFirestore.instance.collection('posts').doc(postId).set({
        "caption": _captionController.text.trim(),
        "uid": user.uid,
        "username": username,
        "likes": [],
        "postId": postId,
        "datePublished": Timestamp.now(),
        "postUrl": postUrl,
        "profImage": profImage,
      });

      debugPrint("POST SAVED IN FIRESTORE => $postId");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Post published ✅")),
      );

      // reset (optionnel)
      setState(() {
        _imageBytes = null;
      });
      _captionController.clear();

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
      debugPrint("POST ERROR => $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New Post',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _post,
            child: _isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Post', style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _isLoading ? null : _pickImage,
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
              child: _imageBytes == null
                  ? const Icon(Icons.image, size: 100)
                  : Image.memory(_imageBytes!, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _captionController,
              decoration: const InputDecoration(
                hintText: 'Write a caption...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
