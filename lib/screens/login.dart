import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:softwaredesignpatternsapplication/screens/navbar.dart';

class LoginApp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MainPage(),
        '/register': (context) => RegisterPage(),

      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;

                try {
                  UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  // Successful login, perform necessary actions
                  Navigator.pushNamed(context, '/home');
                  print('Login successful: ${userCredential.user!.email}');
                } catch (e) {
                  // Handle login errors
                  print('Login error: $e');
                }
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Sign In with Google'),
              onPressed: () async {
                try {
                  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
                  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
                  final AuthCredential credential = GoogleAuthProvider.credential(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken,
                  );
                  final UserCredential userCredential = await _auth.signInWithCredential(credential);
                  // Successful Google login, perform necessary actions
                  Navigator.pushNamed(context, '/home'); // Updated navigation to '/home'
                  print('Google login successful: ${userCredential.user!.email}');
                } catch (e) {
                  // Handle Google login errors
                  print('Google login error: $e');
                }
              },
            ),

            SizedBox(height: 16.0),
            TextButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            SizedBox(height: 16.0),
            TextButton(
              child: Text('Login as Guest'),
              onPressed: () async {
                try {
                  UserCredential userCredential = await _auth.signInAnonymously();
                  // Successful guest login, perform necessary actions
                  Navigator.pushNamed(context, '/home');
                  print('Guest login successful: ${userCredential.user!.uid}');
                } catch (e) {
                  // Handle guest login errors
                  print('Guest login error: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;

                try {
                  UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  // Successful registration, perform necessary actions
                  Navigator.pushNamed(context, '/home');
                  print('Registration successful: ${userCredential.user!.email}');
                } catch (e) {
                  // Handle registration errors
                  print('Registration error: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Remaining classes remain the same...
