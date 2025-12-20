import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'login_screen.dart';
import 'upload_image_screen.dart';


class SignUp extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;

  final bool _passwordVisible;

  SignUp({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
    bool passwordVisible = false,
  }) : _passwordVisible = passwordVisible;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late bool _passwordVisible;
  late bool _confirmPasswordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget._passwordVisible;
    _confirmPasswordVisible = widget._passwordVisible;
  }

  // @override
  // void dispose() {
  //   widget.emailController.dispose();
  //   widget.usernameController.dispose();
  //   widget.passwordController.dispose();
  //   widget.passwordConfirmController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    const red = Color.fromARGB(218, 226, 37, 24);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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

            const SizedBox(height: 14),

            const Text(
              'Sign up to see photos and videos\nfrom your friends.',
              textAlign: TextAlign.center,
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
                    controller: widget.usernameController,
                    ispassword: false,
                    hintText: 'Full Name',
                    keyboardType: TextInputType.text,
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
                        setState(() => _passwordVisible = !_passwordVisible);
                      },
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: red,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  TextFieldInput(
                    controller: widget.passwordConfirmController,
                    // ispassword: !_passwordVisible,
                    ispassword: !_confirmPasswordVisible,
                    hintText: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      onPressed: () {
                        // setState(() => _passwordVisible = !_passwordVisible);
                        setState(() => _confirmPasswordVisible = !_confirmPasswordVisible);
                      },
                      icon: Icon(
                        // _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: red,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // SizedBox(
                  //   height: 48,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ButtonStyle(
                  //       backgroundColor: WidgetStateProperty.all(red),
                  //     ),
                  //     // onPressed: () {},
                  // //   onPressed: () async {
                  // //     final email = widget.emailController.text.trim();
                  // //     final username = widget.usernameController.text.trim();
                  // //     final password = widget.passwordController.text.trim();
                  // //     final confirm = widget.passwordConfirmController.text.trim();

                  // //     if (email.isEmpty || username.isEmpty || password.isEmpty || confirm.isEmpty) {
                  // //       ScaffoldMessenger.of(context).showSnackBar(
                  // //         const SnackBar(content: Text('Please fill in all fields.')),
                  // //       );
                  // //       return;
                  // //     }

                  // //     if (password != confirm) {
                  // //       ScaffoldMessenger.of(context).showSnackBar(
                  // //         const SnackBar(content: Text('Passwords do not match.')),
                  // //       );
                  // //       return;
                  // //     }

                  // //     // ✅ Task 7: aller sur l'écran AddPicture pour choisir l'image
                  // //     Navigator.push(
                  // //       context,
                  // //       MaterialPageRoute(
                  // //         builder: (_) => AddPicture(
                  // //           email: email,
                  // //           password: password,
                  // //           username: username,
                  // //         ),
                  // //       ),
                  // //     );
                  // //   },
                  // //     child: const Text(
                  // //       'Sign up',
                  // //       style: TextStyle(color: Colors.white),
                  // //     ),
                  // //   ),
                  // // ),
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => AddPicture(
                  //         email: _emailController.text.trim(),
                  //         username: _usernameController.text.trim(),
                  //         password: _passwordController.text.trim(),
                  //       ),
                  //     ),
                  //   );
                  // },
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(red),
                    ),
                    onPressed: () {
                      final email = widget.emailController.text.trim();
                      final username = widget.usernameController.text.trim();
                      final password = widget.passwordController.text.trim();
                      final confirm = widget.passwordConfirmController.text.trim();

                      if (email.isEmpty || username.isEmpty || password.isEmpty || confirm.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill in all fields.')),
                        );
                        return;
                      }

                      if (password != confirm) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Passwords do not match.')),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPicture(
                            email: email,
                            username: username,
                            password: password,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),


                  const SizedBox(height: 18),
                ],
              ),
            ),

            const Divider(thickness: 2),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account? '),
                  // TextButton(
                  //   onPressed: () {
                  //     // si tu viens du login -> pop()
                  //     // Navigator.pop(context);

                  //     // alternative si tu utilises les routes:
                  //     Navigator.pushNamed(context, '/login');
                  //   },
                  //   child: const Text(
                  //     'Log in',
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
                          builder: (context) => LoginScreen(
                            emailController: TextEditingController(),
                            passwordController: TextEditingController(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: red,
                      ),
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
