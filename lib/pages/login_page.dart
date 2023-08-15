import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  // Editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordObscured = true;

  // Function to handle the signup
  void _handleSignUp() {
    if (_formkey.currentState!.validate()) {
      // ignore: unused_local_variable
      String email = emailController.text;
      // ignore: unused_local_variable
      String password = passwordController.text;
    }
  }

  // Function to handle "Forgot Password" button
  void _handleForgotPassword() {
    // Implement your logic for handling forgot password here

    print('Forgot Password tapped!');
  }

  @override
  Widget build(BuildContext context) {
    // Email Address field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Email Address",
        hintText: 'hello@example.com',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );

    // Password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: passwordObscured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelText: "Password",
        hintText: '●●●●●●●●●●●●●●',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordObscured = !passwordObscured;
            });
          },
          icon: Icon(
            passwordObscured ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );

    // Login Button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      color: const Color.fromARGB(255, 35, 104, 253),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: _handleSignUp,
        child: const Text(
          "Log In",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );

    // Forgot Password button
    final forgotPasswordButton = TextButton(
      onPressed: _handleForgotPassword,
      child: const Text(
        "Forgot Password?",
        style: TextStyle(
          color: Color.fromARGB(255, 73, 161, 255),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Login_In.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 312,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 28,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 312,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome back to the ',
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 2,
                              ),
                            ),
                            TextSpan(
                              text: 'iNfo',
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 35),
                    passwordField,
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: forgotPasswordButton,
                    ),
                    const SizedBox(height: 25),
                    loginButton,
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFF007AFF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}