// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:device_preview/device_preview.dart';

// import 'firebase_options.dart';
// import 'screens/login_screen.dart';
// // import 'screens/signup_screen.dart';
// // import 'screens/upload_image_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Holbegram',
//       theme: ThemeData(useMaterial3: true),
//       home: const LoginScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:device_preview/device_preview.dart';

// import 'firebase_options.dart';
// import 'screens/login_screen.dart';
// import 'screens/signup_screen.dart';
// import 'screens/upload_image_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(
//     DevicePreview(
//       enabled: true, // 🔥 mets false en prod
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Holbegram',

//       // 🔥 IMPORTANT pour DevicePreview
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,

//       theme: ThemeData(
//         useMaterial3: true,
//       ),

//       home: const LoginScreen(),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:device_preview/device_preview.dart';

// import 'firebase_options.dart';
// import 'screens/login_screen.dart';
// import 'screens/signup_screen.dart';
// import 'screens/upload_image_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode, // ✅ actif en debug, désactivé en release
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Holbegram',

//       // ✅ IMPORTANT pour DevicePreview
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,

//       theme: ThemeData(useMaterial3: true),

//       // ✅ Routes (pratique pour naviguer)
//       initialRoute: '/login',
//       routes: {
//         '/login': (_) => const LoginScreen(),
//         '/signup': (_) => const SignupScreen(),
//         '/upload': (_) => const UploadImageScreen(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/upload_image_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ✅ Controllers créés UNE SEULE FOIS
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // ✅ On les dispose ici (option propre)
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holbegram',

      // ✅ IMPORTANT pour DevicePreview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      theme: ThemeData(useMaterial3: true),

      initialRoute: '/login',
      routes: {
        // '/login': (_) => LoginScreen(
        //       emailController: _emailController,
        //       passwordController: _passwordController,
        //       passwordVisible: true, // ✅ default true comme consigne
        //     ),
        '/login': (_) => LoginScreen(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ),
        // '/signup': (_) => const SignupScreen(),
        '/signup': (_) => SignUp(
          emailController: TextEditingController(),
          usernameController: TextEditingController(),
          passwordController: TextEditingController(),
          passwordConfirmController: TextEditingController(),
        ),
        '/upload': (_) => const UploadImageScreen(),
      },
    );
  }
}
