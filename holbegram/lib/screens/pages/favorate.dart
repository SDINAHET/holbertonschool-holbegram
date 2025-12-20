// import 'package:flutter/material.dart';

// class Favorite extends StatelessWidget {
//   const Favorite({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text('Favorite')));
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Favorite extends StatelessWidget {
//   const Favorite({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         centerTitle: false,
//         title: const Text(
//           "Favorites",
//           style: TextStyle(
//             fontFamily: "Billabong",
//             fontSize: 32,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: user == null
//           ? const Center(child: Text("You must be logged in"))
//           : StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(user.uid)
//                   .collection('savedPosts')
//                   .orderBy('dateSaved', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 }

//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 final docs = snapshot.data!.docs;

//                 if (docs.isEmpty) {
//                   return const Center(child: Text("No favorites yet"));
//                 }

//                 return ListView.builder(
//                   itemCount: docs.length,
//                   itemBuilder: (context, index) {
//                     final data = docs[index].data() as Map<String, dynamic>;
//                     final postUrl = (data['postUrl'] ?? '').toString();

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 10),
//                       width: double.infinity,
//                       height: 300,
//                       child: postUrl.isEmpty
//                           ? Container(
//                               color: const Color(0xFFF2F2F2),
//                               child: const Icon(Icons.image, size: 40),
//                             )
//                           : Image.network(
//                               postUrl,
//                               fit: BoxFit.cover,
//                               errorBuilder: (_, __, ___) => Container(
//                                 color: const Color(0xFFF2F2F2),
//                                 child: const Icon(Icons.image, size: 40),
//                               ),
//                             ),
//                     );
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Favorites",
          style: TextStyle(
            fontFamily: "Billabong",
            fontSize: 32,
            color: Colors.black,
          ),
        ),
      ),
      body: user == null
          ? const Center(child: Text("You must be logged in"))
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .collection('savedPosts')
                  .orderBy('savedAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                if (docs.isEmpty) {
                  return const Center(child: Text("No favorites yet"));
                }

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final url = (data['postUrl'] ?? '').toString();

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AspectRatio(
                        aspectRatio: 1, // carré comme ton exemple
                        child: url.startsWith("http")
                            ? Image.network(url, fit: BoxFit.cover)
                            : Container(
                                color: const Color(0xFFF2F2F2),
                                child: const Icon(Icons.image),
                              ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
