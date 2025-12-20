import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';
import '../screens/pages/methods/post_storage.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    // ✅ demandé dans la consigne (même si pas utilisé directement)
    Provider.of<UserProvider>(context).getUser;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .orderBy('datePublished', descending: true) // ✅ ordre chrono
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
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

            final List likes = (post['likes'] is List) ? post['likes'] as List : [];
            final String postId = (post['postId'] ?? data[index].id).toString();

            // ✅ Task 11 (delete Cloudinary + Firestore)
            final String publicId = (post['publicId'] ?? '').toString();

            return Container(
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
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                          child: (profImage.isEmpty || !profImage.startsWith('http'))
                              ? const Icon(Icons.person)
                              : Image.network(
                                  profImage,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.person),
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

                        // ✅ deletePost avant SnackBar
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () async {
                            try {
                              await PostStorage().deletePost(postId, publicId);

                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Post Deleted")),
                              );
                            } catch (e) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Delete error: $e")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  // CAPTION
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(caption),
                      ),
                    ),
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

                  // ACTION ICONS
                  Row(
                    children: [
                      // ❤️ like
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
                                  if (!context.mounted) return;
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

                      // ✅ TASK 14: bookmark save -> users/{uid}/savedPosts/{postId}
                      if (user == null)
                        IconButton(
                          icon: const Icon(Icons.bookmark_border),
                          onPressed: null,
                        )
                      else
                        StreamBuilder<bool>(
                          stream: FirestoreMethods().isPostSaved(
                            uid: user.uid,
                            postId: postId,
                          ),
                          builder: (context, snap) {
                            final isSaved = snap.data ?? false;

                            return IconButton(
                              icon: Icon(
                                isSaved ? Icons.bookmark : Icons.bookmark_border,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                try {
                                  await FirestoreMethods().toggleSavePost(
                                    uid: user.uid,
                                    postId: postId,
                                    postUrl: postUrl,
                                  );

                                  if (!context.mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(isSaved ? "Removed from Favorites" : "Saved to Favorites"),
                                    ),
                                  );
                                } catch (e) {
                                  if (!context.mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Save error: $e")),
                                  );
                                }
                              },
                            );
                          },
                        ),
                    ],
                  ),

                  // LIKES count
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
            );
          },
        );
      },
    );
  }
}
