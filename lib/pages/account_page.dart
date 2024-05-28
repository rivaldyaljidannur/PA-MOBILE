import 'package:flutter/material.dart';
import 'package:skena/pages/drop_page.dart';
import 'package:skena/pages/news_page.dart';
import 'package:skena/pages/saves_page.dart';
import 'package:skena/pages/signup.dart';
import 'package:skena/widgets/navbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  int _currentIndex = 3;

  void _onNavbarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DropPage()),
        );
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SavedPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),

        actions: [
          // TextButton(
          //   onPressed: () {
          //     // Close action
          //   },
          //   child: const Text(
          //     'Close',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to HYPEABYSS",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Login with your HYPEABYSS account.'),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Login with Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text("Login"),
               onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                const Text("Doesn't Have Account?"),
                TextButton(onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUp ()),
                        );
}, child: Text("Register Here"))
              ],
            ),
            const Text(
              'By proceeding, you agree to our Terms of Use and Privacy Policy.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(
          currentIndex: _currentIndex,
          onItemSelected: _onNavbarItemTapped,
        ),
    );
  }
}
