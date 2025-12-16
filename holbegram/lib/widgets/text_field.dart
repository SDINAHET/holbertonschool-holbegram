// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     this.obscureText = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final bool isPassword;
//   final bool obscureText;
//   final VoidCallback? onToggleObscure;
//   final TextEditingController? controller;
//   final TextInputType keyboardType;

//   const CustomTextField({
//     super.key,
//     required this.hintText,
//     this.isPassword = false,
//     this.obscureText = false,
//     this.onToggleObscure,
//     this.controller,
//     this.keyboardType = TextInputType.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: isPassword ? obscureText : false,
//       decoration: InputDecoration(
//         hintText: hintText,
//         filled: true,
//         fillColor: const Color(0xFFF2F2F2),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(6),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: isPassword
//             ? IconButton(
//                 onPressed: onToggleObscure,
//                 icon: Icon(
//                   obscureText ? Icons.visibility_off : Icons.visibility,
//                   color: Colors.red.shade400,
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleObscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleObscure,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    const fill = Color(0xFFF2F2F2);
    const hint = Color(0xFF8E8E93); // gris iOS-like

    return SizedBox(
      height: 46, // hauteur proche de la maquette
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ? obscureText : false,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15, color: hint),
          filled: true,
          fillColor: fill,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4), // moins arrondi (comme ta capture)
            borderSide: BorderSide.none,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onToggleObscure,
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFFD94335), // même rouge que le bouton
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
