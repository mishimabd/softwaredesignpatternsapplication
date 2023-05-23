import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:softwaredesignpatternsapplication/screens/navbar.dart';

class LoginApp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MainPage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  // Вход в систему успешен, выполните необходимые действия
                  Navigator.pushNamed(context, '/home');
                  print('Вход в систему успешен: ${userCredential.user!.email}');
                } catch (e) {
                  // Обработка ошибок входа в систему
                  print('Ошибка входа в систему: $e');
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
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page!'),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Profile'),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            SizedBox(height: 16.0),
            TextButton(
              child: Text('Account Info'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Account Info'),
                      content: Text('Email: ${user?.email ?? 'Unknown'}'),
                      actions: [
                        ElevatedButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Page'),
            SizedBox(height: 16.0),
            Text('Email: ${user?.email ?? 'Unknown'}'),
          ],
        ),
      ),
    );
  }
}