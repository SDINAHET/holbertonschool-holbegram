// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'Login Screen ✅',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../widgets/text_field.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'signup_screen.dart';



// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   bool _obscure = true;

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _passCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const red = Color(0xFFD94335);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 420),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 26),

//                   // Titre style Instagram
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

//                   Center(
//                     child: Image.asset(
//                       'assets/images/seahorse.png',
//                       height: 44,
//                       fit: BoxFit.contain,
//                     ),
//                   ),

//                   const SizedBox(height: 22),

//                   CustomTextField(
//                     hintText: 'Email',
//                     controller: _emailCtrl,
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(height: 12),

//                   CustomTextField(
//                     hintText: 'Password',
//                     controller: _passCtrl,
//                     isPassword: true,
//                     obscureText: _obscure,
//                     onToggleObscure: () => setState(() => _obscure = !_obscure),
//                   ),

//                   const SizedBox(height: 18),

//                   SizedBox(
//                     height: 48,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         elevation: 2,
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         'Log in',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 14),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Forgot your login details? '),
//                       GestureDetector(
//                         onTap: () {},
//                         child: const Text(
//                           'Get help logging in',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 14),
//                   const Divider(height: 1),
//                   const SizedBox(height: 14),

//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     const Text("Don't have an account  "),
//                   //     GestureDetector(
//                   //       onTap: () {},
//                   //       child: const Text(
//                   //         'Sign up',
//                   //         style: TextStyle(
//                   //           color: red,
//                   //           fontWeight: FontWeight.bold,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       const Text("Don't have an account "),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //         builder: (context) => const SignupScreen(),
//                       //       ),
//                       //     );
//                       //   },
//                       //   child: const Text(
//                       //     'Sign up',
//                       //     style: TextStyle(
//                       //       color: red,
//                       //       fontWeight: FontWeight.bold,
//                       //     ),
//                       //   ),
//                       // ),
//                       _HoverLink(
//                         text: 'Sign up',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (_) => const SignupScreen()),
//                           );
//                         },
//                         style: const TextStyle(
//                           color: red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),


//                   const SizedBox(height: 18),

//                   Row(
//                     children: const [
//                       Expanded(child: Divider()),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text('OR'),
//                       ),
//                       Expanded(child: Divider()),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   // TextButton(
//                   //   onPressed: () {},
//                   //   style: TextButton.styleFrom(
//                   //     foregroundColor: Colors.black,
//                   //   ),
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.center,
//                   //     children: [
//                   //       Image.asset(
//                   //         'assets/images/google_g.png',
//                   //         height: 20,
//                   //         width: 20,
//                   //       ),
//                   //       const SizedBox(width: 10),
//                   //       const Text(
//                   //         'Sign in with Google',
//                   //         style: TextStyle(
//                   //           fontSize: 16,
//                   //           color: Colors.black,
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(foregroundColor: Colors.black),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/google.svg',
//                           width: 40,
//                           height: 40,
//                         ),
//                         const SizedBox(width: 10),
//                         const Text(
//                           'Sign in with Google',
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),


//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         ),
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
//         splashColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         child: Text(
//           widget.text,
//           style: _hover ? hover : base,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../widgets/text_field.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'signup_screen.dart';
// import 'upload_image_screen.dart';




// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   bool _obscure = true;

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _passCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const red = Color(0xFFD94335);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 420),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 26),

//                   // Titre style Instagram
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

//                   Center(
//                     child: Image.asset(
//                       'assets/images/seahorse.png',
//                       height: 44,
//                       fit: BoxFit.contain,
//                     ),
//                   ),

//                   const SizedBox(height: 22),

//                   CustomTextField(
//                     hintText: 'Email',
//                     controller: _emailCtrl,
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(height: 12),

//                   CustomTextField(
//                     hintText: 'Password',
//                     controller: _passCtrl,
//                     isPassword: true,
//                     obscureText: _obscure,
//                     onToggleObscure: () => setState(() => _obscure = !_obscure),
//                   ),

//                   const SizedBox(height: 18),

//                   SizedBox(
//                     height: 48,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         elevation: 2,
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         'Log in',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 14),

//                   // Row(
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Forgot your login details? '),
//                       // GestureDetector(
//                       //   onTap: () {},
//                       //   child: const Text(
//                       //     'Get help logging in',
//                       //     style: TextStyle(fontWeight: FontWeight.bold),
//                       //   ),
//                       // ),
//                       _HoverLink(
//                         text: 'Get help logging in',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const UploadImageScreen(),
//                             ),
//                           );
//                         },
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                         hoverStyle: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 14),
//                   const Divider(height: 1),
//                   const SizedBox(height: 14),

//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     const Text("Don't have an account  "),
//                   //     GestureDetector(
//                   //       onTap: () {},
//                   //       child: const Text(
//                   //         'Sign up',
//                   //         style: TextStyle(
//                   //           color: red,
//                   //           fontWeight: FontWeight.bold,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       const Text("Don't have an account "),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //         builder: (context) => const SignupScreen(),
//                       //       ),
//                       //     );
//                       //   },
//                       //   child: const Text(
//                       //     'Sign up',
//                       //     style: TextStyle(
//                       //       color: red,
//                       //       fontWeight: FontWeight.bold,
//                       //     ),
//                       //   ),
//                       // ),
//                       _HoverLink(
//                         text: 'Sign up',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (_) => const SignupScreen()),
//                           );
//                         },
//                         style: const TextStyle(
//                           color: red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),


//                   const SizedBox(height: 18),

//                   Row(
//                     children: const [
//                       Expanded(child: Divider()),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text('OR'),
//                       ),
//                       Expanded(child: Divider()),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   // TextButton(
//                   //   onPressed: () {},
//                   //   style: TextButton.styleFrom(
//                   //     foregroundColor: Colors.black,
//                   //   ),
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.center,
//                   //     children: [
//                   //       Image.asset(
//                   //         'assets/images/google_g.png',
//                   //         height: 20,
//                   //         width: 20,
//                   //       ),
//                   //       const SizedBox(width: 10),
//                   //       const Text(
//                   //         'Sign in with Google',
//                   //         style: TextStyle(
//                   //           fontSize: 16,
//                   //           color: Colors.black,
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(foregroundColor: Colors.black),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/google.svg',
//                           width: 40,
//                           height: 40,
//                         ),
//                         const SizedBox(width: 10),
//                         const Text(
//                           'Sign in with Google',
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),


//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         ),
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
//         splashColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         child: Text(
//           widget.text,
//           style: _hover ? hover : base,
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../widgets/text_field.dart';
// import 'signup_screen.dart';
// import 'upload_image_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _passCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const red = Color(0xFFD94335);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 420),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 26),

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

//                   Center(
//                     child: Image.asset(
//                       'assets/images/seahorse.png',
//                       height: 44,
//                       fit: BoxFit.contain,
//                     ),
//                   ),

//                   const SizedBox(height: 22),

//                   TextFieldInput(
//                     hintText: 'Email',
//                     controller: _emailCtrl,
//                     ispassword: false,
//                     keyboardType: TextInputType.emailAddress,
//                     suffixIcon: null,
//                   ),

//                   const SizedBox(height: 12),

//                   TextFieldInput(
//                     hintText: 'Password',
//                     controller: _passCtrl,
//                     ispassword: true,
//                     keyboardType: TextInputType.text,
//                     suffixIcon: null,
//                   ),

//                   const SizedBox(height: 18),

//                   SizedBox(
//                     height: 48,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         elevation: 2,
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         'Log in',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 14),

//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       const Text('Forgot your login details? '),
//                       _HoverLink(
//                         text: 'Get help logging in',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const UploadImageScreen(),
//                             ),
//                           );
//                         },
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 14),
//                   const Divider(height: 1),
//                   const SizedBox(height: 14),

//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       const Text("Don't have an account "),
//                       _HoverLink(
//                         text: 'Sign up',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const SignupScreen(),
//                             ),
//                           );
//                         },
//                         style: const TextStyle(
//                           color: red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 18),

//                   Row(
//                     children: const [
//                       Expanded(child: Divider()),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text('OR'),
//                       ),
//                       Expanded(child: Divider()),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(foregroundColor: Colors.black),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/google.svg',
//                           width: 40,
//                           height: 40,
//                         ),
//                         const SizedBox(width: 10),
//                         const Text(
//                           'Sign in with Google',
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         ),
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
//     final hover =
//         widget.hoverStyle ?? base.copyWith(decoration: TextDecoration.underline);

//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       onEnter: (_) => setState(() => _hover = true),
//       onExit: (_) => setState(() => _hover = false),
//       child: InkWell(
//         onTap: widget.onTap,
//         splashColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         child: Text(widget.text, style: _hover ? hover : base),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../widgets/text_field.dart';
// import 'signup_screen.dart';
// import 'upload_image_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _passCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const red = Color(0xFFD94335);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 420),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 26),
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
//                   Center(
//                     child: Image.asset(
//                       'assets/images/seahorse.png',
//                       height: 44,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const SizedBox(height: 22),

//                   TextFieldInput(
//                     hintText: 'Email',
//                     controller: _emailCtrl,
//                     ispassword: false,
//                     keyboardType: TextInputType.emailAddress,
//                     suffixIcon: null,
//                   ),
//                   const SizedBox(height: 12),
//                   TextFieldInput(
//                     hintText: 'Password',
//                     controller: _passCtrl,
//                     ispassword: true,
//                     keyboardType: TextInputType.text,
//                     suffixIcon: null,
//                   ),

//                   const SizedBox(height: 18),

//                   SizedBox(
//                     height: 48,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         elevation: 2,
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         'Log in',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 14),

//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       const Text('Forgot your login details? '),
//                       _HoverLink(
//                         text: 'Get help logging in',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const UploadImageScreen(),
//                             ),
//                           );
//                         },
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 14),
//                   const Divider(height: 1),
//                   const SizedBox(height: 14),

//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       const Text("Don't have an account "),
//                       _HoverLink(
//                         text: 'Sign up',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const SignupScreen(),
//                             ),
//                           );
//                         },
//                         style: const TextStyle(
//                           color: red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 18),

//                   Row(
//                     children: const [
//                       Expanded(child: Divider()),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text('OR'),
//                       ),
//                       Expanded(child: Divider()),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(foregroundColor: Colors.black),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/google.svg',
//                           width: 40,
//                           height: 40,
//                         ),
//                         const SizedBox(width: 10),
//                         const Text(
//                           'Sign in with Google',
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         ),
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
//     final hover =
//         widget.hoverStyle ?? base.copyWith(decoration: TextDecoration.underline);

//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       onEnter: (_) => setState(() => _hover = true),
//       onExit: (_) => setState(() => _hover = false),
//       child: InkWell(
//         onTap: widget.onTap,
//         splashColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         child: Text(widget.text, style: _hover ? hover : base),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../widgets/text_field.dart';

// class LoginScreen extends StatefulWidget {
//   final TextEditingController emailController;
//   final TextEditingController passwordController;

//   // _passwordVisible : bool default takes true
//   final bool _passwordVisible;

//   const LoginScreen({
//     super.key,
//     required this.emailController,
//     required this.passwordController,
//     bool passwordVisible = true,
//   }) : _passwordVisible = passwordVisible;

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late bool _passwordVisible;

//   @override
//   void initState() {
//     super.initState();
//     _passwordVisible = widget._passwordVisible;
//   }

//   @override
//   void dispose() {
//     // Dispose only the TextEditingController arguments
//     widget.emailController.dispose();
//     widget.passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const red = Color.fromARGB(218, 226, 37, 24);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           // Horizontally of the Column will be : min
//           mainAxisSize: MainAxisSize.min,
//           // Verticale of the Column will be : center
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 28),

//             // App name with Billabong font size 50
//             const Text(
//               'Holbegram',
//               style: TextStyle(
//                 fontFamily: 'Billabong',
//                 fontSize: 50,
//               ),
//             ),

//             // Logo Image (width: 80,height: 60)
//             Image.asset(
//               'assets/images/seahorse.png',
//               width: 80,
//               height: 60,
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 28),

//                   // Email TextFieldInput
//                   TextFieldInput(
//                     controller: widget.emailController,
//                     ispassword: false,
//                     hintText: 'Email',
//                     keyboardType: TextInputType.emailAddress,
//                     suffixIcon: null,
//                   ),

//                   const SizedBox(height: 24),

//                   // Password TextFieldInput
//                   TextFieldInput(
//                     controller: widget.passwordController,
//                     ispassword: !_passwordVisible,
//                     hintText: 'Password',
//                     keyboardType: TextInputType.visiblePassword,
//                     suffixIcon: IconButton(
//                       alignment: Alignment.bottomLeft,
//                       onPressed: () {
//                         setState(() {
//                           _passwordVisible = !_passwordVisible;
//                         });
//                       },
//                       icon: Icon(
//                         _passwordVisible ? Icons.visibility : Icons.visibility_off,
//                         color: red,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 28),

//                   SizedBox(
//                     height: 48,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: WidgetStateProperty.all(red),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         'Log in',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text('Forgot your login details? '),
//                       Text(
//                         'Get help logging in',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Flexible(flex: 0, child: SizedBox.shrink()),
//                     ],
//                   ),

//                   const SizedBox(height: 24),

//                   const Divider(thickness: 2),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Don't have an account "),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'Sign up',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: red,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   Row(
//                     children: const [
//                       Flexible(child: Divider(thickness: 2)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(' OR '),
//                       ),
//                       Flexible(child: Divider(thickness: 2)),
//                     ],
//                   ),

//                   const SizedBox(height: 10),

//                   const googleIconUrl =
//                     'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png';

//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.network(
//                       googleIconUrl,
//                       width: 40,
//                       height: 40,
//                       errorBuilder: (context, error, stackTrace) {
//                         return const SizedBox(width: 40, height: 40);
//                       },
//                     ),
//                     const SizedBox(width: 10),
//                     const Text('Sign in with Google'),
//                   ],
//                 ),


//                   // Row(
//                   //   mainAxisSize: MainAxisSize.min,
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     Image.network(
//                   //       'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png',
//                   //       width: 40,
//                   //       height: 40,
//                   //     ),
//                   //     const SizedBox(width: 10),
//                   //     const Text('Sign in with Google'),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  // _passwordVisible : bool default takes true
  final bool _passwordVisible;

  const LoginScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
    bool passwordVisible = true,
  }) : _passwordVisible = passwordVisible;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget._passwordVisible;
  }

  @override
  void dispose() {
    // Dispose only the TextEditingController arguments
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const red = Color.fromARGB(218, 226, 37, 24);

    const String googleIconUrl =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // Horizontally of the Column will be : min
          mainAxisSize: MainAxisSize.min,
          // Verticale of the Column will be : center
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 28),

            const Text(
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50,
              ),
            ),

            Image.asset(
              'assets/images/seahorse.png',
              width: 80,
              height: 60,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 28),

                  TextFieldInput(
                    controller: widget.emailController,
                    ispassword: false,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: null,
                  ),

                  const SizedBox(height: 24),

                  TextFieldInput(
                    controller: widget.passwordController,
                    ispassword: !_passwordVisible,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: red,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(red),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Forgot your login details? '),
                      Text(
                        'Get help logging in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Flexible(flex: 0, child: SizedBox.shrink()),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Divider(thickness: 2),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account "),
                        TextButton(
                          // onPressed: () {},
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: const [
                      Flexible(child: Divider(thickness: 2)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(' OR '),
                      ),
                      Flexible(child: Divider(thickness: 2)),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Image.network(
                  //       googleIconUrl,
                  //       width: 40,
                  //       height: 40,
                  //       errorBuilder: (context, error, stackTrace) {
                  //         return const SizedBox(width: 40, height: 40);
                  //       },
                  //     ),
                  //     const SizedBox(width: 10),
                  //     const Text('Sign in with Google'),
                  //   ],
                  // ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/google.svg',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text('Sign in with Google'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
