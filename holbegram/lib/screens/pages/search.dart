// import 'package:flutter/material.dart';

// class Search extends StatelessWidget {
//   const Search({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text('Search')));
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // Search bar (comme la maquette)
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(70),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//             child: Container(
//               height: 46,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF2F2F2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   hintText: "Search",
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 12),
//                 ),
//                 onChanged: (_) {
//                   // UI only (pas obligatoire pour la task)
//                   setState(() {});
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('posts')
//             .orderBy('datePublished', descending: true) // ✅ ordre chrono
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final docs = snapshot.data!.docs;

//           // récupère les urls valides (Cloudinary)
//           final images = docs
//               .map((d) => (d.data() as Map<String, dynamic>)['postUrl'])
//               .whereType<String>()
//               .where((url) => url.isNotEmpty && url.startsWith('http'))
//               .toList();

//           if (images.isEmpty) {
//             return const Center(child: Text("No images yet"));
//           }

//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//             child: MasonryGridView.count(
//               crossAxisCount: 3,
//               mainAxisSpacing: 6,
//               crossAxisSpacing: 6,
//               itemCount: images.length,
//               itemBuilder: (context, index) {
//                 final url = images[index];

//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(6),
//                   child: AspectRatio(
//                     // Variation de tailles pour effet “staggered”
//                     aspectRatio: (index % 7 == 0) ? 1 / 1.4 : 1 / 1,
//                     child: Image.network(
//                       url,
//                       fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) => Container(
//                         color: const Color(0xFFF2F2F2),
//                         child: const Icon(Icons.image, color: Colors.grey),
//                       ),
//                       loadingBuilder: (context, child, progress) {
//                         if (progress == null) return child;
//                         return Container(
//                           color: const Color(0xFFF2F2F2),
//                           child: const Center(
//                             child: SizedBox(
//                               width: 18,
//                               height: 18,
//                               child: CircularProgressIndicator(strokeWidth: 2),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // ✅ Search bar (comme la maquette)
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(70),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//             child: Container(
//               height: 46,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF2F2F2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   hintText: "Search",
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 12),
//                 ),
//                 onChanged: (_) => setState(() {}),
//               ),
//             ),
//           ),
//         ),
//       ),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('posts')
//             .orderBy('datePublished', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           final docs = snapshot.data!.docs;

//           final images = docs
//               .map((d) => (d.data() as Map<String, dynamic>)['postUrl'])
//               .whereType<String>()
//               .where((url) => url.isNotEmpty && url.startsWith('http'))
//               .toList();

//           if (images.isEmpty) {
//             return const Center(child: Text("No images yet"));
//           }

//           // ✅ Layout comme l’image : grand + grille
//           final String bigImage = images.first;
//           final List<String> gridImages =
//               images.length > 1 ? images.sublist(1) : [];

//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(6),
//               child: Column(
//                 children: [
//                   // ✅ Grande image en haut
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: Image.network(
//                         bigImage,
//                         fit: BoxFit.cover,
//                         errorBuilder: (_, __, ___) => Container(
//                           color: const Color(0xFFF2F2F2),
//                           child: const Icon(Icons.image, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 6),

//                   // ✅ Grille 3 colonnes en dessous
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: gridImages.length,
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 6,
//                       mainAxisSpacing: 6,
//                       childAspectRatio: 1,
//                     ),
//                     itemBuilder: (context, index) {
//                       final url = gridImages[index];

//                       return ClipRRect(
//                         borderRadius: BorderRadius.circular(6),
//                         child: Image.network(
//                           url,
//                           fit: BoxFit.cover,
//                           errorBuilder: (_, __, ___) => Container(
//                             color: const Color(0xFFF2F2F2),
//                             child: const Icon(Icons.image, color: Colors.grey),
//                           ),
//                           loadingBuilder: (context, child, progress) {
//                             if (progress == null) return child;
//                             return Container(
//                               color: const Color(0xFFF2F2F2),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _netImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (_, __, ___) => Container(
        color: const Color(0xFFF2F2F2),
        child: const Icon(Icons.image, color: Colors.grey),
      ),
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(color: const Color(0xFFF2F2F2));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Search bar (comme la maquette)
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),
          ),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          final images = docs
              .map((d) => (d.data() as Map<String, dynamic>)['postUrl'])
              .whereType<String>()
              .where((url) => url.isNotEmpty && url.startsWith('http'))
              .toList();

          if (images.isEmpty) {
            return const Center(child: Text("No images yet"));
          }

          // ✅ grand en haut + reste en grille
          final String bigImage = images.first;
          final List<String> gridImages =
              images.length > 1 ? images.sublist(1) : <String>[];

          return CustomScrollView(
            slivers: [
              // ✅ Grande image (plus haute comme la maquette)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                sliver: SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 320, // 🔥 hauteur style maquette
                      child: _netImage(bigImage),
                    ),
                  ),
                ),
              ),

              // ✅ Grille staggered (tuiles variables)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childCount: gridImages.length,
                  itemBuilder: (context, index) {
                    final url = gridImages[index];

                    // ✅ variation (comme l’exemple: certaines plus hautes)
                    final bool isBig = index % 7 == 0;

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: isBig ? 220 : 120, // 🔥 variable
                        child: _netImage(url),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
