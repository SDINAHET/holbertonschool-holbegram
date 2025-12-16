// import 'package:flutter/material.dart';

// class UploadImageScreen extends StatelessWidget {
//   const UploadImageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Upload Image Screen'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo (remplace par Image.asset si tu as le logo)
                  Text(
                    "Holbegram",
                    style: TextStyle(
                      fontSize: w < 360 ? 36 : 44,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'cursive', // optionnel si tu as une font
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),

                  // petit “symbole” rouge (placeholder)
                  const Icon(Icons.spa, color: Color(0xFFE74C3C), size: 34),

                  const SizedBox(height: 24),

                  // Texte principal
                  Text(
                    "Hello, John Doe Welcome to\nHolbegram.",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      height: 1.25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "Choose an image from your gallery or take a new one.",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black.withOpacity(0.8),
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 26),

                  // Avatar placeholder
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: const Icon(Icons.person_outline, size: 120, color: Colors.black),
                  ),

                  const SizedBox(height: 26),

                  // Boutons galerie / caméra (Wrap = pas d’overflow)
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 40,
                    runSpacing: 16,
                    children: [
                      _IconSquareButton(
                        icon: Icons.image_outlined,
                        onTap: () {
                          // TODO: pick image from gallery
                        },
                      ),
                      _IconSquareButton(
                        icon: Icons.photo_camera_outlined,
                        onTap: () {
                          // TODO: take photo
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // Next button
                  SizedBox(
                    width: 140,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE74C3C),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // TODO: navigate next
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconSquareButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconSquareButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE74C3C), width: 2),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Icon(icon, color: const Color(0xFFE74C3C), size: 26),
      ),
    );
  }
}
