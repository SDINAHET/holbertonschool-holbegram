// import 'package:flutter/material.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Signup Screen'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../widgets/text_field.dart';
// import 'login_screen.dart';


// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _emailCtrl = TextEditingController();
//   final _nameCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   final _confirmCtrl = TextEditingController();

//   bool _obscurePass = true;
//   bool _obscureConfirm = true;

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _nameCtrl.dispose();
//     _passCtrl.dispose();
//     _confirmCtrl.dispose();
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

//                   /// Logo
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
//                     ),
//                   ),

//                   const SizedBox(height: 18),

//                   const Text(
//                     'Sign up to see photos and videos\nfrom your friends.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black54,
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
//                     hintText: 'Full Name',
//                     controller: _nameCtrl,
//                   ),
//                   const SizedBox(height: 12),

//                   CustomTextField(
//                     hintText: 'Password',
//                     controller: _passCtrl,
//                     isPassword: true,
//                     obscureText: _obscurePass,
//                     onToggleObscure: () =>
//                         setState(() => _obscurePass = !_obscurePass),
//                   ),
//                   const SizedBox(height: 12),

//                   CustomTextField(
//                     hintText: 'Confirm Password',
//                     controller: _confirmCtrl,
//                     isPassword: true,
//                     obscureText: _obscureConfirm,
//                     onToggleObscure: () =>
//                         setState(() => _obscureConfirm = !_obscureConfirm),
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
//                       onPressed: () {
//                         // TODO: Firebase signup
//                       },
//                       child: const Text(
//                         'Sign up',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 18),
//                   const Divider(height: 1),
//                   const SizedBox(height: 18),

//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     const Text('Have an account  '),
//                   //     GestureDetector(
//                   //       onTap: () {
//                   //         Navigator.pop(context);
//                   //       },
//                   //       child: const Text(
//                   //         'Log in',
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
//                       const Text('Have an account '),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     Navigator.pop(context);
//                       //   },
//                       //   child: const Text(
//                       //     'Log in',
//                       //     style: TextStyle(
//                       //       color: red,
//                       //       fontWeight: FontWeight.bold,
//                       //     ),
//                       //   ),
//                       // ),
//                       _HoverLink(
//                         text: 'Log in',
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         style: const TextStyle(
//                           color: red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         hoverStyle: const TextStyle(
//                           color: red,
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ],
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

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _emailCtrl = TextEditingController();
//   final _nameCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   final _confirmCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _nameCtrl.dispose();
//     _passCtrl.dispose();
//     _confirmCtrl.dispose();
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
//                   const SizedBox(height: 18),
//                   const Text(
//                     'Sign up to see photos and videos\nfrom your friends.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 15, color: Colors.black54),
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
//                     hintText: 'Full Name',
//                     controller: _nameCtrl,
//                     ispassword: false,
//                     keyboardType: TextInputType.text,
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
//                   const SizedBox(height: 12),
//                   TextFieldInput(
//                     hintText: 'Confirm Password',
//                     controller: _confirmCtrl,
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
//                         'Sign up',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 18),
//                   const Divider(height: 1),
//                   const SizedBox(height: 18),

//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       const Text('Have an account '),
//                       _HoverLink(
//                         text: 'Log in',
//                         onTap: () => Navigator.pop(context),
//                         style: const TextStyle(
//                           color: red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
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

import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _nameCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD94335);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 26),

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

                  const SizedBox(height: 18),

                  const Text(
                    'Sign up to see photos and videos\nfrom your friends.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),

                  const SizedBox(height: 22),

                  TextFieldInput(
                    hintText: 'Email',
                    controller: _emailCtrl,
                    ispassword: false,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 12),

                  TextFieldInput(
                    hintText: 'Full Name',
                    controller: _nameCtrl,
                    ispassword: false,
                    keyboardType: TextInputType.text,
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 12),

                  TextFieldInput(
                    hintText: 'Password',
                    controller: _passCtrl,
                    ispassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: null,
                  ),
                  const SizedBox(height: 12),

                  TextFieldInput(
                    hintText: 'Confirm Password',
                    controller: _confirmCtrl,
                    ispassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: null,
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),
                  const Divider(height: 1),
                  const SizedBox(height: 18),

                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text('Have an account '),
                      _HoverLink(
                        text: 'Log in',
                        onTap: () => Navigator.pop(context),
                        style: const TextStyle(
                          color: red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
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
