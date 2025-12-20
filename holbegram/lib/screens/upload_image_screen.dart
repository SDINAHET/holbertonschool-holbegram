import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../methods/auth_methods.dart';


class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  const AddPicture({
    super.key,
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  static const red = Color(0xFFD94335);
  Uint8List? _image;

  void selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file == null) return;

    final bytes = await file.readAsBytes();
    setState(() => _image = bytes);
  }

  void selectImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.camera);

    if (file == null) return;

    final bytes = await file.readAsBytes();
    setState(() => _image = bytes);
  }

  @override
  Widget build(BuildContext context) {
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
                  // Have an account? Log in (top right)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Have an account? ',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      _HoverLink(
                        text: 'Log in',
                        onTap: () => Navigator.pushNamed(context, '/login'),
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

                  Text(
                    'Hello, ${widget.username} Welcome to\nHolbegram.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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

                  // Avatar: icon OR selected image
                  // Center(
                  //   child: SizedBox(
                  //     width: 150,
                  //     height: 150,
                  //     child: _image == null
                  //         ? Icon(
                  //             Icons.person_outline,
                  //             size: 150,
                  //             color: Colors.black.withOpacity(0.9),
                  //           )
                  //         : ClipRRect(
                  //             borderRadius: BorderRadius.circular(999),
                  //             child: Image.memory(
                  //               _image!,
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //   ),
                  // ),
                  // Avatar: asset icon OR selected image (comme la consigne)
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: _image == null
                          ? Image.asset(
                              'assets/icons/Sample_User_Icon.png',
                              fit: BoxFit.contain,
                            )
                          : ClipOval(
                              child: Image.memory(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Gallery / Camera buttons
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 36,
                    runSpacing: 16,
                    children: [
                      _IconSquareButton(
                        icon: Icons.image_outlined,
                        onTap: selectImageFromGallery,
                      ),
                      _IconSquareButton(
                        icon: Icons.photo_camera_outlined,
                        onTap: selectImageFromCamera,
                      ),
                    ],
                  ),

                  const SizedBox(height: 26),

                  // // Next button
                  // Center(
                  //   child: SizedBox(
                  //     width: 120,
                  //     height: 42,
                  //     child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: red,
                  //         foregroundColor: Colors.white,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4),
                  //         ),
                  //         elevation: 0,
                  //       ),
                  //     //   onPressed: () {
                  //     //     if (_image == null) {
                  //     //       ScaffoldMessenger.of(context).showSnackBar(
                  //     //         const SnackBar(
                  //     //           content: Text('Please select an image first.'),
                  //     //         ),
                  //     //       );
                  //     //       return;
                  //     //     }

                  //     //     // ✅ Task 7: image is selected and ready
                  //     //     // If you want, next step is to upload it to Cloudinary
                  //     //     // using StorageMethods (you’ll do it in signup flow).
                  //     //     //
                  //     //     // Example (later):
                  //     //     // final url = await StorageMethods()
                  //     //     //     .uploadImageToStorage(false, 'profilePics', _image!);

                  //     //     Navigator.pushNamed(context, '/home'); // or next step
                  //     //   },
                  //     //   child: const Text(
                  //     //     'Next',
                  //     //     style: TextStyle(
                  //     //       fontSize: 18,
                  //     //       fontWeight: FontWeight.w700,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     onPressed: () async {
                  //       if (_image == null) {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           const SnackBar(
                  //             content: Text('Please select an image first.'),
                  //           ),
                  //         );
                  //         return;
                  //       }

                  //       final res = await AuthMethode().signUpUser(
                  //         email: widget.email,
                  //         username: widget.username,
                  //         password: widget.password,
                  //         file: _image!,
                  //       );

                  //       if (res == 'success') {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           const SnackBar(content: Text('success')),
                  //         );
                  //         Navigator.pushReplacementNamed(context, '/home');
                  //       } else {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(content: Text(res)),
                  //         );
                  //       }
                  //     },
                  //   ),
                  // ),
                // Next button
                  // Center(
                  //   child: SizedBox(
                  //     width: 200,
                  //     height: 200,
                  //     child: _image == null
                  //         ? Image.asset(
                  //             'assets/icons/Sample_User_Icon.png',
                  //             fit: BoxFit.contain,
                  //           )
                  //         : ClipOval(
                  //             child: Image.memory(
                  //               _image!,
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //   ),
                  // ),
                  // const SizedBox(height: 22),

                  // Wrap(
                  //   alignment: WrapAlignment.center,
                  //   spacing: 36,
                  //   runSpacing: 16,
                  //   children: [
                  //     _IconSquareButton(
                  //       icon: Icons.image_outlined,
                  //       onTap: selectImageFromGallery,
                  //     ),
                  //     _IconSquareButton(
                  //       icon: Icons.photo_camera_outlined,
                  //       onTap: selectImageFromCamera,
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 26),

                  Center(
                    child: SizedBox(
                      width: 120,
                      height: 42,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () async {
                          if (_image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select an image first.'),
                              ),
                            );
                            return;
                          }

                          // ✅ Task 8: Call signUpUser with correct data
                          final res = await AuthMethode().signUpUser(
                            email: widget.email,
                            username: widget.username,
                            password: widget.password,
                            file: _image!,
                          );

                          if (res == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('success')),
                            );
                            // Navigator.pushReplacementNamed(context, '/home');
                            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(res)),
                            );
                          }
                        },
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
  final VoidCallback onTap;

  const _IconSquareButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD94335);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        // decoration: BoxDecoration(
        //   border: Border.all(color: red, width: 2),
        //   borderRadius: BorderRadius.circular(8),
        //   color: Colors.white,
        // ),
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
