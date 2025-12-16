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

// import 'package:flutter/material.dart';

// class UploadImageScreen extends StatelessWidget {
//   const UploadImageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 420),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Logo (remplace par Image.asset si tu as le logo)
//                   Text(
//                     "Holbegram",
//                     style: TextStyle(
//                       fontSize: w < 360 ? 36 : 44,
//                       fontWeight: FontWeight.w700,
//                       fontFamily: 'cursive', // optionnel si tu as une font
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),

//                   // petit “symbole” rouge (placeholder)
//                   const Icon(Icons.spa, color: Color(0xFFE74C3C), size: 34),

//                   const SizedBox(height: 24),

//                   // Texte principal
//                   Text(
//                     "Hello, John Doe Welcome to\nHolbegram.",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                       height: 1.25,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 10),

//                   Text(
//                     "Choose an image from your gallery or take a new one.",
//                     style: TextStyle(
//                       fontSize: 13.5,
//                       color: Colors.black.withOpacity(0.8),
//                       height: 1.3,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),

//                   const SizedBox(height: 26),

//                   // Avatar placeholder
//                   Container(
//                     width: 130,
//                     height: 130,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(65),
//                     ),
//                     child: const Icon(Icons.person_outline, size: 120, color: Colors.black),
//                   ),

//                   const SizedBox(height: 26),

//                   // Boutons galerie / caméra (Wrap = pas d’overflow)
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     spacing: 40,
//                     runSpacing: 16,
//                     children: [
//                       _IconSquareButton(
//                         icon: Icons.image_outlined,
//                         onTap: () {
//                           // TODO: pick image from gallery
//                         },
//                       ),
//                       _IconSquareButton(
//                         icon: Icons.photo_camera_outlined,
//                         onTap: () {
//                           // TODO: take photo
//                         },
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 28),

//                   // Next button
//                   SizedBox(
//                     width: 140,
//                     height: 44,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFFE74C3C),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         elevation: 0,
//                       ),
//                       onPressed: () {
//                         // TODO: navigate next
//                       },
//                       child: const Text(
//                         "Next",
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _IconSquareButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;

//   const _IconSquareButton({
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(8),
//       onTap: onTap,
//       child: Container(
//         width: 46,
//         height: 46,
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color(0xFFE74C3C), width: 2),
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white,
//         ),
//         child: Icon(icon, color: const Color(0xFFE74C3C), size: 26),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'login_screen.dart';

// class UploadImageScreen extends StatelessWidget {
//   const UploadImageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const red = Color(0xFFD94335);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 420),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Top right: Have an account? Log in
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Have an account? ',
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       _HoverLink(
//                         text: 'Log in',
//                         onTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (_) => const LoginScreen()),
//                           );
//                         },
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: red,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         hoverStyle: const TextStyle(
//                           fontSize: 13,
//                           color: red,
//                           fontWeight: FontWeight.w600,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 18),

//                   // Holbegram title
//                   const Text(
//                     'Holbegram',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Billabong',
//                       fontSize: 56,
//                       height: 1,
//                       color: Colors.black,
//                     ),
//                   ),

//                   const SizedBox(height: 6),

//                   // Seahorse logo
//                   Center(
//                     child: Image.asset(
//                       'assets/images/seahorse.png',
//                       height: 44,
//                       fit: BoxFit.contain,
//                     ),
//                   ),

//                   const SizedBox(height: 26),

//                   // Main text
//                   const Text(
//                     'Hello, John Doe Welcome to\nHolbegram.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                       height: 1.25,
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   Text(
//                     'Choose an image from your gallery or take a new one.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 13.5,
//                       color: Colors.black.withOpacity(0.65),
//                       height: 1.3,
//                     ),
//                   ),

//                   const SizedBox(height: 26),

//                   // Avatar (simple comme la consigne)
//                   const Center(
//                     child: Icon(
//                       Icons.person_outline,
//                       size: 150,
//                       color: Colors.black,
//                     ),
//                   ),

//                   const SizedBox(height: 26),

//                   // Gallery / Camera buttons
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     spacing: 40,
//                     runSpacing: 16,
//                     children: [
//                       _IconSquareButton(
//                         icon: Icons.image_outlined,
//                         onTap: () {
//                           // TODO gallery picker
//                         },
//                       ),
//                       _IconSquareButton(
//                         icon: Icons.photo_camera_outlined,
//                         onTap: () {
//                           // TODO camera
//                         },
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 24),

//                   // Next button (rectangulaire comme la consigne)
//                   Center(
//                     child: SizedBox(
//                       width: 140,
//                       height: 42,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: red,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           elevation: 0,
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _IconSquareButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;

//   const _IconSquareButton({
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const red = Color(0xFFD94335);

//     return InkWell(
//       borderRadius: BorderRadius.circular(6),
//       onTap: onTap,
//       child: Container(
//         width: 44,
//         height: 44,
//         decoration: BoxDecoration(
//           border: Border.all(color: red, width: 2),
//           borderRadius: BorderRadius.circular(6),
//           color: Colors.white,
//         ),
//         child: Icon(icon, color: red, size: 24),
//       ),
//     );
//   }
// }

// class _HoverLink extends StatefulWidget {
//   final String text;
//   final VoidCallback onTap;
//   final TextStyle style;
//   final TextStyle? hoverStyle;

//   const _HoverLink({
//     required this.text,
//     required this.onTap,
//     required this.style,
//     this.hoverStyle,
//   });

//   @override
//   State<_HoverLink> createState() => _HoverLinkState();
// }

// class _HoverLinkState extends State<_HoverLink> {
//   bool _hover = false;

//   @override
//   Widget build(BuildContext context) {
//     final base = widget.style;
//     final hover = widget.hoverStyle ??
//         base.copyWith(decoration: TextDecoration.underline);

//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       onEnter: (_) => setState(() => _hover = true),
//       onExit: (_) => setState(() => _hover = false),
//       child: InkWell(
//         onTap: widget.onTap,
//         hoverColor: Colors.transparent,
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         child: Text(widget.text, style: _hover ? hover : base),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'login_screen.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD94335);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Have an account? ',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      _HoverLink(
                        text: 'Log in',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        style: const TextStyle(
                          fontSize: 13,
                          color: red,
                          fontWeight: FontWeight.w600,
                        ),
                        hoverStyle: const TextStyle(
                          fontSize: 13,
                          color: red,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'Holbegram',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Billabong',
                      fontSize: 56,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Center(
                    child: Image.asset(
                      'assets/images/seahorse.png',
                      height: 44,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Hello, John Doe Welcome to\nHolbegram.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      height: 1.25,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Choose an image from your gallery or take a new one.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black.withOpacity(0.65),
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 26),

                  Center(
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 140,
                      color: Colors.black.withOpacity(0.9),
                    ),
                  ),

                  const SizedBox(height: 22),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 36,
                    runSpacing: 16,
                    children: const [
                      _IconSquareButton(icon: Icons.image_outlined),
                      _IconSquareButton(icon: Icons.photo_camera_outlined),
                    ],
                  ),

                  const SizedBox(height: 26),

                  Center(
                    child: SizedBox(
                      width: 170,
                      height: 46,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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

  const _IconSquareButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD94335);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: red, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Icon(icon, color: red, size: 26),
      ),
    );
  }
}

class _HoverLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle style;
  final TextStyle? hoverStyle;

  const _HoverLink({
    required this.text,
    required this.onTap,
    required this.style,
    this.hoverStyle,
  });

  @override
  State<_HoverLink> createState() => _HoverLinkState();
}

class _HoverLinkState extends State<_HoverLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final base = widget.style;
    final hover =
        widget.hoverStyle ?? base.copyWith(decoration: TextDecoration.underline);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: widget.onTap,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(widget.text, style: _hover ? hover : base),
      ),
    );
  }
}
