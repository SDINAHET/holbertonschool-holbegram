import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'signup_screen.dart';
import '../methods/auth_methods.dart';

import 'package:provider/provider.dart';
import '../providers/user_provider.dart';




class LoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  // _passwordVisible : bool default takes true
  final bool _passwordVisible;

  const LoginScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
    bool passwordVisible = false,
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
                      // onPressed: () {},
                      onPressed: () async {
                        final email = widget.emailController.text.trim();
                        final password = widget.passwordController.text.trim();

                        final res = await AuthMethode().login(email: email, password: password);

                        if (!mounted) return;

                        if (res == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('success')),
                          );


                          await Provider.of<UserProvider>(context, listen: false).refreshUser();

                          if (!mounted) return;
                          Navigator.pushReplacementNamed(context, '/home');
                          // TODO: quand tu auras un HomeScreen / route '/home'
                          // Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(res)),
                          );
                        }
                      },
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
                        // TextButton(
                        //   // onPressed: () {},
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, '/signup');
                        //   },
                        //   child: const Text(
                        //     'Sign up',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       color: red,
                        //     ),
                        //   ),
                        // ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(
                                  emailController: TextEditingController(),
                                  usernameController: TextEditingController(),
                                  passwordController: TextEditingController(),
                                  passwordConfirmController: TextEditingController(),
                                ),
                              ),
                            );
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
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SvgPicture.asset(
                  //       'assets/icons/google.svg',
                  //       width: 40,
                  //       height: 40,
                  //     ),
                  //     const SizedBox(width: 10),
                  //     const Text('Sign in with Google'),
                  //   ],
                  // ),
                  InkWell(
                    onTap: () async {
                      final res = await AuthMethode().signInWithGoogle();

                      if (!mounted) return;

                      if (res == "success") {
                        await Provider.of<UserProvider>(context, listen: false).refreshUser();
                        if (!mounted) return;

                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      } else if (res != "cancelled") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(res)),
                        );
                      }
                    },
                    child: Row(
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
