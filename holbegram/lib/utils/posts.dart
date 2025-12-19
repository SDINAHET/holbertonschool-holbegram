// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/user_provider.dart';

// class Posts extends StatefulWidget {
//   const Posts({super.key});

//   @override
//   State<Posts> createState() => _PostsState();
// }

// class _PostsState extends State<Posts> {
//   @override
//   Widget build(BuildContext context) {
//     // Provider getUser (used as requested)
//     final user = Provider.of<UserProvider>(context).getUser;

//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error ${snapshot.error}'));
//         }

//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final data = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             final post = data[index].data() as Map<String, dynamic>;

//             return SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsetsGeometry.lerp(
//                   const EdgeInsets.all(8),
//                   const EdgeInsets.all(8),
//                   10,
//                 ),
//                 height: 540,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 40,
//                             height: 40,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                             ),
//                             clipBehavior: Clip.antiAlias,
//                             child: Image.network(
//                               post['profImage'] ?? '',
//                               fit: BoxFit.cover,
//                               errorBuilder: (_, __, ___) =>
//                                   const Icon(Icons.person),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             post['username'] ?? '',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             icon: const Icon(Icons.more_horiz),
//                             onPressed: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text('Post Deleted')),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(post['caption'] ?? ''),
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     Container(
//                       width: 350,
//                       height: 350,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       clipBehavior: Clip.antiAlias,
//                       child: Image.network(
//                         post['postUrl'] ?? '',
//                         fit: BoxFit.cover,
//                         errorBuilder: (_, __, ___) =>
//                             const Center(child: Icon(Icons.image)),
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     // Icons like in the picture
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.favorite_border),
//                             onPressed: () {},
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.chat_bubble_outline),
//                             onPressed: () {},
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.send),
//                             onPressed: () {},
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             icon: const Icon(Icons.bookmark_border),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           '${(post['likes'] as List?)?.length ?? 0} Liked',
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/user_provider.dart';

// class Posts extends StatefulWidget {
//   const Posts({super.key});

//   @override
//   State<Posts> createState() => _PostsState();
// }

// class _PostsState extends State<Posts> {
//   @override
//   Widget build(BuildContext context) {
//     // Provider demandé dans le sujet (même si pas utilisé ici)
//     Provider.of<UserProvider>(context).getUser;

//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('posts')
//           .orderBy('datePublished', descending: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final data = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             final post = data[index].data() as Map<String, dynamic>;

//             final String username = (post['username'] ?? '').toString();
//             final String caption = (post['caption'] ?? '').toString();
//             final String postUrl = (post['postUrl'] ?? '').toString();
//             final String profImage = (post['profImage'] ?? '').toString();
//             final int likesCount =
//                 (post['likes'] as List?)?.length ?? 0;

//             return Container(
//               margin: const EdgeInsets.all(8),
//               padding: const EdgeInsets.only(bottom: 12),
//               height: 540,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // 🔹 HEADER
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 40,
//                           height: 40,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                           ),
//                           clipBehavior: Clip.antiAlias,
//                           child: profImage.isEmpty
//                               ? const Icon(Icons.person)
//                               : Image.network(
//                                   profImage,
//                                   fit: BoxFit.cover,
//                                 ),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           username,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.more_horiz),
//                           onPressed: () {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Post Deleted'),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),

//                   // 🔹 CAPTION
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: Text(caption),
//                   ),

//                   const SizedBox(height: 10),

//                   // 🔹 IMAGE
//                   Container(
//                     width: double.infinity,
//                     height: 350,
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     clipBehavior: Clip.antiAlias,
//                     child: postUrl.isEmpty
//                         ? const Center(child: Icon(Icons.image))
//                         : Image.network(
//                             postUrl,
//                             fit: BoxFit.cover,
//                           ),
//                   ),

//                   const SizedBox(height: 10),

//                   // 🔹 ACTION ICONS
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.favorite_border),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.chat_bubble_outline),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.send),
//                           onPressed: () {},
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.bookmark_border),
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),

//                   // 🔹 LIKES
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(
//                       '$likesCount Liked',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/user_provider.dart';
// import '../resources/firestore_methods.dart';

// class Posts extends StatefulWidget {
//   const Posts({super.key});

//   @override
//   State<Posts> createState() => _PostsState();
// }

// class _PostsState extends State<Posts> {
//   @override
//   Widget build(BuildContext context) {
//     // demandé dans la consigne (même si pas utilisé directement ici)
//     Provider.of<UserProvider>(context).getUser;

//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error ${snapshot.error}'));
//         }

//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final data = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             final post = data[index].data() as Map<String, dynamic>;

//             final String username = (post['username'] ?? '').toString();
//             final String caption = (post['caption'] ?? '').toString();
//             final String postUrl = (post['postUrl'] ?? '').toString();
//             final String profImage = (post['profImage'] ?? '').toString();
//             final int likesCount = (post['likes'] as List?)?.length ?? 0;

//             // return SingleChildScrollView(
//             //   child: Container(
//             //     margin: EdgeInsetsGeometry.lerp(
//             //       const EdgeInsets.all(8),
//             //       const EdgeInsets.all(8),
//             //       10,
//             //     ),
//             final user = Provider.of<UserProvider>(context).getUser;
//             final likes = (post['likes'] is List) ? post['likes'] as List : [];
//             final postId = (post['postId'] ?? data[index].id).toString();

//               return Container(
//                 margin: const EdgeInsets.all(8),
//                 height: 540,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(
//                   children: [
//                     // HEADER
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 40,
//                             height: 40,
//                             decoration: const BoxDecoration(shape: BoxShape.circle),
//                             clipBehavior: Clip.antiAlias,
//                             child: (profImage.isEmpty)
//                                 ? const Icon(Icons.person)
//                                 : Image.network(
//                                     profImage,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (_, __, ___) => const Icon(Icons.person),
//                                   ),
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             username,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             icon: const Icon(Icons.more_horiz),
//                             onPressed: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text("Post Deleted")),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),

//                     // CAPTION
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(caption),
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     // IMAGE
//                     Container(
//                       width: 350,
//                       height: 350,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       clipBehavior: Clip.antiAlias,
//                       child: (postUrl.isEmpty)
//                           ? const Center(child: Icon(Icons.image))
//                           : Image.network(
//                               postUrl,
//                               fit: BoxFit.cover,
//                               errorBuilder: (_, __, ___) =>
//                                   const Center(child: Icon(Icons.image)),
//                             ),
//                     ),

//                     // ACTION ICONS
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             (user != null && likes.contains(user.uid))
//                                 ? Icons.favorite
//                                 : Icons.favorite_border,
//                             color: (user != null && likes.contains(user.uid))
//                                 ? Colors.red
//                                 : Colors.black,
//                           ),
//                           onPressed: user == null
//                               ? null
//                               : () async {
//                                   try {
//                                     await FirestoreMethods().likePost(
//                                       postId: postId,
//                                       uid: user.uid,
//                                       likes: likes,
//                                     );
//                                   } catch (e) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text(e.toString())),
//                                     );
//                                   }
//                                 },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.chat_bubble_outline),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.send),
//                           onPressed: () {},
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.bookmark_border),
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),

//                     // LIKES
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           '${likes.length} Liked',
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             );
//           },
//         );
//       },
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/user_provider.dart';
// import '../resources/firestore_methods.dart';

// class Posts extends StatefulWidget {
//   const Posts({super.key});

//   @override
//   State<Posts> createState() => _PostsState();
// }

// class _PostsState extends State<Posts> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final data = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             final post = data[index].data() as Map<String, dynamic>;

//             final String username = (post['username'] ?? '').toString();
//             final String caption = (post['caption'] ?? '').toString();
//             final String postUrl = (post['postUrl'] ?? '').toString();
//             final String profImage = (post['profImage'] ?? '').toString();

//             final user = Provider.of<UserProvider>(context).getUser;
//             final List likes =
//                 (post['likes'] is List) ? post['likes'] as List : [];
//             final String postId =
//                 (post['postId'] ?? data[index].id).toString();

//             return Container(
//               margin: const EdgeInsets.all(8),
//               height: 540,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Column(
//                 children: [
//                   // HEADER
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 40,
//                           height: 40,
//                           decoration:
//                               const BoxDecoration(shape: BoxShape.circle),
//                           clipBehavior: Clip.antiAlias,
//                           child: profImage.isEmpty
//                               ? const Icon(Icons.person)
//                               : Image.network(
//                                   profImage,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (_, __, ___) =>
//                                       const Icon(Icons.person),
//                                 ),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           username,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.more_horiz),
//                           onPressed: () {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text("Post Deleted"),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),

//                   // CAPTION
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(caption),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   // IMAGE
//                   Container(
//                     width: 350,
//                     height: 350,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     clipBehavior: Clip.antiAlias,
//                     child: postUrl.isEmpty
//                         ? const Center(child: Icon(Icons.image))
//                         : Image.network(
//                             postUrl,
//                             fit: BoxFit.cover,
//                             errorBuilder: (_, __, ___) =>
//                                 const Center(child: Icon(Icons.image)),
//                           ),
//                   ),

//                   // ACTION ICONS
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           (user != null && likes.contains(user.uid))
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           color: (user != null && likes.contains(user.uid))
//                               ? Colors.red
//                               : Colors.black,
//                         ),
//                         onPressed: user == null
//                             ? null
//                             : () async {
//                                 try {
//                                   await FirestoreMethods().likePost(
//                                     postId: postId,
//                                     uid: user.uid,
//                                     likes: likes,
//                                   );
//                                 } catch (e) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text(e.toString())),
//                                   );
//                                 }
//                               },
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.chat_bubble_outline),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.send),
//                         onPressed: () {},
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         icon: const Icon(Icons.bookmark_border),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),

//                   // LIKES
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         '${likes.length} Liked',
//                         style:
//                             const TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/user_provider.dart';
// import '../resources/firestore_methods.dart';

// class Posts extends StatefulWidget {
//   const Posts({super.key});

//   @override
//   State<Posts> createState() => _PostsState();
// }

// class _PostsState extends State<Posts> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final data = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             final post = data[index].data() as Map<String, dynamic>;

//             final String username = (post['username'] ?? '').toString();
//             final String caption = (post['caption'] ?? '').toString();
//             final String postUrl = (post['postUrl'] ?? '').toString();
//             final String profImage = (post['profImage'] ?? '').toString();

//             final user = Provider.of<UserProvider>(context).getUser;
//             final List likes =
//                 (post['likes'] is List) ? post['likes'] as List : [];
//             final String postId =
//                 (post['postId'] ?? data[index].id).toString();

//             return Container(
//               margin: const EdgeInsets.all(8),
//               height: 540,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Column(
//                 children: [
//                   // HEADER
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 40,
//                           height: 40,
//                           decoration:
//                               const BoxDecoration(shape: BoxShape.circle),
//                           clipBehavior: Clip.antiAlias,
//                           child: (profImage.isEmpty || !profImage.startsWith('http'))
//                               ? const Icon(Icons.person)
//                               : Image.network(
//                                   profImage,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (_, __, ___) =>
//                                       const Icon(Icons.person),
//                                 ),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           username,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.more_horiz),
//                           onPressed: () {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("Post Deleted")),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),

//                   // CAPTION
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(caption),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   // IMAGE
//                   Container(
//                     width: 350,
//                     height: 350,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     clipBehavior: Clip.antiAlias,
//                     child: (postUrl.isEmpty || !postUrl.startsWith('http'))
//                         ? const Center(child: Icon(Icons.image))
//                         : Image.network(
//                             postUrl,
//                             fit: BoxFit.cover,
//                             errorBuilder: (_, __, ___) =>
//                                 const Center(child: Icon(Icons.image)),
//                           ),
//                   ),

//                   // ACTION ICONS
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           (user != null && likes.contains(user.uid))
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           color: (user != null && likes.contains(user.uid))
//                               ? Colors.red
//                               : Colors.black,
//                         ),
//                         onPressed: user == null
//                             ? null
//                             : () async {
//                                 try {
//                                   await FirestoreMethods().likePost(
//                                     postId: postId,
//                                     uid: user.uid,
//                                     likes: likes,
//                                   );
//                                 } catch (e) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text(e.toString())),
//                                   );
//                                 }
//                               },
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.chat_bubble_outline),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.send),
//                         onPressed: () {},
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         icon: const Icon(Icons.bookmark_border),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),

//                   // LIKES
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         '${likes.length} Liked',
//                         style: const TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }


// lib/utils/posts.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    // demandé dans la consigne (même si pas utilisé directement ici)
    Provider.of<UserProvider>(context).getUser;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!.docs;

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final post = data[index].data() as Map<String, dynamic>;

            final String username = (post['username'] ?? '').toString();
            final String caption = (post['caption'] ?? '').toString();
            final String postUrl = (post['postUrl'] ?? '').toString();
            final String profImage = (post['profImage'] ?? '').toString();

            final user = Provider.of<UserProvider>(context).getUser;
            final List likes =
                (post['likes'] is List) ? post['likes'] as List : [];
            final String postId =
                (post['postId'] ?? data[index].id).toString();

            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsetsGeometry.lerp(
                  const EdgeInsets.all(8),
                  const EdgeInsets.all(8),
                  10,
                ),
                height: 540,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    // HEADER
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: (profImage.isEmpty ||
                                    !profImage.startsWith('http'))
                                ? const Icon(Icons.person)
                                : Image.network(
                                    profImage,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.person),
                                  ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            username,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.more_horiz),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Post Deleted"),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // CAPTION
                    SizedBox(
                      child: Text(caption),
                    ),

                    const SizedBox(height: 10),

                    // IMAGE
                    Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: (postUrl.isEmpty || !postUrl.startsWith('http'))
                          ? const Center(child: Icon(Icons.image))
                          : Image.network(
                              postUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const Center(child: Icon(Icons.image)),
                            ),
                    ),

                    // ICONS (comme sur l’image)
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            (user != null && likes.contains(user.uid))
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: (user != null && likes.contains(user.uid))
                                ? Colors.red
                                : Colors.black,
                          ),
                          onPressed: user == null
                              ? null
                              : () async {
                                  try {
                                    await FirestoreMethods().likePost(
                                      postId: postId,
                                      uid: user.uid,
                                      likes: likes,
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())),
                                    );
                                  }
                                },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chat_bubble_outline),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.bookmark_border),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // LIKES
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${likes.length} Liked',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
